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
    camera_control.resolution = CAMERA_RESOLUTION_ANALOG_DEFAULT;
    camera_control.quality = CAMERA_QUALITY_HIGH;
    camera_control.timeout = CAMERA_TIMEOUT_DISABLED;
    camera_control.brightness = 0;
    camera_control.contrast = 0;
    camera_control.saturation = 0;
    camera_control.hue = 0;
    analog_config_t analog_default = ANALOG_CONFIG_DEFAULT();
    memcpy(&camera_control.device_config.analog, &analog_default,
            sizeof(analog_config_t));
    wkc_save(CAMERA_PROFILE_PATH, (char*)&camera_control, sizeof(camera_control));
}

static int camera_control_update_analog()
{
    analog_config_t *analog = &camera_control.device_config.analog;
    int fuse_calculated = analog->fuse == ANALOG_FUSE_BYPASS ? 0 :
                          analog->fuse == ANALOG_FUSE_AMP ? 2 : 3;
    int gain_calculated = (int)(511 / 20.f * (analog->gain + 10));
    int brightness_calculated = (int)(255 / 20.f * (camera_control.brightness + 10));
    int contrast_calculated = (int)(127 / 20.f * (camera_control.contrast + 10));
    int saturation_calculated = (int)(127 / 20.f * (camera_control.saturation + 10));
    int hue_calculated = (int)(127 / 36.f * ((camera_control.hue + 36) % 36));
    int chroma_gain_calculated = analog->chroma_gain_control > 0 ?
        (int)(analog->chroma_gain_control / 10.f * (127 - 36) + 36) :
        (int)(analog->chroma_gain_control / 10.f * 36 + 36);

    CAMERA_WRITE_REG(0x01, 0x08);
    CAMERA_WRITE_REG(0x02, (fuse_calculated << 6) |
        camera_control.channel);
    CAMERA_WRITE_REG(0x03, 0x20 |
        (!analog->white_peak_control << 4) |
        (!analog->auto_gain << 3) | (!analog->auto_gain << 2) |
        (gain_calculated >> 8 << 1) | (gain_calculated >> 8));
    CAMERA_WRITE_REG(0x04, gain_calculated % 256);
    CAMERA_WRITE_REG(0x05, gain_calculated % 256);
    CAMERA_WRITE_REG(0x06, 0xE9);
    CAMERA_WRITE_REG(0x07, 0x0D);
    CAMERA_WRITE_REG(0x08, 0x98);
    CAMERA_WRITE_REG(0x09, (!analog->bandpass_enabled << 7) |
        (analog->prefilter_enabled << 6) | (analog->bandpass_center << 4) |
        (analog->auto_gain_interval << 2) | analog->aperture);
    CAMERA_WRITE_REG(0x0A, brightness_calculated);
    CAMERA_WRITE_REG(0x0B, (analog->invert << 7) | contrast_calculated);
    CAMERA_WRITE_REG(0x0C, (analog->invert << 7) | saturation_calculated);
    CAMERA_WRITE_REG(0x0D, (analog->invert << 7) | hue_calculated);
    analog_color_standard_t selected_standard =
        analog->color_standard == ANALOG_COLOR_STANDARD_UNKNOWN ?
        analog->color_standard_auto == ANALOG_COLOR_STANDARD_UNKNOWN ?
        ANALOG_COLOR_STANDARD_PAL_NTSC :
        analog->color_standard_auto : analog->color_standard;
    CAMERA_WRITE_REG(0x0E, (ANALOG_COLOR_STANDARD_CALCULATE(selected_standard) << 4) |
        (!analog->chroma_comb_filter_enabled << 3) |
        analog->chroma_bandwidth);
    CAMERA_WRITE_REG(0x0F, (!analog->chroma_gain_auto << 7) | chroma_gain_calculated);
    CAMERA_WRITE_REG(0x10, camera_control.current_format ==
                           DISPLAY_FORMAT_NTSC ? 0x00 : 0x08);
    CAMERA_WRITE_REG(0x11, 0x0C | (analog->raw_output_enabled << 1) |
        !analog->chroma_killer_enabled);
    CAMERA_WRITE_REG(0x12, 0x01);
    CAMERA_WRITE_REG(0x12, 0x9B);
    CAMERA_WRITE_REG(0x13, 0x10);
    CAMERA_WRITE_REG(0x14, 0x00);
    CAMERA_WRITE_REG(0x15, 0x00);
    CAMERA_WRITE_REG(0x16, 0x00);
    CAMERA_WRITE_REG(0x17, 0x00);
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
        if(camera_init())
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

static int camera_control_analog_infer_color_standard()
{
    static analog_color_standard_t infer_order[] = {
        ANALOG_COLOR_STANDARD_PAL_NTSC,
        ANALOG_COLOR_STANDARD_PAL60_NTSC_N,
        ANALOG_COLOR_STANDARD_PAL_N_NTSC_443,
        ANALOG_COLOR_STANDARD_SECAM,
        ANALOG_COLOR_STANDARD_PAL60_443_NTSC50_443,
    };
    analog_config_t *analog = &camera_control.device_config.analog;
    analog->color_standard_auto = ANALOG_COLOR_STANDARD_UNKNOWN;
    for (int i = 0; i < 5; i++)
    {
        CAMERA_WRITE_REG(0x0E, (ANALOG_COLOR_STANDARD_CALCULATE(
            infer_order[i]) << 4) |
        (!analog->chroma_comb_filter_enabled << 3) |
        analog->chroma_bandwidth);
        vTaskDelay(100 / portTICK_PERIOD_MS);
        CAMERA_WRITE_REG(0x13, 0x10);
        uint8_t read_result;
        if (io_extend_read_camera(0x1F, &read_result))
            return 1;
        if (read_result & 1)
        {
            analog->color_standard_auto = infer_order[i];
            ESP_LOGI("CAMERA_CONTROL", "Infer color format: %s",
                analog->color_standard_auto == ANALOG_COLOR_STANDARD_PAL_NTSC ?
                "PAL/NTSC" :
                analog->color_standard_auto == ANALOG_COLOR_STANDARD_PAL60_443_NTSC50_443 ?
                "NTSC50 4.43/PAL60 4.43" :
                analog->color_standard_auto == ANALOG_COLOR_STANDARD_PAL_N_NTSC_443 ?
                "PAL-N/NTSC 4.43" :
                analog->color_standard_auto == ANALOG_COLOR_STANDARD_PAL60_NTSC_N ?
                "NTSC-N/PAL60" :
                analog->color_standard_auto == ANALOG_COLOR_STANDARD_SECAM ?
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
    if (camera_control.device_type == CAMERA_DEVICE_ANALOG)
        ret = camera_control_update_analog();

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

int camera_init()
{
    if (init) return 0;
    size_t profile_size;
    if (wkc_get_file_size(CAMERA_PROFILE_PATH, &profile_size) ||
        profile_size != sizeof(camera_control_t) ||
        wkc_open(CAMERA_PROFILE_PATH, (char*)&camera_control, sizeof(camera_control)))
        camera_control_reset();
    camera_control.brightness = clamp(camera_control.brightness, -10, 10);
    camera_control.contrast = clamp(camera_control.contrast, -10, 10);
    camera_control.saturation = clamp(camera_control.saturation, -10, 10);
    camera_control.hue = clamp(camera_control.hue, -18, 18);
    camera_control.device_config.analog.gain = clamp(
        camera_control.device_config.analog.gain, -10, 10
    );
    camera_control.device_config.analog.chroma_gain_control = clamp(
        camera_control.device_config.analog.chroma_gain_control, -10, 10
    );

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
    if (io_extend_read_camera(0x1F, &read_result))
    {
        ESP_LOGE("CAMERA", "Cannot read status");
        goto camera_capture_end;
    }
    if ((read_result & 0x40))
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
    if (camera_control.resolution == CAMERA_RESOLUTION_ANALOG_DEFAULT)
        dest_width = fb1->width;
    else if (fb1->height == DISPLAY_HEIGHT_NTSC) dest_width = 640;
    else dest_width = 768;
    uint8_t *buffer_upper_u8 = buffer_upper->buf;
    uint8_t *buffer_lower_u8 = buffer_lower->buf;
    for (int y = 0; y < fb1->height * 2; y++)
    {
        uint8_t *selected_buffer = y % 2 == 0 ? buffer_upper_u8 : buffer_lower_u8;
        if (camera_control.resolution == CAMERA_RESOLUTION_ANALOG_SQUARE_PIXEL)
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
    uint8_t quality = camera_control.quality == CAMERA_QUALITY_LOW ? 90 : 95;
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
    if (!init)
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
    if (camera_control_analog_infer_color_standard())
    {
        ESP_LOGW("CAMERA", "Cannot infer color standard");
        if (camera_control_update())
        {
            ESP_LOGE("CAMERA", "Cannot update format");
            return 1;
        }
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