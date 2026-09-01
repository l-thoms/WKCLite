#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_camera.h"
#include "display/display_common.h"
#include "display/display_control.h"
#include "io/io_extend.h"
#include "io/filesystem.h"
#include "esp_log.h"
#include "esp_jpeg_common.h"
#include "esp_jpeg_enc.h"
#include "profile/settings.h"
#include "io/filesystem.h"
#include "camera_control.h"

#define CAMERA_PROFILE_PATH "/data_dynamic/profile/camera.bin"

#define CAMERA_WRITE_REG(addr, data) \
{ \
    int ret = io_extend_write_camera(addr, data); \
    if (ret) \
    { \
        ESP_LOGE("CAMERA_CONTROL", "Failed to write camera, %02x, %02x", addr, data); \
        return ret; \
    } \
}

display_format_t active_format;
static bool init = false;
static bool camera_control_ready = false;
static bool camera_is_powerdown = true;
static uint8_t *capture_processing_buffer = NULL;
static uint8_t *capture_result_buffer = NULL;

static camera_control_t camera_control = { 0 };

static camera_config_t camera_config = {
    .pin_pwdn  = -1,
    .pin_reset = -1,
    .pin_xclk = -1,
    .pin_sccb_sda = -1,
    .pin_sccb_scl = -1,

    .pin_d7 = GPIO_NUM_14,
    .pin_d6 = GPIO_NUM_13,
    .pin_d5 = GPIO_NUM_12,
    .pin_d4 = GPIO_NUM_11,
    .pin_d3 = GPIO_NUM_10,
    .pin_d2 = GPIO_NUM_9,
    .pin_d1 = GPIO_NUM_46,
    .pin_d0 = GPIO_NUM_3,
    .pin_vsync = GPIO_NUM_6,
    .pin_href = GPIO_NUM_5,
    .pin_pclk = GPIO_NUM_4,

    .xclk_freq_hz = 27000000,
    .ledc_timer = -1,
    .ledc_channel = -1,

    .pixel_format = PIXFORMAT_YUV422,
    .frame_size = FRAMESIZE_PAL,

    .fb_count = 2,
    .fb_location = CAMERA_FB_IN_PSRAM,
    .grab_mode = CAMERA_GRAB_WHEN_EMPTY,
};

camera_control_t *camera_control_get_current()
{
    return &camera_control;
}

void camera_control_reset()
{
    camera_control.channel = 0;
    camera_control.resolution = CAMERA_RESOLUTION_DEFAULT;
    camera_control.quality = CAMERA_QUALITY_HIGH;
    camera_control.timeout = CAMERA_TIMEOUT_DISABLED;
    camera_control.brightness = 0;
    camera_control.contrast = 0;
    camera_control.saturation = 0;
    saa7113_config_t saa7113_default = SAA7113_CONFIG_DEFAULT();
    tw9910_config_t tw9910_default = TW9910_CONFIG_DEFAULT();
    memcpy(&camera_control.device_config.saa7113, &saa7113_default,
            sizeof(saa7113_config_t));
    memcpy(&camera_control.device_config.tw9910, &tw9910_default,
            sizeof(tw9910_config_t));
    wkc_save(CAMERA_PROFILE_PATH, (char*)&camera_control, sizeof(camera_control));
}

static int camera_control_update_saa7113()
{
    saa7113_config_t *saa7113 = &camera_control.device_config.saa7113;
    int fuse_calculated = saa7113->fuse == SAA7113_FUSE_BYPASS ? 0 :
                          saa7113->fuse == SAA7113_FUSE_AMP ? 2 : 3;
    int gain_calculated = (int)(511 / 20.f * (saa7113->gain + 10));
    int brightness_calculated = (int)(255 / 20.f * (camera_control.brightness + 10));
    int contrast_calculated = (int)(127 / 20.f * (camera_control.contrast + 10));
    int saturation_calculated = (int)(127 / 20.f * (camera_control.saturation + 10));
    int hue_calculated = (int)(127 / 36.f * ((saa7113->hue + 36) % 36));
    int chroma_gain_calculated = saa7113->chroma_gain_control > 0 ?
        (int)(saa7113->chroma_gain_control / 10.f * (127 - 36) + 36) :
        (int)(saa7113->chroma_gain_control / 10.f * 36 + 36);

    CAMERA_WRITE_REG(0x01, 0x08);
    CAMERA_WRITE_REG(0x02, (fuse_calculated << 6) |
        camera_control.channel);
    CAMERA_WRITE_REG(0x03, 0x20 |
        (!saa7113->white_peak_control << 4) |
        (!saa7113->auto_gain << 3) | (!saa7113->auto_gain << 2) |
        (gain_calculated >> 8 << 1) | (gain_calculated >> 8));
    CAMERA_WRITE_REG(0x04, gain_calculated % 256);
    CAMERA_WRITE_REG(0x05, gain_calculated % 256);
    CAMERA_WRITE_REG(0x06, 0xE9);
    CAMERA_WRITE_REG(0x07, 0x0D);
    CAMERA_WRITE_REG(0x08, 0x98);
    CAMERA_WRITE_REG(0x09, (!saa7113->bandpass_enabled << 7) |
        (saa7113->prefilter_enabled << 6) | (saa7113->bandpass_center << 4) |
        (saa7113->auto_gain_interval << 2) | saa7113->aperture);
    CAMERA_WRITE_REG(0x0A, brightness_calculated);
    CAMERA_WRITE_REG(0x0B, (saa7113->invert << 7) | contrast_calculated);
    CAMERA_WRITE_REG(0x0C, (saa7113->invert << 7) | saturation_calculated);
    CAMERA_WRITE_REG(0x0D, (saa7113->invert << 7) | hue_calculated);
    saa7113_color_standard_t selected_standard =
        saa7113->color_standard == SAA7113_COLOR_STANDARD_UNKNOWN ?
        saa7113->color_standard_auto == SAA7113_COLOR_STANDARD_UNKNOWN ?
        SAA7113_COLOR_STANDARD_PAL_NTSC :
        saa7113->color_standard_auto : saa7113->color_standard;
    CAMERA_WRITE_REG(0x0E, (SAA7113_COLOR_STANDARD_CALCULATE(selected_standard) << 4) |
        (!saa7113->chroma_comb_filter_enabled << 3) |
        saa7113->chroma_bandwidth);
    CAMERA_WRITE_REG(0x0F, (!saa7113->chroma_gain_auto << 7) | chroma_gain_calculated);
    CAMERA_WRITE_REG(0x10, camera_control.current_format ==
                           DISPLAY_FORMAT_NTSC ? 0x00 : 0x08);
    CAMERA_WRITE_REG(0x11, 0x0C | (saa7113->raw_output_enabled << 1) |
        !saa7113->chroma_killer_enabled);
    CAMERA_WRITE_REG(0x12, 0x01);
    CAMERA_WRITE_REG(0x12, 0x9B);
    CAMERA_WRITE_REG(0x13, 0x10);
    CAMERA_WRITE_REG(0x14, 0x00);
    CAMERA_WRITE_REG(0x15, 0x00);
    CAMERA_WRITE_REG(0x16, 0x00);
    CAMERA_WRITE_REG(0x17, 0x00);
    return 0;
}

static int camera_control_update_tw9910()
{
    tw9910_config_t *tw9910 = &camera_control.device_config.tw9910;

    int vdelay = camera_control.current_format == DISPLAY_FORMAT_NTSC ? 20 : 24;
    int vactive = camera_control.current_format == DISPLAY_FORMAT_NTSC ? 240 : 288;
    int hdelay = camera_control.current_format == DISPLAY_FORMAT_NTSC ? 10 : 5;
    int hactive = 720;

    int brightness_calculated = (int)(127 / 10.f * camera_control.brightness);
    int contrast_calculated = camera_control.contrast < 0 ?
                              (int)(9.2f * (camera_control.contrast + 10)) :
                              92 + (int)(16.3f * camera_control.contrast);
    int saturation_calculated = (int)(128 + 127 / 10.f * camera_control.saturation);
    if (saturation_calculated < 0) saturation_calculated = 0;
    else if (saturation_calculated > 255) saturation_calculated = 255;
    int ntsc_hue_correct_calculated = (int)(127 / 10.f * tw9910->ntsc_hue_correct);

    int std_calculated = (tw9910->color_standard + 7) % 8;

    int prefilter_calculated = tw9910->prefilter == TW9910_PREFILTER_BYPASS ? 4 :
                               tw9910->prefilter == TW9910_PREFILTER_HORIZONTAL_ENHANCEMENT ? 5 :
                               tw9910->prefilter == TW9910_PREFILTER_CIF ? 1 :
                               tw9910->prefilter == TW9910_PREFILTER_QCIF ? 2 :
                               tw9910->prefilter == TW9910_PREFILTER_ICON ? 3 :
                               0;

    int clamping_mode_calculated = tw9910->clamping_mode == TW9910_CLAMPING_MODE_SYNC_TOP ? 0 :
                                   tw9910->clamping_mode == TW9910_CLAMPING_MODE_PEDESTAL ? 2 :
                                   1;

    int manual_gain_calculated = tw9910->manual_gain_level == 0 ? 0xF0 :
        tw9910->manual_gain_level > 0 ?
        (int)(0xF0 + tw9910->manual_gain_level / 10.f * (0x1FF - 0xF0)) :
        (int)(0xF0 + tw9910->manual_gain_level / 10.f * 0xF0);
    int white_peak_calculated = tw9910->white_peak_threshold == 0 ? 0xD8 :
        tw9910->white_peak_threshold > 0 ?
        (int)(0xD8 + tw9910->white_peak_threshold / 10.f * (0xFF - 0xD8)) :
        (int)(0xD8 + tw9910->white_peak_threshold / 10.f * 0xD8);
    int clamping_calculated = tw9910->clamping_level == 0 ? 0x3C :
        tw9910->clamping_level > 0 ?
        (int)(0x3C + tw9910->clamping_level / 10.f * (0x7F - 0x3C)) :
        (int)(0x3C + tw9910->clamping_level / 10.f * 0x3C);
    int color_killer_min_calculated = tw9910->color_killer_min == 0 ? 0x28 :
        tw9910->color_killer_min > 0 ?
        (int)(0x28 + tw9910->color_killer_min / 10.f * (0x3F - 0x28)) :
        (int)(0x28 + tw9910->color_killer_min / 10.f * 0x28);

    CAMERA_WRITE_REG(0x1C, std_calculated);

    int blank_level_calculated;
    if (tw9910->blank_level == TW9910_BLANK_LEVEL_75)
    {
        blank_level_calculated = 1;
    }
    else if (tw9910->blank_level == TW9910_BLANK_LEVEL_0)
    {
        blank_level_calculated = 0;
    }
    else if (tw9910->color_standard == TW9910_COLOR_STANDARD_AUTO)
    {
        if (tw9910->last_color_standard != TW9910_COLOR_STANDARD_AUTO)
            vTaskDelay(100 / portTICK_PERIOD_MS);
        uint8_t read_result;
        if (io_extend_read_camera(0x1C, &read_result))
            return 1;
        int stdnow = (read_result >> 4) & 0x7;
        blank_level_calculated = stdnow == 0 || stdnow == 3 ||
                                 stdnow == 4 || stdnow == 6;
    }
    else if (tw9910->color_standard == TW9910_COLOR_STANDARD_NTSC ||
             tw9910->color_standard == TW9910_COLOR_STANDARD_NTSC443)
    {
        blank_level_calculated = 1;
    }
    else
    {
        blank_level_calculated = 0;
    }
    tw9910->last_color_standard = tw9910->color_standard;

    CAMERA_WRITE_REG(0x02, 0x40 | (camera_control.channel << 2));
    CAMERA_WRITE_REG(0x03, 0x20);
    CAMERA_WRITE_REG(0x04, tw9910->color_killer_hysteresis << 5);
    CAMERA_WRITE_REG(0x05, 0x00);
    CAMERA_WRITE_REG(0x06, !tw9910->auto_gain << 4);
    CAMERA_WRITE_REG(0x07, ((vdelay >> 8) & 0x03) << 6 |
                           ((vactive >> 8) & 0x03) << 4 |
                           ((hdelay >> 8) & 0x03) << 2 |
                           ((hactive >> 8) & 0x03));
    CAMERA_WRITE_REG(0x08, vdelay & 0xFF);
    CAMERA_WRITE_REG(0x09, vactive & 0xFF);
    CAMERA_WRITE_REG(0x0A, hdelay & 0xFF);
    CAMERA_WRITE_REG(0x0B, hactive & 0xFF);
    CAMERA_WRITE_REG(0x0C, (tw9910->chroma_bandpass_width << 7) |
        (1 << 6) |
        (0 << 5) |
        (blank_level_calculated << 4) |
        (!!tw9910->adaptive_comb_filter_enabled << 3) |
        ((tw9910->operation_mode & 1) << 2) |
        (0 << 1) |
        !tw9910->pal_delay_line_enabled);
    CAMERA_WRITE_REG(0x10, brightness_calculated);  // Reg 0x10 BRIGHT
    CAMERA_WRITE_REG(0x11, contrast_calculated);    // Reg 0x11 CONTRAST
    CAMERA_WRITE_REG(0x12, (tw9910->sharp_center << 7) | (1 << 6) |
        ((tw9910->cti_level & 3) << 4) | tw9910->sharpness);
    CAMERA_WRITE_REG(0x13, saturation_calculated);  // Reg 0x13 SAT_U
    CAMERA_WRITE_REG(0x14, saturation_calculated);  // Reg 0x14 SAT_V
    CAMERA_WRITE_REG(0x15, ntsc_hue_correct_calculated);
    CAMERA_WRITE_REG(0x17, (tw9910->sharpness_coring << 4) |
        (tw9910->vertical_peaking_level & 7));
    CAMERA_WRITE_REG(0x18, ((tw9910->cti_coring & 3) << 6) |
        ((tw9910->chroma_coring & 3) << 4) |
        ((tw9910->vertical_peaking_coring & 3) << 2) |
        (tw9910->cif_level & 3));
    CAMERA_WRITE_REG(0x19, 0x40);
    CAMERA_WRITE_REG(0x1A, (!!tw9910->luma_antialias << 3) |
        (!!tw9910->chroma_antialias << 1));
    CAMERA_WRITE_REG(0x21, ((tw9910->auto_gain_max_correction_level & 0xF) << 4) |
        ((tw9910->peak_agc_loop_gain_control & 0x7) << 1) |
        ((manual_gain_calculated >> 8) & 1));
    CAMERA_WRITE_REG(0x22, manual_gain_calculated & 0xFF);
    CAMERA_WRITE_REG(0x23, white_peak_calculated);
    CAMERA_WRITE_REG(0x24, clamping_calculated);
    CAMERA_WRITE_REG(0x2A, ((tw9910->color_killer_max & 3) << 6) |
        color_killer_min_calculated);
    CAMERA_WRITE_REG(0x2B, (tw9910->comb_filter_strength << 7) |
        ((tw9910->adaptive_comb_filter_threshold_control_1 & 7) << 4) |
        (tw9910->adaptive_comb_filter_threshold_control_2 & 7));
    CAMERA_WRITE_REG(0x2C, (!!tw9910->color_killer_fast_mode_enabled << 7) |
        ((tw9910->luma_delay & 7) << 4) | (0 << 3) | prefilter_calculated);
    CAMERA_WRITE_REG(0x2E, (2 << 6) | (2 << 4) | (1 << 2) |
        (tw9910->chroma_low_pass & 3));
    CAMERA_WRITE_REG(0x2F, !!tw9910->noisy_color_killer_enabled << 7 |
        !!tw9910->noisy_color_killer_enabled << 6 |
        !!tw9910->noisy_color_killer_enabled << 5 |
        !!tw9910->blue_stretch);
    CAMERA_WRITE_REG(0x33, ((tw9910->luma_hf_noise_reduction_level & 3) << 4) |
        (clamping_mode_calculated << 2) | 1);
    CAMERA_WRITE_REG(0x35, !tw9910->luma_clamp_enabled << 6 |
        !tw9910->chroma_clamp_enabled << 5);
    return 0;
}

int camera_powerdown()
{
    display_control_record_operate_time();
    camera_control_ready = false;
    camera_is_powerdown = true;
    esp_camera_deinit();
    init = false;
    return gpio_write(GPIO_NUM_EXTEND | 10, 0);
}

int camera_poweron()
{
    display_control_record_operate_time();
    camera_control_ready = false;
    if (!init)
    {
        if(camera_control_init())
            return 1;
    }
    if (gpio_write(GPIO_NUM_EXTEND | 10, 1)) return 1;
    vTaskDelay(200 / portTICK_PERIOD_MS);
    camera_is_powerdown = false;
    int ret = camera_control_update();
    if (ret == 0)
        camera_control_ready = true;
    return ret;
}

static int camera_control_saa7113_infer_color_standard()
{
    static saa7113_color_standard_t infer_order[] = {
        SAA7113_COLOR_STANDARD_PAL_NTSC,
        SAA7113_COLOR_STANDARD_PAL60_NTSC_N,
        SAA7113_COLOR_STANDARD_PAL_N_NTSC_443,
        SAA7113_COLOR_STANDARD_SECAM,
        SAA7113_COLOR_STANDARD_PAL60_443_NTSC50_443,
    };
    saa7113_config_t *saa7113 = &camera_control.device_config.saa7113;
    saa7113->color_standard_auto = SAA7113_COLOR_STANDARD_UNKNOWN;
    for (int i = 0; i < 5; i++)
    {
        CAMERA_WRITE_REG(0x0E, (SAA7113_COLOR_STANDARD_CALCULATE(
            infer_order[i]) << 4) |
        (!saa7113->chroma_comb_filter_enabled << 3) |
        saa7113->chroma_bandwidth);
        vTaskDelay(100 / portTICK_PERIOD_MS);
        CAMERA_WRITE_REG(0x13, 0x10);
        uint8_t read_result;
        if (io_extend_read_camera(0x1F, &read_result))
            return 1;
        if (read_result & 1)
        {
            saa7113->color_standard_auto = infer_order[i];
            ESP_LOGI("CAMERA_CONTROL", "Infer color format: %s",
                saa7113->color_standard_auto == SAA7113_COLOR_STANDARD_PAL_NTSC ?
                "PAL/NTSC" :
                saa7113->color_standard_auto == SAA7113_COLOR_STANDARD_PAL60_443_NTSC50_443 ?
                "NTSC50 4.43/PAL60 4.43" :
                saa7113->color_standard_auto == SAA7113_COLOR_STANDARD_PAL_N_NTSC_443 ?
                "PAL-N/NTSC 4.43" :
                saa7113->color_standard_auto == SAA7113_COLOR_STANDARD_PAL60_NTSC_N ?
                "NTSC-N/PAL60" :
                saa7113->color_standard_auto == SAA7113_COLOR_STANDARD_SECAM ?
                "SECAM" : "Unknown");
            return camera_control_update();
        }
    }

    return 1;
}

int camera_control_update()
{
    display_control_record_operate_time();
    camera_control_ready = false;
    // Save control
    if(wkc_save(CAMERA_PROFILE_PATH, (char*)&camera_control, sizeof(camera_control)))
        ESP_LOGW("CAMERA", "Cannot save options");

    int ret = 0;
    if (camera_control.device_type == CAMERA_DEVICE_SAA7113)
        ret = camera_control_update_saa7113();
    else if (camera_control.device_type == CAMERA_DEVICE_TW9910)
        ret = camera_control_update_tw9910();
    else
        ret = 1;

    if (ret)
    {
        ESP_LOGE("CAMERA", "Camera control update failed");
        return 1;
    }

    camera_control_ready = true;
    return 0;
}

static int camera_set_format_priv(display_format_t format, bool ignore_init)
{
    if (!ignore_init && !init)
    {
        ESP_LOGE("CAMERA", "Camera not initialized");
        return 1;
    }
    if (format == DISPLAY_FORMAT_UNDEFINDED) format = DISPLAY_FORMAT_PAL;
    if (format == camera_control.current_format && init) return 0;
    camera_control.current_format = format;
    esp_camera_deinit();
    camera_config.frame_size = format == DISPLAY_FORMAT_NTSC ?
                                         FRAMESIZE_NTSC : FRAMESIZE_PAL;
    int ret = esp_camera_init(&camera_config);
    if (ret)
    {
        ESP_LOGE("CAMERA", "Cannot set camera format");
        return ret;
    }
    return ret;
}

int camera_control_init()
{
    if (init) return 0;

    size_t profile_size;
    if (wkc_get_file_size(CAMERA_PROFILE_PATH, &profile_size) ||
        profile_size != sizeof(camera_control_t) ||
        wkc_open(CAMERA_PROFILE_PATH, (char*)&camera_control, sizeof(camera_control)))
        camera_control_reset();
    local_clamp(&camera_control.brightness, -10, 10);
    local_clamp(&camera_control.contrast, -10, 10);
    local_clamp(&camera_control.saturation, -10, 10);

    // SAA7113 clamp
    local_clamp(&camera_control.device_config.saa7113.gain, -10, 10);
    local_clamp(&camera_control.device_config.saa7113.chroma_gain_control, -10, 10);

    local_clamp((int*)&camera_control.device_config.saa7113.fuse, 0, 2);
    local_clamp((int*)&camera_control.device_config.saa7113.aperture, 0, 3);
    local_clamp((int*)&camera_control.device_config.saa7113.auto_gain_interval, 0, 1);
    local_clamp((int*)&camera_control.device_config.saa7113.bandpass_center, 0, 3);
    local_clamp((int*)&camera_control.device_config.saa7113.chroma_bandwidth, 0, 3);
    local_clamp((int*)&camera_control.device_config.saa7113.color_standard, 0, 5);

    // TW9910 clamp
    local_clamp(&camera_control.device_config.tw9910.operation_mode, 0, 1);
    local_clamp(&camera_control.device_config.tw9910.cti_level, 0, 3);
    local_clamp(&camera_control.device_config.tw9910.sharpness, 0, 15);
    local_clamp(&camera_control.device_config.tw9910.ntsc_hue_correct, -10, 10);
    local_clamp(&camera_control.device_config.tw9910.sharpness_coring, 0, 15);
    local_clamp(&camera_control.device_config.tw9910.vertical_peaking_level, 0, 7);
    local_clamp(&camera_control.device_config.tw9910.cti_coring, 0, 3);
    local_clamp(&camera_control.device_config.tw9910.chroma_coring, 0, 3);
    local_clamp(&camera_control.device_config.tw9910.vertical_peaking_coring, 0, 3);
    local_clamp(&camera_control.device_config.tw9910.auto_gain_max_correction_level, 0, 15);
    local_clamp(&camera_control.device_config.tw9910.peak_agc_loop_gain_control, 0, 7);
    local_clamp(&camera_control.device_config.tw9910.manual_gain_level, -10, 10);
    local_clamp(&camera_control.device_config.tw9910.white_peak_threshold, -10, 10);
    local_clamp(&camera_control.device_config.tw9910.clamping_level, -10, 10);
    local_clamp(&camera_control.device_config.tw9910.color_killer_max, 0, 3);
    local_clamp(&camera_control.device_config.tw9910.color_killer_min, -10, 10);
    local_clamp(&camera_control.device_config.tw9910.comb_filter_strength, 0, 1);
    local_clamp(&camera_control.device_config.tw9910.adaptive_comb_filter_threshold_control_1, 0, 7);
    local_clamp(&camera_control.device_config.tw9910.adaptive_comb_filter_threshold_control_2, 0, 7);
    local_clamp(&camera_control.device_config.tw9910.luma_delay, 0, 7);
    local_clamp(&camera_control.device_config.tw9910.luma_hf_noise_reduction_level, 0, 3);

    local_clamp((int*)&camera_control.device_config.tw9910.color_killer_hysteresis, 0, 3);
    local_clamp((int*)&camera_control.device_config.tw9910.blank_level, 0, 2);
    local_clamp((int*)&camera_control.device_config.tw9910.chroma_bandpass_width, 0, 2);
    local_clamp((int*)&camera_control.device_config.tw9910.sharp_center, 0, 1);
    local_clamp((int*)&camera_control.device_config.tw9910.cif_level, 0, 3);
    local_clamp((int*)&camera_control.device_config.tw9910.color_standard, 0, 7);
    local_clamp((int*)&camera_control.device_config.tw9910.prefilter, 0, 6);
    local_clamp((int*)&camera_control.device_config.tw9910.chroma_low_pass, 0, 4);
    local_clamp((int*)&camera_control.device_config.tw9910.clamping_mode, 0, 3);

    if (!capture_processing_buffer)
        capture_processing_buffer = jpeg_calloc_align(DISPLAY_WIDTH_PAL *
                                    DISPLAY_HEIGHT_PAL * 8, 16);
    if (!capture_processing_buffer)
    {
        ESP_LOGE("CAMERA", "Cannot allocate processing buffer.");
        return 1;
    }
    if (!capture_result_buffer)
        capture_result_buffer = jpeg_calloc_align(DISPLAY_WIDTH_PAL *
                                DISPLAY_HEIGHT_PAL * 8, 16);
    if (!capture_result_buffer)
    {
        ESP_LOGE("CAMERA", "Cannot allocate result buffer.");
        return 1;
    }

    camera_control.device_type = io_extend_probe_camera();
    if (camera_control.device_type == CAMERA_DEVICE_NONE)
    {
        ESP_LOGE("CAMERA_CONTROL", "Cannot find camera control device.");
        return 1;
    }
    else
        ESP_LOGI("CAMERA_CONTROL", "Current camera control is %s",
                 camera_control.device_type == CAMERA_DEVICE_SAA7113 ? "SAA7113":
                 "TW9910");
    display_format_t formats[2];
    display_control_get_formats(formats);
    if (camera_set_format_priv(formats[camera_control.channel], true))
    {
        return 1;
    }

    init = true;
    camera_control_ready = true;
    return 0;
}

static int lerp(int left, int right, float mid)
{
    if (mid < 0) mid = 0;
    if (mid > 1) mid = 1;
    return (int)(left * (1 - mid) + right * mid + 0.5f);
}

// Return JPEG result
int camera_capture(uint8_t **result)
{
    display_control_operate_hang_request();
    int current_field;
    *result = NULL;
    camera_fb_t *fb1 = NULL, *fb2 = NULL, *refresh1 = NULL, *refresh2 = NULL;
    jpeg_enc_handle_t enc_handle = NULL;
    int ret = -1;
    if (!init)
    {
        ESP_LOGE("CAMERA", "Camera not initialized");
        goto camera_capture_end;
    }
    if (!camera_control_ready)
    {
        ESP_LOGE("CAMERA", "Camera control not ready");
        goto camera_capture_end;
    }
    if (camera_control.channel < 0)
    {
        ESP_LOGE("CAMERA", "Current channel unset");
        goto camera_capture_end;
    }
    // Read status
    uint8_t read_result;
    uint8_t status_reg = camera_control.device_type == CAMERA_DEVICE_TW9910 ? 0x01 : 0x1F;
    if (io_extend_read_camera(status_reg, &read_result))
    {
        ESP_LOGE("CAMERA", "Cannot read status");
        goto camera_capture_end;
    }
    uint8_t stauts_criteria = camera_control.device_type == CAMERA_DEVICE_TW9910 ?
                              read_result & 0x80 : read_result & 0x40;
    if (stauts_criteria)
    {
        ESP_LOGE("CAMERA", "Status incorrect, status code: 0x%02x", read_result);
        goto camera_capture_end;
    }
    // Refresh
    refresh1 = esp_camera_fb_get();
    if (refresh1)
        esp_camera_fb_return(refresh1);
    else
    {
        ESP_LOGE("CAMERA", "Refresh 1 failed");
        goto camera_capture_end;
    }
    refresh2 = esp_camera_fb_get();
    if (refresh2)
        esp_camera_fb_return(refresh2);
    else
    {
        ESP_LOGE("CAMERA", "Refresh 2 failed");
        goto camera_capture_end;
    }

    fb1 = esp_camera_fb_get();
    if (!fb1)
    {
        ESP_LOGE("CAMERA", "Fetch field 1 failed");
        goto camera_capture_end;
    }
    current_field = gpio_read(camera_control.channel ?
                              SECONDARY_VSYNC_GPIO : PRIMARY_VSYNC_GPIO);
    fb2 = esp_camera_fb_get();
    if (!fb2)
    {
        ESP_LOGE("CAMERA", "Fetch field 2 failed");
        goto camera_capture_end;
    }
    if (!fb1 || !fb2)
    {
        ESP_LOGE("CAMERA", "Camera Capture Failed");
        goto camera_capture_end;
    }
    if (fb1->width != fb2->width || fb1->height != fb2->height)
    {
        ESP_LOGE("CAMERA", "Capture format not identical");
        goto camera_capture_end;
    }
    if (fb1->width != 720 || (fb1->height != DISPLAY_HEIGHT_PAL
                          &&  fb1->height != DISPLAY_HEIGHT_NTSC))
    {
        ESP_LOGE("CAMERA", "Unsupported capture resolution");
        goto camera_capture_end;
    }

    ESP_LOGI("CAMERA", "Width: %d, Height: %d, Field: %d", fb1->width, fb1->height, current_field);
    // Merge fields
    camera_fb_t *buffer_upper, *buffer_lower;
    if (current_field)
    {
        buffer_upper = fb2;
        buffer_lower = fb1;
    }
    else
    {
        buffer_upper = fb1;
        buffer_lower = fb2;
    }

    int dest_width;
    if (camera_control.resolution == CAMERA_RESOLUTION_DEFAULT)
        dest_width = fb1->width;
    else if (fb1->height == DISPLAY_HEIGHT_NTSC) dest_width = 640;
    else dest_width = 768;
    uint8_t *buffer_upper_u8 = buffer_upper->buf;
    uint8_t *buffer_lower_u8 = buffer_lower->buf;
    for (int y = 0; y < fb1->height * 2; y++)
    {
        uint8_t *selected_buffer = y % 2 == 0 ? buffer_upper_u8 : buffer_lower_u8;
        if (camera_control.resolution == CAMERA_RESOLUTION_SQUARE_PIXEL)
        for (int x = 0; x < dest_width; x++)
        {
            float interpolated_y = x / (float)dest_width * 720.f;
            float interpolated_uv = x / 2 / (float)dest_width * 720;
            int interpolated_y_left = (int)interpolated_y;
            int interpolated_uv_left = (int)interpolated_uv;
            int interpolated_y_right = interpolated_y_left + 1 >= fb1->width ?
                                       fb1->width - 1 : interpolated_y + 1;
            int interpolated_uv_right = interpolated_uv_left + 1 >= fb1->width / 2 ?
                                        fb1->width / 2 - 1 : interpolated_uv + 1;
            interpolated_y_left += fb1->width * (y / 2);
            interpolated_y_right += fb1->width * (y / 2);
            interpolated_uv_left = interpolated_uv_left * 2 + fb1->width * (y / 2) + x % 2;
            interpolated_uv_right = interpolated_uv_right * 2 + fb1->width * (y / 2) + x % 2;
            uint8_t merged_y = (uint8_t)lerp(
                selected_buffer[interpolated_y_left * 2 + 1],
                selected_buffer[interpolated_y_right * 2 + 1],
                interpolated_y - (int)interpolated_y
            );
            uint8_t merged_uv = (uint8_t)lerp(
                selected_buffer[interpolated_uv_left * 2],
                selected_buffer[interpolated_uv_right * 2],
                interpolated_uv - (int)interpolated_uv
            );
            capture_processing_buffer[y * dest_width * 2 + x * 2 + 1] = merged_y;
            capture_processing_buffer[y * dest_width * 2 + x * 2] = merged_uv;
        }
        else for(int x = 0; x < dest_width * 2; x++)
        {
            capture_processing_buffer[y * dest_width * 2 + x] = selected_buffer[y / 2 * dest_width * 2 + x];
        }
    }
    // Rotate image
    display_orientation_t orientation = wkc_settings_get_current()->
        display.orientation;
    int enc_width, enc_height;
    uint8_t *input_buffer, *final_buffer;
    if (orientation != DISPLAY_ORIENTATION_HORIZONTAL)
    {
        // Borrow result buffer for rotation
        for (int y = 0; y < fb1->height; y++)
        {
            for (int x = 0; x < dest_width / 2; x++)
            {
                uint8_t merged_u = ((int)capture_processing_buffer[y * 2 * dest_width * 2 +
                        x * 4] + capture_processing_buffer[(y * 2 + 1) * dest_width * 2 +
                        x * 4]) / 2;
                uint8_t merged_v = ((int)capture_processing_buffer[y * 2 * dest_width * 2 +
                        x * 4 + 2] + capture_processing_buffer[(y * 2 + 1) * dest_width * 2 +
                        x * 4 + 2]) / 2;
                uint8_t *y1 = &capture_processing_buffer[y * 2 * dest_width * 2 + x * 4 + 1];
                uint8_t *y2 = y1 + 2, *y3 = y1 + dest_width * 2, *y4 = y3 + 2;
                uint8_t *du1 = &capture_result_buffer[(dest_width / 2 - x - 1) * fb1->height * 8 + y * 4];
                uint8_t *dy1 = du1 + 1, *dv1  = du1 + 2, *dy2 = du1 + 3;
                uint8_t *du2 = du1 + fb1->height * 4, *dy3 = du2 + 1, *dv2 = du2 + 2, *dy4 = du2 + 3;
                *du1 = merged_u; *du2 = merged_u; *dv1 = merged_v; *dv2 = merged_v;
                *dy1 = *y2; *dy2 = *y4; *dy3 = *y1; *dy4 = *y3;
            }
        }
        enc_width = fb1->height * 2;
        enc_height = dest_width;
        input_buffer = capture_result_buffer;
        final_buffer = capture_processing_buffer;
    }
    else
    {
        enc_width = dest_width;
        enc_height = fb1->height * 2;
        input_buffer = capture_processing_buffer;
        final_buffer = capture_result_buffer;
    }

    // Encode JPEG
    uint8_t quality = camera_control.quality == CAMERA_QUALITY_LOW ? 90 :
                                                CAMERA_QUALITY_MEDIUM ? 95 :
                                                99;
    uint8_t subsampling = camera_control.quality == CAMERA_QUALITY_HIGH ?
                          JPEG_SUBSAMPLE_422 : JPEG_SUBSAMPLE_420;
    jpeg_enc_config_t enc_config = {
        .width = enc_width, .height = enc_height,
        .hfm_task_core = 1, .quality = quality,
        .src_type = JPEG_PIXEL_FORMAT_CbYCrY, .subsampling = subsampling,
        .rotate = JPEG_ROTATE_0D
    };

    if (jpeg_enc_open(&enc_config, &enc_handle) || !enc_handle)
    {
        ESP_LOGE("CAMERA", "Cannot set encode handle");
        goto camera_capture_end;
    }
    int enc_result = jpeg_enc_process(enc_handle, input_buffer,
                     fb1->height * 4 * dest_width, final_buffer,
                     DISPLAY_WIDTH_PAL * DISPLAY_HEIGHT_PAL * 8, &ret);
    if (enc_result)
    {
        ESP_LOGE("CAMERA", "Image encode failed");
        ret = -1;
        goto camera_capture_end;
    }
    *result = final_buffer;
    camera_capture_end:
    if (fb1)
        esp_camera_fb_return(fb1);
    if (fb2)
        esp_camera_fb_return(fb2);
    if (enc_handle)
        jpeg_enc_close(enc_handle);
    display_control_operate_hang_release();
    return ret;
}

int camera_set_channel(int channel)
{
    display_control_record_operate_time();
    channel %= 2;
    camera_control.channel = channel;
    camera_control_ready = false;
    if (!init || camera_control.device_type == CAMERA_DEVICE_NONE)
    {
        ESP_LOGE("CAMERA", "Camera not initialized");
        return 1;
    }
    display_format_t formats[2];
    display_control_get_formats(formats);
    if (camera_set_format_priv(formats[channel], false))
    {
        ESP_LOGE("CAMERA", "Cannot set format");
        return 1;
    }
    vTaskDelay(500 / portTICK_PERIOD_MS);

    if (camera_control.device_type == CAMERA_DEVICE_SAA7113)
    {
        if (camera_control_saa7113_infer_color_standard())
        {
            ESP_LOGW("CAMERA", "Cannot infer color standard");
            if (camera_control_update())
            {
                ESP_LOGE("CAMERA", "Cannot update format");
                return 1;
            }
        }
    }
    else if (camera_control_update())
    {
        ESP_LOGE("CAMERA", "Cannot update format");
        return 1;
    }
    camera_control_ready = true;
    return 0;
}

bool camera_is_ready()
{
    return camera_control_ready;
}

bool camera_get_power_state()
{
    return !camera_is_powerdown;
}