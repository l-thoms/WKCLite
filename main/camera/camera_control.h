#pragma once

#include "esp_camera.h"
#include "display/display_common.h"
#include "esp_jpeg_common.h"

#define ANALOG_CONFIG_DEFAULT() { \
    .fuse = ANALOG_FUSE_AMP_AA, \
    .auto_gain = true, \
    .gain = 0, \
    .white_peak_control = true, \
    .aperture = ANALOG_APERTURE_HALF, \
    .auto_gain_interval = ANALOG_AUTO_GAIN_INTERVAL_PER_LINE, \
    .bandpass_center = ANALOG_BANDPASS_CENTER_3M8, \
    .prefilter_enabled = false, \
    .bandpass_enabled = true, \
    .invert = false, \
    .chroma_bandwidth = ANALOG_CHROMA_BANDWIDTH_DEFAULT, \
    .chroma_comb_filter_enabled = true, \
    .color_standard = ANALOG_COLOR_STANDARD_UNKNOWN, \
    .color_standard_auto = ANALOG_COLOR_STANDARD_UNKNOWN, \
    .chroma_gain_control = 0, \
    .chroma_gain_auto = true, \
    .chroma_killer_enabled = false, \
    .raw_output_enabled = false \
}

typedef enum
{
    CAMERA_DEVICE_ANALOG
} camera_device_type_t;

typedef enum
{
    CAMERA_RESOLUTION_ANALOG_DEFAULT = 0,       // 720x576 or 720x480
    CAMERA_RESOLUTION_ANALOG_SQUARE_PIXEL = 1   // 768x576 or 640x480
} camera_resolution_t;

typedef enum
{
    CAMERA_QUALITY_LOW,     // 90% quality with 4:2:0 sampling
    CAMERA_QUALITY_MEDIUM,  // 95% quality with 4:2:0 sampling
    CAMERA_QUALITY_HIGH     // 95% quality with 4:2:2 sampling
} camera_quality_t;

typedef enum
{
    CAMERA_TIMEOUT_DISABLED,
    CAMERA_TIMEOUT_3S,
    CAMERA_TIMEOUT_5S,
    CAMERA_TIMEOUT_10S
} camera_timeout_t;

typedef enum
{
    ANALOG_FUSE_BYPASS,
    ANALOG_FUSE_AMP,
    ANALOG_FUSE_AMP_AA
} analog_fuse_t;

typedef enum
{
    ANALOG_APERTURE_ZERO,
    ANALOG_APERTURE_QUARTER,
    ANALOG_APERTURE_HALF,
    ANALOG_APERTURE_FULL
} analog_aperture_t;

typedef enum
{
    ANALOG_AUTO_GAIN_INTERVAL_PER_LINE,
    ANALOG_AUTO_GAIN_INTERVAL_PER_FRAME
} analog_auto_gain_interval_t;

typedef enum
{
    ANALOG_BANDPASS_CENTER_4M1,
    ANALOG_BANDPASS_CENTER_3M8,
    ANALOG_BANDPASS_CENTER_2M6,
    ANALOG_BANDPASS_CENTER_2M9
} analog_bandpass_center_t;

typedef enum
{
    ANALOG_CHROMA_BANDWIDTH_NARROW,
    ANALOG_CHROMA_BANDWIDTH_DEFAULT,
    ANALOG_CHROMA_BANDWIDTH_MEDIUM,
    ANALOG_CHROMA_BANDWIDTH_WIDE
} analog_chroma_bandwidth_t;

typedef enum
{
    ANALOG_COLOR_STANDARD_UNKNOWN,
    ANALOG_COLOR_STANDARD_PAL_NTSC,
    ANALOG_COLOR_STANDARD_PAL60_443_NTSC50_443,
    ANALOG_COLOR_STANDARD_PAL_N_NTSC_443,
    ANALOG_COLOR_STANDARD_PAL60_NTSC_N,
    ANALOG_COLOR_STANDARD_SECAM
} analog_color_standard_t;

#define ANALOG_COLOR_STANDARD_CALCULATE(standard) \
( \
    standard == ANALOG_COLOR_STANDARD_PAL60_443_NTSC50_443 ? 1 : \
    standard == ANALOG_COLOR_STANDARD_PAL_N_NTSC_443 ? 2 : \
    standard == ANALOG_COLOR_STANDARD_PAL60_NTSC_N ? 3 : \
    standard == ANALOG_COLOR_STANDARD_SECAM ? 5 : 0 \
)

typedef struct
{
    // Reg 02
    analog_fuse_t fuse;
    // Reg 03
    bool auto_gain;
    int gain; // ±10
    bool white_peak_control; // D4
    // Reg 09
    analog_aperture_t aperture;
    analog_auto_gain_interval_t auto_gain_interval;
    analog_bandpass_center_t bandpass_center;
    bool prefilter_enabled;
    bool bandpass_enabled;
    // Reg 0B
    bool invert;
    // Reg 0E
    analog_chroma_bandwidth_t chroma_bandwidth;
    bool chroma_comb_filter_enabled;
    analog_color_standard_t color_standard; // Auto detect by software
    analog_color_standard_t color_standard_auto;
    // Reg 0F
    int chroma_gain_control; // ±10
    bool chroma_gain_auto;
    // Reg 11
    bool chroma_killer_enabled;
    bool raw_output_enabled;
} analog_config_t;

typedef struct
{
    analog_config_t analog;
} camera_device_config_t;

typedef struct
{
    int channel;
    camera_resolution_t resolution;
    camera_quality_t quality;
    camera_timeout_t timeout;
    display_format_t current_format;

    int brightness;
    int contrast;
    int saturation;
    // ±18
    int hue;

    camera_device_type_t device_type;
    camera_device_config_t device_config;
} camera_control_t;

camera_control_t *camera_control_get_current();
void camera_control_reset();
int camera_powerdown();
int camera_poweron();
int camera_control_update();
int camera_init();
int camera_capture(uint8_t **result);
int camera_set_channel(int channel);
bool camera_is_ready();
bool camera_get_power_state();