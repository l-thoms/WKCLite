#include "esp_camera.h"
#include "display/display_common.h"
#include "esp_jpeg_common.h"
int camera_init();
int camera_capture(uint8_t quality, display_orientation_t orientation,
                   jpeg_subsampling_t subsample, bool prefer_square_pixel,
                   uint8_t **result);
int camera_set_channel(int channel);