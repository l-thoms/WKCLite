#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_camera.h"
#include "display/display_common.h"
#include "display/display_control.h"
#include "driver/gpio.h"
#include "io/io_extend.h"
#include "io/filesystem.h"
#include "esp_log.h"
#include "esp_heap_caps.h"
#include "esp_jpeg_common.h"
#include "esp_jpeg_enc.h"
#include "io/filesystem.h"

//WROVER-KIT PIN Map
#define CAM_PIN_PWDN    -1 //power down is not used
#define CAM_PIN_RESET   -1 //software reset will be performed
#define CAM_PIN_XCLK    -1
#define CAM_PIN_SIOD    -1
#define CAM_PIN_SIOC    -1

static int current_channel = 0;
static bool init = false;
static uint8_t *capture_processing_buffer = NULL;
static uint8_t *capture_result_buffer = NULL;

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

    .pixel_format = PIXFORMAT_RGB565,
    .frame_size = FRAMESIZE_PAL,

    .fb_count = 2,
    .fb_location = CAMERA_FB_IN_PSRAM,
    .grab_mode = CAMERA_GRAB_LATEST,
};

static int camera_set_format_priv(display_format_t format, bool ignore_init)
{
    if (!ignore_init && !init)
    {
        ESP_LOGE("CAMERA", "Camera not initialized");
        return 1;
    }
    // Avoid reallocate
    camera_config.frame_size = FRAMESIZE_PAL;
    int ret = 0;
    if (!init) ret = esp_camera_reconfigure(&camera_config);
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
    gpio_write(GPIO_NUM_EXTEND | 10, 1);
    io_extend_write_camera(0x00, 0x00);
    io_extend_write_camera(0x01, 0x11);
    io_extend_write_camera(0x03, 0x0D);
    io_extend_write_camera(0x04, 0xC0);
    io_extend_write_camera(0x0D, 0x40);
    io_extend_write_camera(0x12, 0x04);

    if (!capture_processing_buffer)
        capture_processing_buffer = jpeg_calloc_align(DISPLAY_WIDTH_PAL *
                                    DISPLAY_HEIGHT_PAL* 2, 16);
    if (!capture_processing_buffer)
    {
        ESP_LOGE("CAMERA", "Cannot allocate processing buffer.");
        return 1;
    }
    if (!capture_result_buffer)
        capture_result_buffer = jpeg_calloc_align(DISPLAY_WIDTH_PAL *
                                DISPLAY_HEIGHT_PAL* 2, 16);
    if (!capture_result_buffer)
    {
        ESP_LOGE("CAMERA", "Cannot allocate result buffer.");
        return 1;
    }
    if (camera_set_format_priv(DISPLAY_FORMAT_PAL, true))
    {
        return 1;
    }

    init = true;
    return 0;
}

static int lerp(int left, int right, float mid)
{
    if (mid < 0) mid = 0;
    if (mid > 1) mid = 1;
    return (int)(left * (1 - mid) + right * mid + 0.5f);
}



// Return JPEG result
int camera_capture(uint8_t quality, display_orientation_t orientation,
                        jpeg_subsampling_t subsample, bool prefer_square_pixel,
                        uint8_t **result)
{
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
    // acquire a frame
    uint8_t read_result = 0;
    // Refresh state, read twice
    if (io_extend_read_camera(0x88, &read_result) ||
        io_extend_read_camera(0x88, &read_result))
    {
        ESP_LOGE("CAMERA", "Failed to read camera");
        goto camera_capture_end;
    }
    if ((read_result & 0x1E) != 0x0E)
    {
        ESP_LOGE("CAMERA", "Camera sync lost, reason: %d", (read_result >> 1) % 16);
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
    current_field = gpio_read(current_channel ? SECONDARY_VSYNC_GPIO : PRIMARY_VSYNC_GPIO);
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
        buffer_upper = fb1;
        buffer_lower = fb2;
    }
    else
    {
        buffer_upper = fb2;
        buffer_lower = fb1;
    }

    // Debug: Dump raw data into sdcard
    if (wkc_storage_ensure_capture_dir() == 0)
    {
        wkc_save("/sdcard/wkc_capture/buffer_upper.yuv", (char*)buffer_upper->buf, fb1->width * fb1->height * 2);
        wkc_save("/sdcard/wkc_capture/buffer_lower.yuv", (char*)buffer_lower->buf, fb1->width * fb1->height * 2);
    }

    int dest_width;
    if (!prefer_square_pixel) dest_width = fb1->width;
    else if (fb1->height == DISPLAY_HEIGHT_NTSC) dest_width = 640;
    else dest_width = 768;
    uint8_t *buffer_upper_u8 = buffer_upper->buf;
    uint8_t *buffer_lower_u8 = buffer_lower->buf;
    for (int y = 0; y < fb1->height * 2; y++)
    {
        uint8_t *selected_buffer = y % 2 == 0 ? buffer_upper_u8 : buffer_lower_u8;
        if (prefer_square_pixel) for (int x = 0; x < dest_width; x++)
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

    // Encode JPEG
    jpeg_enc_config_t enc_config = {
        .width = dest_width, .height = fb1->height * 2,
        .hfm_task_core = 1, .quality = quality,
        .src_type = JPEG_PIXEL_FORMAT_CbYCrY, .subsampling = subsample,
        .rotate = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? JPEG_ROTATE_0D :
                                                              JPEG_ROTATE_270D
    };

    if (jpeg_enc_open(&enc_config, &enc_handle) || !enc_handle)
    {
        ESP_LOGE("CAMERA", "Cannot set encode handle");
        goto camera_capture_end;
    }
    int enc_result = jpeg_enc_process(enc_handle, capture_processing_buffer,
                     fb1->height * 4 * dest_width, capture_result_buffer,
                     DISPLAY_WIDTH_PAL * DISPLAY_HEIGHT_PAL * 8, &ret);
    if (enc_result)
    {
        ESP_LOGE("CAMERA", "Image encode failed");
        ret = -1;
        goto camera_capture_end;
    }
    *result = capture_result_buffer;
    camera_capture_end:
    if (fb1)
        esp_camera_fb_return(fb1);
    if (fb2)
        esp_camera_fb_return(fb2);
    if (enc_handle)
        jpeg_enc_close(enc_handle);
    return ret;
}

int camera_set_channel(int channel)
{
    if (!init)
    {
        ESP_LOGE("CAMERA", "Camera not initialized");
        return 1;
    }
    int ret = io_extend_write_camera(0x00, (!!channel << 1));
    if (ret)
    {
        ESP_LOGE("CAMERA", "Camera set channel failed");
        return ret;
    }
    current_channel = channel;
    return 0;
}