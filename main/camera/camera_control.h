#pragma once

#include "display/display_common.h"

#define SAA7113_CONFIG_DEFAULT() { \
    .fuse = SAA7113_FUSE_AMP_AA, \
    .auto_gain = true, \
    .gain = 0, \
    .white_peak_control = true, \
    .aperture = SAA7113_APERTURE_HALF, \
    .auto_gain_interval = SAA7113_AUTO_GAIN_INTERVAL_PER_LINE, \
    .bandpass_center = SAA7113_BANDPASS_CENTER_3M8, \
    .prefilter_enabled = false, \
    .bandpass_enabled = true, \
    .invert = false, \
    .hue = 0, \
    .chroma_bandwidth = SAA7113_CHROMA_BANDWIDTH_DEFAULT, \
    .chroma_comb_filter_enabled = true, \
    .color_standard = SAA7113_COLOR_STANDARD_UNKNOWN, \
    .color_standard_auto = SAA7113_COLOR_STANDARD_UNKNOWN, \
    .chroma_gain_control = 0, \
    .chroma_gain_auto = true, \
    .chroma_killer_enabled = false, \
    .raw_output_enabled = false \
}

#define TW9910_CONFIG_DEFAULT() { \
    .color_killer_hysteresis = TW9910_COLOR_KILLER_HYSTERESIS_FASTEST, \
    .auto_gain = true, \
    .chroma_bandpass_width = TW9910_CHROMA_BANDPASS_WIDE, \
    .blank_level = TW9910_BLANK_LEVEL_AUTO, \
    .adaptive_comb_filter_enabled = true, \
    .operation_mode = 1, \
    .pal_delay_line_enabled = true, \
    .sharp_center = TW9910_SHARP_CENTER_HIGH, \
    .cti_level = 1, \
    .sharpness = 1, \
    .ntsc_hue_correct = 0, \
    .sharpness_coring = 8, \
    .vertical_peaking_level = 0, \
    .cif_level = TW9910_CIF_NONE, \
    .luma_antialias = false, \
    .chroma_antialias = false, \
    .color_standard = TW9910_COLOR_STANDARD_AUTO, \
    .auto_gain_max_correction_level = 2, \
    .peak_agc_loop_gain_control = 1, \
    .manual_gain_level = 0, \
    .white_peak_threshold = 0, \
    .clamping_level = 0, \
    .color_killer_max = 1, \
    .color_killer_min = 0, \
    .comb_filter_strength = 0, \
    .adaptive_comb_filter_threshold_control_1 = 4, \
    .adaptive_comb_filter_threshold_control_2 = 4, \
    .color_killer_fast_mode_enabled = false, \
    .luma_delay = 3, \
    .prefilter = TW9910_PREFILTER_AUTO, \
    .chroma_low_pass = TW9910_CHROMA_LOW_PASS_LOW, \
    .noisy_color_killer_enabled = true, \
    .blue_stretch = false, \
    .luma_hf_noise_reduction_level = 0, \
    .clamping_mode = TW9910_CLAMPING_MODE_AUTO, \
    .luma_clamp_enabled = true, \
    .chroma_clamp_enabled = true \
}

typedef enum
{
    CAMERA_DEVICE_NONE,
    CAMERA_DEVICE_SAA7113,
    CAMERA_DEVICE_TW9910
} camera_device_type_t;

typedef enum
{
    CAMERA_RESOLUTION_DEFAULT = 0,       // 720x576 or 720x480
    CAMERA_RESOLUTION_SQUARE_PIXEL = 1   // 768x576 or 640x480
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
    SAA7113_FUSE_BYPASS,
    SAA7113_FUSE_AMP,
    SAA7113_FUSE_AMP_AA
} saa7113_fuse_t;

typedef enum
{
    SAA7113_APERTURE_ZERO,
    SAA7113_APERTURE_QUARTER,
    SAA7113_APERTURE_HALF,
    SAA7113_APERTURE_FULL
} saa7113_aperture_t;

typedef enum
{
    SAA7113_AUTO_GAIN_INTERVAL_PER_LINE,
    SAA7113_AUTO_GAIN_INTERVAL_PER_FRAME
} saa7113_auto_gain_interval_t;

typedef enum
{
    SAA7113_BANDPASS_CENTER_4M1,
    SAA7113_BANDPASS_CENTER_3M8,
    SAA7113_BANDPASS_CENTER_2M6,
    SAA7113_BANDPASS_CENTER_2M9
} saa7113_bandpass_center_t;

typedef enum
{
    SAA7113_CHROMA_BANDWIDTH_NARROW,
    SAA7113_CHROMA_BANDWIDTH_DEFAULT,
    SAA7113_CHROMA_BANDWIDTH_MEDIUM,
    SAA7113_CHROMA_BANDWIDTH_WIDE
} saa7113_chroma_bandwidth_t;

typedef enum
{
    SAA7113_COLOR_STANDARD_UNKNOWN,
    SAA7113_COLOR_STANDARD_PAL_NTSC,
    SAA7113_COLOR_STANDARD_PAL60_443_NTSC50_443,
    SAA7113_COLOR_STANDARD_PAL_N_NTSC_443,
    SAA7113_COLOR_STANDARD_PAL60_NTSC_N,
    SAA7113_COLOR_STANDARD_SECAM
} saa7113_color_standard_t;

#define SAA7113_COLOR_STANDARD_CALCULATE(standard) \
( \
    standard == SAA7113_COLOR_STANDARD_PAL60_443_NTSC50_443 ? 1 : \
    standard == SAA7113_COLOR_STANDARD_PAL_N_NTSC_443 ? 2 : \
    standard == SAA7113_COLOR_STANDARD_PAL60_NTSC_N ? 3 : \
    standard == SAA7113_COLOR_STANDARD_SECAM ? 5 : 0 \
)

typedef struct
{
    // Reg 02
    saa7113_fuse_t fuse;
    // Reg 03
    bool auto_gain;
    int gain; // ±10
    bool white_peak_control; // D4
    // Reg 09
    saa7113_aperture_t aperture;
    saa7113_auto_gain_interval_t auto_gain_interval;
    saa7113_bandpass_center_t bandpass_center;
    bool prefilter_enabled;
    bool bandpass_enabled;
    // Reg 0B
    bool invert;
    // Reg 0D
    int hue; // ±18
    // Reg 0E
    saa7113_chroma_bandwidth_t chroma_bandwidth;
    bool chroma_comb_filter_enabled;
    saa7113_color_standard_t color_standard; // Auto detect by software
    saa7113_color_standard_t color_standard_auto;
    // Reg 0F
    int chroma_gain_control; // ±10
    bool chroma_gain_auto;
    // Reg 11
    bool chroma_killer_enabled;
    bool raw_output_enabled;
} saa7113_config_t;

typedef enum
{
    TW9910_COLOR_KILLER_HYSTERESIS_FASTEST,
    TW9910_COLOR_KILLER_HYSTERESIS_FAST,
    TW9910_COLOR_KILLER_HYSTERESIS_MEDIUM,
    TW9910_COLOR_KILLER_HYSTERESIS_SLOW
} tw9910_color_killer_hysteresis_t;

typedef enum
{
    TW9910_CHROMA_BANDPASS_NORMAL,
    TW9910_CHROMA_BANDPASS_WIDE
} tw9910_chroma_bandpass_width_t;

typedef enum
{
    TW9910_BLANK_LEVEL_AUTO,
    TW9910_BLANK_LEVEL_0,
    TW9910_BLANK_LEVEL_75
} tw9910_blank_level_t;

typedef enum
{
    TW9910_SHARP_CENTER_NORMAL,
    TW9910_SHARP_CENTER_HIGH
} tw9910_sharp_center_t;

typedef enum
{
    TW9910_CIF_NONE,
    TW9910_CIF_15,
    TW9910_CIF_3,
    TW9910_CIF_6
} tw9910_cif_level_t;

typedef enum
{
    TW9910_COLOR_STANDARD_AUTO,
    TW9910_COLOR_STANDARD_NTSC,
    TW9910_COLOR_STANDARD_PAL,
    TW9910_COLOR_STANDARD_SECAM,
    TW9910_COLOR_STANDARD_NTSC443,
    TW9910_COLOR_STANDARD_PAL_M,
    TW9910_COLOR_STANDARD_PAL_N,
    TW9910_COLOR_STANDARD_PAL60,
} tw9910_color_standard_t;

typedef enum
{
    TW9910_PREFILTER_AUTO,
    TW9910_PREFILTER_BYPASS,
    TW9910_PREFILTER_HORIZONTAL_ENHANCEMENT,
    TW9910_PREFILTER_CIF,
    TW9910_PREFILTER_QCIF,
    TW9910_PREFILTER_ICON
} tw9910_prefilter_t;

typedef enum
{
    TW9910_CHROMA_LOW_PASS_DISABLED,
    TW9910_CHROMA_LOW_PASS_LOW,
    TW9910_CHROMA_LOW_PASS_MEDIUM,
    TW9910_CHROMA_LOW_PASS_HIGH
} tw9910_chroma_low_pass_t;

typedef enum
{
    TW9910_CLAMPING_MODE_AUTO,
    TW9910_CLAMPING_MODE_SYNC_TOP,
    TW9910_CLAMPING_MODE_PEDESTAL
} tw9910_clamping_mode_t;

typedef struct
{
    // Reg 04
    tw9910_color_killer_hysteresis_t color_killer_hysteresis;
    // Reg 06
    bool auto_gain;
    // Reg 0C
    tw9910_chroma_bandpass_width_t chroma_bandpass_width;
    tw9910_blank_level_t blank_level; // Set after color standard
    bool adaptive_comb_filter_enabled;
    int operation_mode;
    bool pal_delay_line_enabled;
    // Reg 12
    tw9910_sharp_center_t sharp_center;
    int cti_level;
    int sharpness;
    // Reg 15
    int ntsc_hue_correct; // ±10
    // Reg 17
    int sharpness_coring;
    int vertical_peaking_level;
    // Reg 18
    int cti_coring;
    int chroma_coring;
    int vertical_peaking_coring;
    tw9910_cif_level_t cif_level;
    // Reg 1A
    bool luma_antialias;
    bool chroma_antialias;
    // Reg 1C
    tw9910_color_standard_t color_standard;
    tw9910_color_standard_t last_color_standard;
    // Reg 21, 22
    int auto_gain_max_correction_level;
    int peak_agc_loop_gain_control;
    int manual_gain_level; // ±10
    // Reg 23
    int white_peak_threshold; // ±10
    // Reg 24
    int clamping_level;
    // Reg 2A
    int color_killer_max;
    int color_killer_min; // ±10
    // Reg 2B
    int comb_filter_strength;
    int adaptive_comb_filter_threshold_control_1;
    int adaptive_comb_filter_threshold_control_2;
    // Reg 2C
    bool color_killer_fast_mode_enabled;
    int luma_delay;
    tw9910_prefilter_t prefilter;
    // Reg 2E
    tw9910_chroma_low_pass_t chroma_low_pass;
    // Reg 2F
    bool noisy_color_killer_enabled;
    bool blue_stretch;
    // Reg 33
    int luma_hf_noise_reduction_level;
    tw9910_clamping_mode_t clamping_mode;
    // Reg 35
    bool luma_clamp_enabled;
    bool chroma_clamp_enabled;
} tw9910_config_t;

typedef struct
{
    saa7113_config_t saa7113;
    tw9910_config_t tw9910;
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

    camera_device_type_t device_type;
    camera_device_config_t device_config;
} camera_control_t;

camera_control_t *camera_control_get_current();
void camera_control_reset();
int camera_powerdown();
int camera_poweron();
int camera_control_update();
int camera_control_init();
int camera_capture(uint8_t **result);
int camera_set_channel(int channel);
bool camera_is_ready();
bool camera_get_power_state();