#include <string.h>
#include <stdio.h>
#include <math.h>
#include <sys/time.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_timer.h"
#include "ui_common.h"
#include "shell.h"
#include "files.h"
#include "math.h"
#include "profile/translations.h"
#include "profile/settings.h"
#include "esp_log.h"
#include "io/filesystem.h"
#include "io/io_extend.h"
#include "camera/camera_control.h"
#include "display/display_control.h"
#include "peripherals/battery_calibration.h"

#define UI_CAMERA_CHECK_UPDATE(update) \
{ \
    if(update) \
    { \
        ESP_LOGW("UI_CAMERA", "Some error occurs when updating settings"); \
        ui_shell_show_toast(parent->base.parent, \
            wkc_translations_get_string("camera_error_update"), 5); \
    } \
    parent->status_request = true; \
}

#define UI_CAMERA_SET_OPTIONS(item, options) do { \
    (item) = malloc(sizeof(options)); \
    memcpy((item), (options), sizeof(options)); } while(0)

#define CAMERA_SAVE_PATTERN "/sdcard/wkc_capture/%04d%02d%02d_%08d.jpg"

const char *common_range_options[] = {
    "-10", "-9", "-8", "-7", "-6", "-5", "-4", "-3", "-2", "-1", "0",
    "+1", "+2", "+3", "+4", "+5", "+6", "+7", "+8", "+9", "+10"
};

typedef struct ui_camera_t
{
    ui_page_t base;
    bool show;
    bool main_ui_request;
    bool status_request;
    bool menu_request;
    bool menu_close;
    int selected_index[10];
    int last_selected_index;
    int64_t timeout;
    int64_t display_timeout;
    bool timeout_start;
    bool timeout_clear;
    ui_menu_item_t *current_menu[10];
} ui_camera_t;

static ui_menu_item_t *ui_camera_build_saa7113_menu();
static ui_menu_item_t *ui_camera_build_tw9910_menu();
static ui_menu_item_t *ui_camera_build_reset_menu();

static int ui_camera_get_menu_count(ui_camera_t *camera)
{
    if (!camera->current_menu[0])
        return 0;
    int menu_count = 0;
    while (camera->current_menu[menu_count])
        menu_count += 1;
    return menu_count;
}

static int ui_camera_menu_pop(ui_camera_t *camera)
{
    if (!camera->current_menu[0])
        return 0;
    int menu_count = ui_camera_get_menu_count(camera);

    ui_menu_item_t *menu = camera->current_menu[menu_count - 1];
    int index = 0;
    while (menu[index].type != UI_MENU_ITEM_END)
    {
        if(menu[index].options)
            free(menu[index].options);
        index += 1;
    }
    free(menu);
    camera->current_menu[menu_count - 1] = NULL;
    if (menu_count <= 1) return 0;
    else return 1;
}

static void ui_camera_menu_push(ui_camera_t *camera, ui_menu_item_t *menu)
{
    int menu_count = ui_camera_get_menu_count(camera);
    camera->current_menu[menu_count] = menu;
    camera->selected_index[menu_count + 1] = 0;
}

#pragma region ui_camera_common_menu_actions

static void ui_camera_channel_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    UI_CAMERA_CHECK_UPDATE(camera_set_channel(item->current_value));
}

static void ui_camera_timeout_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->timeout = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_quality_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->quality = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_brightness_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->brightness = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_contrast_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->contrast = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saturation_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->saturation = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_resolution_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->resolution = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_advanced_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    if (camera_control_get_current()->device_type == CAMERA_DEVICE_SAA7113)
    {
        ui_camera_menu_push(parent, ui_camera_build_saa7113_menu());
        parent->last_selected_index = -1;
    }
    else if (camera_control_get_current()->device_type == CAMERA_DEVICE_TW9910)
    {
        ui_camera_menu_push(parent, ui_camera_build_tw9910_menu());
        parent->last_selected_index = -1;
    }
    else
    {
        ui_shell_show_toast(parent->base.parent,
            wkc_translations_get_string("camera_control_not_available"), 5);
    }

}

#pragma endregion

static ui_menu_item_t *ui_camera_build_common_menu()
{
    // Channel, Timeout, Quality, Brightness, Contrast, Saturation, Hue, Resolution, Advanced
    char *channel_options[] = {
        "#1", "#2"
    };
    char *timeout_options[] = {
        wkc_translations_get_string("camera_disabled"), "3s", "5s", "10s"
    };
    char *quality_options[] = {
        wkc_translations_get_string("camera_low"),
        wkc_translations_get_string("camera_medium"),
        wkc_translations_get_string("camera_high")
    };
    ui_menu_item_t items[] = {
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_input_channel"),
            .current_value = (int)camera_control_get_current()->channel,
            .count = sizeof(channel_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_channel_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_timeout"),
            .current_value = (int)camera_control_get_current()->timeout,
            .count = sizeof(timeout_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_timeout_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_quality"),
            .current_value = (int)camera_control_get_current()->quality,
            .count = sizeof(quality_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_quality_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_brightness"),
            .current_value = (int)camera_control_get_current()->brightness + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_brightness_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_contrast"),
            .current_value = (int)camera_control_get_current()->contrast + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_contrast_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_saturation"),
            .current_value = (int)camera_control_get_current()->saturation + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saturation_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_prefer_square_pixel"),
            .current_value = (int)camera_control_get_current()->resolution,
            .action = (ui_menu_action_t)ui_camera_resolution_action
        },
        {
            .type = UI_MENU_ITEM_LABEL,
            .name = wkc_translations_get_string("camera_advanced"),
            .action = (ui_menu_action_t)ui_camera_advanced_action
        },
        {
            .type = UI_MENU_ITEM_END
        }
    };

    UI_CAMERA_SET_OPTIONS(items[0].options, channel_options);
    UI_CAMERA_SET_OPTIONS(items[1].options, timeout_options);
    UI_CAMERA_SET_OPTIONS(items[2].options, quality_options);
    UI_CAMERA_SET_OPTIONS(items[3].options, common_range_options);
    UI_CAMERA_SET_OPTIONS(items[4].options, common_range_options);
    UI_CAMERA_SET_OPTIONS(items[5].options, common_range_options);

    ui_menu_item_t *build_result = malloc(sizeof(items));
    memcpy(build_result, items, sizeof(items));
    return build_result;
}

static void ui_camera_reset_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    ui_camera_menu_push(parent, ui_camera_build_reset_menu());
    parent->last_selected_index = -1;
    parent->selected_index[ui_camera_get_menu_count(parent)] = 1;
}

#pragma region ui_camera_saa7113_menu_actions

static void ui_camera_saa7113_fuse_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.fuse = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_auto_gain_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.auto_gain = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_gain_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.gain = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_auto_gain_interval_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.auto_gain_interval = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_white_peak_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.white_peak_control = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_aperture_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.aperture = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_bandpass_enabled_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.bandpass_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_bandpass_center_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.bandpass_center = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_prefilter_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.prefilter_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_invert_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.invert = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_hue_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.hue = item->current_value - 18;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_color_standard_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.color_standard = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_chroma_gain_auto_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.chroma_gain_auto = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_chroma_gain_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.chroma_gain_control = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_chroma_bandwidth_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.chroma_bandwidth = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_chroma_comb_filter_enabled_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.chroma_comb_filter_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_saa7113_chroma_killer_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.saa7113.chroma_killer_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

#pragma endregion

static ui_menu_item_t *ui_camera_build_saa7113_menu()
{
    // 0.Fuse, 1.Auto Gain, 2.Gain, 3.Auto Gain Interval, 4.White Peak Control, 5.Aperture,
    // 6.Bandpass Enabled, 7.Bandpass Center, 8.Prefilter Enabled, 9.Invert,
    // 10.Color Standard, 11.Chroma Gain Auto, 12.Chroma Gain, 13.Chroma Bandwidth,
    // 14.Chroma Comb Filter Enabled, 15.Chroma Killer, 16.Raw Output
    saa7113_config_t *saa7113_config = &camera_control_get_current()->device_config.saa7113;
    char *fuse_options[] = {
        wkc_translations_get_string("camera_bypass"),
        wkc_translations_get_string("camera_fuse_amp"),
        wkc_translations_get_string("camera_fuse_amp_aa")
    };
    char *auto_gain_interval_options[] = {
        wkc_translations_get_string("camera_per_line"),
        wkc_translations_get_string("camera_per_frame")
    };
    char *aperture_options[] = {
        "0", "0.25", "0.5", "1.0"
    };
    char *bandpass_center_options[] = {
        "4.1MHz", "3.8MHz", "2.6MHz", "2.9MHz"
    };
    char *hue_options[] = {
        "-180°", "-170°", "-160°", "-150°", "-140°", "-130°", "-120°", "-110°", "-100°",
        "-90°", "-80°", "-70°", "-60°", "-50°", "-40°", "-30°", "-20°", "-10°", "0°",
        "+10°", "+20°", "+30°", "+40°", "+50°", "+60°", "+70°", "+80°", "+90°", "+100°",
        "+110°", "+120°", "+130°", "+140°", "+150°", "+160°", "+170°", "+180°",
    };
    char *color_standard_options[] = {
        wkc_translations_get_string("camera_auto"),
        "PAL/NTSC",
        "N50 4.43/P60 4.43",
        "PAL-N/NTSC 4.43",
        "NTSC-N/PAL60",
        "SECAM"
    };
    char *chroma_bandwidth_options[] = {
        wkc_translations_get_string("camera_narrow"),
        wkc_translations_get_string("camera_default"),
        wkc_translations_get_string("camera_medium"),
        wkc_translations_get_string("camera_wide"),
    };
    ui_menu_item_t items[] = {
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_fuse"),
            .current_value = (int)saa7113_config->fuse,
            .count = sizeof(fuse_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_fuse_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_auto_gain"),
            .current_value = (int)saa7113_config->auto_gain,
            .action = (ui_menu_action_t)ui_camera_saa7113_auto_gain_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_gain"),
            .current_value = (int)saa7113_config->gain + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_gain_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_auto_gain_interval"),
            .current_value = (int)saa7113_config->auto_gain_interval,
            .count = sizeof(auto_gain_interval_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_auto_gain_interval_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_white_peak_control"),
            .current_value = (int)saa7113_config->white_peak_control,
            .action = (ui_menu_action_t)ui_camera_saa7113_white_peak_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_aperture"),
            .current_value = (int)saa7113_config->aperture,
            .count = sizeof(aperture_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_aperture_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_bandpass_enabled"),
            .current_value = (int)saa7113_config->bandpass_enabled,
            .action = (ui_menu_action_t)ui_camera_saa7113_bandpass_enabled_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_bandpass_center"),
            .current_value = (int)saa7113_config->bandpass_center,
            .count = sizeof(bandpass_center_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_bandpass_center_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_prefilter"),
            .current_value = (int)saa7113_config->prefilter_enabled,
            .action = (ui_menu_action_t)ui_camera_saa7113_prefilter_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_invert"),
            .current_value = (int)saa7113_config->invert,
            .action = (ui_menu_action_t)ui_camera_saa7113_invert_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_hue"),
            .current_value = (int)saa7113_config->hue + 18,
            .count = sizeof(hue_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_hue_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_color_standard"),
            .current_value = (int)saa7113_config->color_standard,
            .count = sizeof(color_standard_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_color_standard_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_chroma_gain_auto"),
            .current_value = (int)saa7113_config->chroma_gain_auto,
            .action = (ui_menu_action_t)ui_camera_saa7113_chroma_gain_auto_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_chroma_gain"),
            .current_value = (int)saa7113_config->chroma_gain_control + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_chroma_gain_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_chroma_bandwidth"),
            .current_value = (int)saa7113_config->chroma_bandwidth,
            .count = sizeof(chroma_bandwidth_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_saa7113_chroma_bandwidth_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_chroma_comb_filter"),
            .current_value = (int)saa7113_config->chroma_comb_filter_enabled,
            .action = (ui_menu_action_t)ui_camera_saa7113_chroma_comb_filter_enabled_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_chroma_killer"),
            .current_value = (int)saa7113_config->chroma_killer_enabled,
            .action = (ui_menu_action_t)ui_camera_saa7113_chroma_killer_action
        },
        {
            .type = UI_MENU_ITEM_LABEL,
            .name = wkc_translations_get_string("camera_reset"),
            .action = (ui_menu_action_t)ui_camera_reset_action
        },
        {
            .type = UI_MENU_ITEM_END,
        }
    };
    UI_CAMERA_SET_OPTIONS(items[0].options, fuse_options);
    UI_CAMERA_SET_OPTIONS(items[2].options, common_range_options);
    UI_CAMERA_SET_OPTIONS(items[3].options, auto_gain_interval_options);
    UI_CAMERA_SET_OPTIONS(items[5].options, aperture_options);
    UI_CAMERA_SET_OPTIONS(items[7].options, bandpass_center_options);
    UI_CAMERA_SET_OPTIONS(items[10].options, hue_options);
    UI_CAMERA_SET_OPTIONS(items[11].options, color_standard_options);
    UI_CAMERA_SET_OPTIONS(items[13].options, common_range_options);
    UI_CAMERA_SET_OPTIONS(items[14].options, chroma_bandwidth_options);

    ui_menu_item_t *build_result = malloc(sizeof(items));
    memcpy(build_result, items, sizeof(items));
    return build_result;
}

#pragma region ui_camera_tw9910_menu_actions

static void ui_camera_tw9910_auto_gain_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.auto_gain = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_chroma_bandpass_width_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.chroma_bandpass_width = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_blank_level_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.blank_level = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_adaptive_comb_filter_enabled_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.adaptive_comb_filter_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_operation_mode_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.operation_mode = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_pal_delay_line_enabled_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.pal_delay_line_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_sharp_center_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.sharp_center = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_cti_level_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.cti_level = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_sharpness_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.sharpness = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_ntsc_hue_correct_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.ntsc_hue_correct = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_sharpness_coring_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.sharpness_coring = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_vertical_peaking_level_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.vertical_peaking_level = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_cti_coring_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.cti_coring = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_chroma_coring_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.chroma_coring = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_vertical_peaking_coring_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.vertical_peaking_coring = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_cif_level_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.cif_level = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_luma_antialias_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.luma_antialias = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_chroma_antialias_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.chroma_antialias = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_color_standard_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.color_standard = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_auto_gain_max_correction_level_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.auto_gain_max_correction_level = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_peak_agc_loop_gain_control_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.peak_agc_loop_gain_control = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_manual_gain_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.manual_gain_level = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_white_peak_threshold_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.white_peak_threshold = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_clamping_level_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.clamping_level = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_color_killer_max_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.color_killer_max = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_color_killer_min_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.color_killer_min = item->current_value - 10;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_comb_filter_strength_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.comb_filter_strength = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_adaptive_comb_filter_threshold_control_1_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.adaptive_comb_filter_threshold_control_1 = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_adaptive_comb_filter_threshold_control_2_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.adaptive_comb_filter_threshold_control_2 = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_color_killer_fast_mode_enabled_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.color_killer_fast_mode_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_luma_delay_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.luma_delay = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_prefilter_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.prefilter = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_chroma_low_pass_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.chroma_low_pass = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_noisy_color_killer_enabled_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.noisy_color_killer_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_blue_stretch_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.blue_stretch = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_luma_hf_noise_reduction_level_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.luma_hf_noise_reduction_level = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_clamping_mode_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.clamping_mode = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_luma_clamp_enabled_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.luma_clamp_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

static void ui_camera_tw9910_chroma_clamp_enabled_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    camera_control_get_current()->device_config.tw9910.chroma_clamp_enabled = item->current_value;
    UI_CAMERA_CHECK_UPDATE(camera_control_update());
}

#pragma endregion

static ui_menu_item_t *ui_camera_build_tw9910_menu()
{
    tw9910_config_t *config = &camera_control_get_current()->device_config.tw9910;
    char *bandpass_options[] = {
        wkc_translations_get_string("camera_normal"),
        wkc_translations_get_string("camera_wide")
    };
    char *blank_level_options[] = {
        wkc_translations_get_string("camera_auto"),
        "0IRE", "7.5IRE"
    };
    char *operation_mode_options[] = {
        wkc_translations_get_string("camera_mode_0"),
        wkc_translations_get_string("camera_mode_1")
    };
    char *sharp_center_options[] = {
        wkc_translations_get_string("camera_normal"),
        wkc_translations_get_string("camera_high")
    };
    char *range_0_3[] = { "0", "1", "2", "3" };
    char *range_0_7[] = { "0", "1", "2", "3", "4", "5", "6", "7" };
    char *range_0_15[] = {
        "0", "1", "2", "3", "4", "5", "6", "7",
        "8", "9", "10", "11", "12", "13", "14", "15"
    };
    char *cif_level_options[] = {
        wkc_translations_get_string("camera_none"),
        "1.5dB", "3dB", "6dB"
    };
    char *color_standard_options[] = {
        wkc_translations_get_string("camera_auto"),
        "NTSC", "PAL", "SECAM", "NTSC4.43", "PAL(M)", "PAL(CN)", "PAL60"
    };
    char *prefilter_options[] = {
        wkc_translations_get_string("camera_auto"),
        wkc_translations_get_string("camera_bypass"),
        wkc_translations_get_string("camera_horizontal_enhancement"),
        "CIF", "QCIF", "ICON"
    };
    char *chroma_low_pass_options[] = {
        wkc_translations_get_string("camera_disabled"),
        wkc_translations_get_string("camera_low"),
        wkc_translations_get_string("camera_medium"),
        wkc_translations_get_string("camera_high")
    };
    char *hf_noise_options[] = {
        wkc_translations_get_string("camera_none"),
        wkc_translations_get_string("camera_noise_smallest"),
        wkc_translations_get_string("camera_noise_small"),
        wkc_translations_get_string("camera_noise_medium")
    };
    char *clamping_mode_options[] = {
        wkc_translations_get_string("camera_auto"),
        wkc_translations_get_string("camera_clamp_sync_top"),
        wkc_translations_get_string("camera_clamp_pedestal")
    };
    ui_menu_item_t items[] = {
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_auto_gain"),
            .current_value = (int)config->auto_gain,
            .action = (ui_menu_action_t)ui_camera_tw9910_auto_gain_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_chroma_bandpass_width"),
            .current_value = (int)config->chroma_bandpass_width,
            .count = sizeof(bandpass_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_chroma_bandpass_width_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_blank_level"),
            .current_value = (int)config->blank_level,
            .count = sizeof(blank_level_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_blank_level_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_adaptive_comb_filter"),
            .current_value = (int)config->adaptive_comb_filter_enabled,
            .action = (ui_menu_action_t)ui_camera_tw9910_adaptive_comb_filter_enabled_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_operation_mode"),
            .current_value = (int)config->operation_mode,
            .count = sizeof(operation_mode_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_operation_mode_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_pal_delay_line"),
            .current_value = (int)config->pal_delay_line_enabled,
            .action = (ui_menu_action_t)ui_camera_tw9910_pal_delay_line_enabled_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_sharp_center"),
            .current_value = (int)config->sharp_center,
            .count = sizeof(sharp_center_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_sharp_center_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_cti_level"),
            .current_value = (int)config->cti_level,
            .count = sizeof(range_0_3) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_cti_level_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_sharpness"),
            .current_value = (int)config->sharpness,
            .count = sizeof(range_0_15) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_sharpness_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_ntsc_hue_correct"),
            .current_value = (int)config->ntsc_hue_correct + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_ntsc_hue_correct_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_sharpness_coring"),
            .current_value = (int)config->sharpness_coring,
            .count = sizeof(range_0_15) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_sharpness_coring_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_vertical_peaking"),
            .current_value = (int)config->vertical_peaking_level,
            .count = sizeof(range_0_7) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_vertical_peaking_level_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = "CTI Coring",
            .current_value = (int)config->cti_coring,
            .count = sizeof(range_0_3) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_cti_coring_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_chroma_coring"),
            .current_value = (int)config->chroma_coring,
            .count = sizeof(range_0_3) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_chroma_coring_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_vertical_peaking_coring"),
            .current_value = (int)config->vertical_peaking_coring,
            .count = sizeof(range_0_3) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_vertical_peaking_coring_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_cif_level"),
            .current_value = (int)config->cif_level,
            .count = sizeof(cif_level_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_cif_level_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_luma_antialias"),
            .current_value = (int)config->luma_antialias,
            .action = (ui_menu_action_t)ui_camera_tw9910_luma_antialias_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_chroma_antialias"),
            .current_value = (int)config->chroma_antialias,
            .action = (ui_menu_action_t)ui_camera_tw9910_chroma_antialias_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_color_standard"),
            .current_value = (int)config->color_standard,
            .count = sizeof(color_standard_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_color_standard_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_agc_max_correction"),
            .current_value = (int)config->auto_gain_max_correction_level,
            .count = sizeof(range_0_15) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_auto_gain_max_correction_level_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_peak_agc_gain"),
            .current_value = (int)config->peak_agc_loop_gain_control,
            .count = sizeof(range_0_7) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_peak_agc_loop_gain_control_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_manual_gain"),
            .current_value = (int)config->manual_gain_level + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_manual_gain_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_white_peak_threshold"),
            .current_value = (int)config->white_peak_threshold + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_white_peak_threshold_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_clamping_level"),
            .current_value = (int)config->clamping_level,
            .count = sizeof(range_0_15) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_clamping_level_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_color_killer_max"),
            .current_value = (int)config->color_killer_max,
            .count = sizeof(range_0_3) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_color_killer_max_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_color_killer_min"),
            .current_value = (int)config->color_killer_min + 10,
            .count = sizeof(common_range_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_color_killer_min_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_comb_filter_strength"),
            .current_value = !!(int)config->comb_filter_strength,
            .action = (ui_menu_action_t)ui_camera_tw9910_comb_filter_strength_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_comb_threshold_1"),
            .current_value = (int)config->adaptive_comb_filter_threshold_control_1,
            .count = sizeof(range_0_7) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_adaptive_comb_filter_threshold_control_1_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_comb_threshold_2"),
            .current_value = (int)config->adaptive_comb_filter_threshold_control_2,
            .count = sizeof(range_0_15) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_adaptive_comb_filter_threshold_control_2_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_color_killer_fast"),
            .current_value = (int)config->color_killer_fast_mode_enabled,
            .action = (ui_menu_action_t)ui_camera_tw9910_color_killer_fast_mode_enabled_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_luma_delay"),
            .current_value = (int)config->luma_delay,
            .count = sizeof(range_0_7) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_luma_delay_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_prefilter"),
            .current_value = (int)config->prefilter,
            .count = sizeof(prefilter_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_prefilter_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_chroma_low_pass"),
            .current_value = (int)config->chroma_low_pass,
            .count = sizeof(chroma_low_pass_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_chroma_low_pass_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_noisy_color_killer"),
            .current_value = (int)config->noisy_color_killer_enabled,
            .action = (ui_menu_action_t)ui_camera_tw9910_noisy_color_killer_enabled_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_blue_stretch"),
            .current_value = (int)config->blue_stretch,
            .action = (ui_menu_action_t)ui_camera_tw9910_blue_stretch_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_luma_hf_noise"),
            .current_value = (int)config->luma_hf_noise_reduction_level,
            .count = sizeof(hf_noise_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_luma_hf_noise_reduction_level_action
        },
        {
            .type = UI_MENU_ITEM_PICKER,
            .name = wkc_translations_get_string("camera_clamping_mode"),
            .current_value = (int)config->clamping_mode,
            .count = sizeof(clamping_mode_options) / sizeof(char*),
            .action = (ui_menu_action_t)ui_camera_tw9910_clamping_mode_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_luma_clamp"),
            .current_value = (int)config->luma_clamp_enabled,
            .action = (ui_menu_action_t)ui_camera_tw9910_luma_clamp_enabled_action
        },
        {
            .type = UI_MENU_ITEM_SWITCH,
            .name = wkc_translations_get_string("camera_chroma_clamp"),
            .current_value = (int)config->chroma_clamp_enabled,
            .action = (ui_menu_action_t)ui_camera_tw9910_chroma_clamp_enabled_action
        },
        {
            .type = UI_MENU_ITEM_LABEL,
            .name = wkc_translations_get_string("camera_reset"),
            .action = (ui_menu_action_t)ui_camera_reset_action
        },
        {
            .type = UI_MENU_ITEM_END
        }
    };

    UI_CAMERA_SET_OPTIONS(items[1].options, bandpass_options);
    UI_CAMERA_SET_OPTIONS(items[2].options, blank_level_options);
    UI_CAMERA_SET_OPTIONS(items[4].options, operation_mode_options);
    UI_CAMERA_SET_OPTIONS(items[6].options, sharp_center_options);
    UI_CAMERA_SET_OPTIONS(items[7].options, range_0_3);
    UI_CAMERA_SET_OPTIONS(items[8].options, range_0_15);
    UI_CAMERA_SET_OPTIONS(items[9].options, common_range_options);
    UI_CAMERA_SET_OPTIONS(items[10].options, range_0_15);
    UI_CAMERA_SET_OPTIONS(items[11].options, range_0_7);
    UI_CAMERA_SET_OPTIONS(items[12].options, range_0_3);
    UI_CAMERA_SET_OPTIONS(items[13].options, range_0_3);
    UI_CAMERA_SET_OPTIONS(items[14].options, range_0_3);
    UI_CAMERA_SET_OPTIONS(items[15].options, cif_level_options);
    UI_CAMERA_SET_OPTIONS(items[18].options, color_standard_options);
    UI_CAMERA_SET_OPTIONS(items[19].options, range_0_15);
    UI_CAMERA_SET_OPTIONS(items[20].options, range_0_7);
    UI_CAMERA_SET_OPTIONS(items[21].options, common_range_options);
    UI_CAMERA_SET_OPTIONS(items[22].options, common_range_options);
    UI_CAMERA_SET_OPTIONS(items[23].options, range_0_15);
    UI_CAMERA_SET_OPTIONS(items[24].options, range_0_3);
    UI_CAMERA_SET_OPTIONS(items[25].options, common_range_options);
    UI_CAMERA_SET_OPTIONS(items[27].options, range_0_7);
    UI_CAMERA_SET_OPTIONS(items[28].options, range_0_15);
    UI_CAMERA_SET_OPTIONS(items[30].options, range_0_7);
    UI_CAMERA_SET_OPTIONS(items[31].options, prefilter_options);
    UI_CAMERA_SET_OPTIONS(items[32].options, chroma_low_pass_options);
    UI_CAMERA_SET_OPTIONS(items[35].options, hf_noise_options);
    UI_CAMERA_SET_OPTIONS(items[36].options, clamping_mode_options);

    ui_menu_item_t *build_result = malloc(sizeof(items));
    memcpy(build_result, items, sizeof(items));
    return build_result;
}

#pragma region camera_reset_actions

static void ui_camera_reset_cancel_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    parent->menu_close = true;
}

static void ui_camera_reset_confirm_action(ui_menu_item_t *item, ui_camera_t *parent)
{
    int channel = camera_control_get_current()->channel;
    camera_control_reset();
    // Redraw menu
    UI_CAMERA_CHECK_UPDATE(camera_set_channel(channel));
    parent->menu_close = true;
}

#pragma endregion

static ui_menu_item_t *ui_camera_build_reset_menu()
{
    ui_menu_item_t items[] = {
        {
            .type = UI_MENU_ITEM_LABEL,
            .name = wkc_translations_get_string("camera_reset_confirm"),
        },
        {
            .type = UI_MENU_ITEM_LABEL,
            .name = wkc_translations_get_string("camera_cancel"),
            .action = (ui_menu_action_t)ui_camera_reset_cancel_action
        },
        {
            .type = UI_MENU_ITEM_LABEL,
            .name = wkc_translations_get_string("camera_ok"),
            .action = (ui_menu_action_t)ui_camera_reset_confirm_action
        },
        {
            .type = UI_MENU_ITEM_END
        }
    };

    ui_menu_item_t *build_result = malloc(sizeof(items));
    memcpy(build_result, items, sizeof(items));
    return build_result;
}

static void ui_camera_on_show(ui_camera_t *camera)
{
    display_control_operate_hang_request();
    camera->show = true;
    camera->timeout = 0;
    camera->last_selected_index = 1;
    camera->selected_index[0] = 1;
    while (ui_camera_menu_pop(camera));
    ui_camera_t *parent = camera;
    UI_CAMERA_CHECK_UPDATE(camera_poweron());
    UI_CAMERA_CHECK_UPDATE(camera_set_channel(camera_control_get_current()->channel));
    display_control_operate_hang_release();
}

static void ui_camera_draw_main_icon(ui_camera_t *camera, display_format_t *formats,
            display_orientation_t orientation, bool rounded, char *icon,
            display_vector_t *origin, bool active)
{
    char icon_primary[60] = { 0 };
    char icon_secondary[60] = { 0 };
    int icon_width_primary, icon_width_secondary;
    display_get_icon(icon, formats[0], false, icon_primary,
        &icon_width_primary);
    display_get_icon(icon, formats[1], false, icon_secondary,
        &icon_width_secondary);
    display_vector_t origin_primary = display_vector_compensation(
        origin, formats[0]
    );
    display_vector_t origin_secondary = display_vector_compensation(
        origin, formats[1]
    );
    display_rect_t rect = {
        .x = origin->x, .y  = origin->y,
        .width = 24, .height = 24
    };
    display_rect_t rect_rounded = {
        .x = origin->x - 3, .y  = origin->y - 3,
        .width = 30, .height = 30
    };
    display_rect_t rect_primary = display_rect_compensation(
        &rect, formats[0]
    );
    display_rect_t rect_secondary = display_rect_compensation(
        &rect, formats[1]
    );
    display_rect_t rect_rounded_primary = display_rect_compensation(
        &rect_rounded, formats[0]
    );
    display_rect_t rect_rounded_secondary = display_rect_compensation(
        &rect_rounded, formats[1]
    );
    display_rect_expand(&rect_rounded_primary, 1, 1);
    display_rect_expand(&rect_rounded_secondary, 1, 1);
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_fill_rect(0, orientation, &rect_rounded_primary,
            DISPLAY_COLOR_TRANSPARENT);
    display_fill_rect(1, orientation, &rect_rounded_secondary,
        DISPLAY_COLOR_TRANSPARENT);
    display_rect_expand(&rect_rounded_primary, -1, -1);
    display_rect_expand(&rect_rounded_secondary, -1, -1);

    if (active)
    {
        display_rect_t *selected_rect_primary = rounded ?
            &rect_rounded_primary : &rect_primary;
        display_rect_t *selected_rect_secondary = rounded ?
            &rect_rounded_secondary : &rect_secondary;

        display_rect_translate(selected_rect_primary, 1, 1);
        display_rect_translate(selected_rect_secondary, 1, 1);
        if (rounded)
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_ellipse(0, orientation, selected_rect_primary,
                    DISPLAY_COLOR_BLACK);
            display_fill_ellipse(1, orientation, selected_rect_secondary,
                DISPLAY_COLOR_BLACK);
        }
        else
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(0, orientation, selected_rect_primary,
                    DISPLAY_COLOR_BLACK, 2);
            display_fill_rounded_rect(1, orientation, selected_rect_secondary,
                DISPLAY_COLOR_BLACK, 2);
        }
        display_rect_translate(selected_rect_primary, -1, -1);
        display_rect_translate(selected_rect_secondary, -1, -1);

        if (rounded)
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_ellipse(0, orientation, selected_rect_primary,
                    DISPLAY_COLOR_WHITE);
            display_fill_ellipse(1, orientation, selected_rect_secondary,
                DISPLAY_COLOR_WHITE);
        }
        else
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(0, orientation, selected_rect_primary,
                    DISPLAY_COLOR_WHITE, 2);
            display_fill_rounded_rect(1, orientation, selected_rect_secondary,
                DISPLAY_COLOR_WHITE, 2);
        }
    }
    else
    {
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_image(0, orientation, origin_primary.x + 1,
                origin_primary.y + 1, icon_primary,
                icon_width_primary, DISPLAY_COLOR_BLACK);
        display_draw_image(1, orientation, origin_secondary.x + 1,
            origin_secondary.y + 1, icon_secondary,
            icon_width_secondary, DISPLAY_COLOR_BLACK);
    }
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_draw_image(0, orientation, origin_primary.x,
            origin_primary.y, icon_primary,
            icon_width_primary, active ?
            DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
    display_draw_image(1, orientation, origin_secondary.x,
        origin_secondary.y, icon_secondary,
        icon_width_secondary, active ?
        DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
}

static void ui_camera_on_draw(ui_camera_t *camera, display_format_t *formats,
                              display_orientation_t orientation)
{
    int logical_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                        DISPLAY_WIDTH_PAL : DISPLAY_HEIGHT_PAL;
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                         DISPLAY_HEIGHT_PAL : DISPLAY_WIDTH_PAL;
    int max_items = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? 7 : 10;
    if (camera->show)
    {
        DISPLAY_CLEAR_SCREEN(0);
        DISPLAY_CLEAR_SCREEN(1);
    }
    int64_t current_time = esp_timer_get_time();

    // Draw status bar
    if (camera->show || camera->status_request)
    {
        display_vector_t icon_draw_origin = {
            .x = 16, .y = 14
        };
        display_rect_t status_bar_clear_rect = {
            .x = icon_draw_origin.x, .y = icon_draw_origin.y - 2,
            .width = 128, .height = 30
        };
        display_rect_t status_bar_clear_rect_primary = display_rect_compensation(
            &status_bar_clear_rect, formats[0]
        );
        display_rect_t status_bar_clear_rect_secondary = display_rect_compensation(
            &status_bar_clear_rect, formats[1]
        );
        display_fill_rect(0, orientation, &status_bar_clear_rect_primary,
            DISPLAY_COLOR_TRANSPARENT);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rect(1, orientation, &status_bar_clear_rect_secondary,
                DISPLAY_COLOR_TRANSPARENT);

        if (camera_control_get_current()->channel == 0)
            ui_common_draw_status_icon("looks_one", formats, orientation, &icon_draw_origin);
        else if (camera_control_get_current()->channel == 1)
            ui_common_draw_status_icon("looks_two", formats, orientation, &icon_draw_origin);

        if (camera_control_get_current()->current_format == DISPLAY_FORMAT_PAL)
            ui_common_draw_status_icon("pal", formats, orientation, &icon_draw_origin);
        else
            ui_common_draw_status_icon("ntsc", formats, orientation, &icon_draw_origin);

        if (camera_control_get_current()->timeout != CAMERA_TIMEOUT_DISABLED)
            ui_common_draw_status_icon("timer", formats, orientation, &icon_draw_origin);

        if (!camera_is_ready())
            ui_common_draw_status_icon("warning", formats, orientation, &icon_draw_origin);

        display_update(0, orientation, &status_bar_clear_rect_primary);
        display_update(1, orientation, &status_bar_clear_rect_secondary);
    }

    // Draw timeout (centered)
    if (camera->show ||
        camera->timeout_start ||
        camera->timeout != 0 &&
        camera->timeout - current_time > 0 &&
        camera->display_timeout - current_time < 0 ||
        camera->timeout_clear)
    {
        int timeout_num = (int)ceilf((camera->timeout - current_time) / 1e6f);
        display_rect_t timeout_clear_rect ={
            .x = logical_width / 2 - 24, .y = logical_height / 2 - 12,
            .width = 48, .height = 24
        };
        display_rect_t timeout_clear_rect_primary = display_rect_compensation(
            &timeout_clear_rect, formats[0]
        );
        display_rect_t timeout_clear_rect_secondary = display_rect_compensation(
            &timeout_clear_rect, formats[1]
        );
        display_fill_rect(0, orientation, &timeout_clear_rect_primary,
                          DISPLAY_COLOR_TRANSPARENT);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rect(1, orientation, &timeout_clear_rect_secondary,
                              DISPLAY_COLOR_TRANSPARENT);
        if (!camera->timeout_clear && camera->timeout != 0)
        {
            char timeout_str[5];
            sprintf(timeout_str, "%d", timeout_num);
            int timeout_length;
            display_vector_t timeout_size;
            free(font_measure_text(timeout_str, DISPLAY_FORMAT_PAL, 0, &timeout_length,
                &timeout_size));
            display_vector_t timeout_origin = {
                .x = (logical_width - timeout_size.x) / 2,
                .y = (logical_height - timeout_size.y) / 2
            };
            display_vector_t timeout_origin_primary = display_vector_compensation(
                &timeout_origin, formats[0]
            );
            display_vector_t timeout_origin_secondary = display_vector_compensation(
                &timeout_origin, formats[1]
            );
            text_position_descriptor_t *timeout_result_primary = font_measure_text(
                timeout_str, formats[0], 0, NULL, NULL
            );
            text_position_descriptor_t *timeout_result_secondary = font_measure_text(
                timeout_str, formats[1], 0, NULL, NULL
            );
            display_draw_text(0, orientation, timeout_origin_primary.x + 1,
                timeout_origin_primary.y + 1, timeout_result_primary, timeout_length,
                DISPLAY_COLOR_BLACK, formats[0]);
            display_draw_text(0, orientation, timeout_origin_primary.x,
                timeout_origin_primary.y, timeout_result_primary, timeout_length,
                DISPLAY_COLOR_WHITE, formats[0]);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            {
                display_draw_text(1, orientation, timeout_origin_secondary.x + 1,
                    timeout_origin_secondary.y + 1, timeout_result_secondary, timeout_length,
                    DISPLAY_COLOR_BLACK, formats[1]);
                display_draw_text(1, orientation, timeout_origin_secondary.x,
                    timeout_origin_secondary.y, timeout_result_secondary, timeout_length,
                    DISPLAY_COLOR_WHITE, formats[1]);
            }

            free(timeout_result_primary);
            free(timeout_result_secondary);
        }
        display_update(0, orientation, &timeout_clear_rect_primary);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_update(1, orientation, &timeout_clear_rect_secondary);

        if (camera->timeout_start)
        {
            int next;
            switch(camera_control_get_current()->timeout)
            {
                case CAMERA_TIMEOUT_3S:
                    next = 2;
                    break;
                case CAMERA_TIMEOUT_5S:
                    next = 4;
                    break;
                case CAMERA_TIMEOUT_10S:
                    next = 9;
                    break;
                default:
                    next = 0;
                    break;
            }
            camera->display_timeout = camera->timeout - next * (int)1e6;
        }
        else if (camera->display_timeout - current_time < 0)
        {
            camera->display_timeout = camera->timeout - (timeout_num - 1) * (int)1e6;
        }
    }
    // Draw main UI (bottom for non-vertical tiled, right for vertical tiled)
    if (camera->show || camera->main_ui_request)
    {
        display_rect_t main_ui_update_rect;
        display_line_t main_ui_separator;
        if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            main_ui_update_rect = (display_rect_t) {
                .x = logical_width - 44, .y = 0,
                .width = 44, .height = logical_height
            };
            main_ui_separator = (display_line_t) {
                .x1 = logical_width - 42, .y1 = 12,
                .x2 = logical_width - 42, .y2 = logical_height - 12
            };
        }
        else
        {
            main_ui_update_rect = (display_rect_t) {
                .x = 0, .y = logical_height - 44,
                .width = logical_width, .height = 44
            };
            main_ui_separator = (display_line_t) {
                .x1 = 18, .y1 = logical_height - 42,
                .x2 = logical_width - 18, .y2 = logical_height - 42
            };
        }
        display_rect_t main_ui_update_rect_primary = display_rect_compensation(
            &main_ui_update_rect, formats[0]
        );
        display_rect_t main_ui_update_rect_secondary = display_rect_compensation(
            &main_ui_update_rect, formats[1]
        );
        if (camera->show)
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rect(0, orientation, &main_ui_update_rect_primary,
                    DISPLAY_COLOR_TRANSPARENT);
            display_fill_rect(1, orientation, &main_ui_update_rect_secondary,
                DISPLAY_COLOR_TRANSPARENT);
            display_line_t main_ui_separator_primary = display_line_compensation(
                &main_ui_separator, formats[0]
            );
            display_line_t main_ui_separator_secondary = display_line_compensation(
                &main_ui_separator, formats[1]
            );
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            {
                display_line_translate(&main_ui_separator_primary, 1, 1);
                display_draw_line(0, orientation, &main_ui_separator_primary,
                    DISPLAY_COLOR_BLACK, 1);
                display_line_translate(&main_ui_separator_primary, -1, -1);
                display_draw_line(0, orientation, &main_ui_separator_primary,
                    DISPLAY_COLOR_WHITE, 1);
            }
            display_line_translate(&main_ui_separator_secondary, 1, 1);
            display_draw_line(1, orientation, &main_ui_separator_secondary,
                DISPLAY_COLOR_BLACK, 1);
            display_line_translate(&main_ui_separator_secondary, -1, -1);
            display_draw_line(1, orientation, &main_ui_separator_secondary,
                DISPLAY_COLOR_WHITE, 1);
        }

        // Draw icons
        display_vector_t origin_menu, origin_capture, origin_files;
        if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            origin_menu = (display_vector_t) {
                .x = logical_width - 36, .y = 24
            };
            origin_capture = (display_vector_t) {
                .x = logical_width - 36, .y = logical_height / 2 - 12
            };
            origin_files = (display_vector_t) {
                .x = logical_width - 36, .y = logical_height - 48
            };
        }
        else
        {
            origin_menu = (display_vector_t) {
                .x = 24, .y = logical_height - 36
            };
            origin_capture = (display_vector_t) {
                .x = logical_width / 2 - 12, .y = logical_height - 36
            };
            origin_files = (display_vector_t) {
                .x = logical_width - 48, .y = logical_height - 36
            };
        }
        // Draw menu icon
        if (camera->show || camera->selected_index[0] == 0 ||
            camera->last_selected_index == 0)
            ui_camera_draw_main_icon(camera, formats, orientation, false, "menu",
                &origin_menu, camera->selected_index[0] == 0);
        // Draw capture icon
        if (camera->show || camera->selected_index[0] == 1 ||
            camera->last_selected_index == 1)
            ui_camera_draw_main_icon(camera, formats, orientation, true, "camera",
                &origin_capture, camera->selected_index[0] == 1);
        // Draw files icon
        if (camera->show || camera->selected_index[0] == 2 ||
            camera->last_selected_index == 2)
            ui_camera_draw_main_icon(camera, formats, orientation, false, "folder",
                &origin_files, camera->selected_index[0] == 2);

        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_update(0, orientation, &main_ui_update_rect_primary);
        display_update(1, orientation, &main_ui_update_rect_secondary);
    }
    // Draw menu
    int menu_count = ui_camera_get_menu_count(camera);
    ui_menu_alignment_t horizontal_alignment = UI_MENU_ALIGN_BEGIN;
    ui_menu_alignment_t vertical_alignment = UI_MENU_ALIGN_END;
    display_vector_t menu_origin = orientation ==
        DISPLAY_ORIENTATION_VERTICAL_TILED ? (display_vector_t) {
            .x = 18, .y = logical_height - 18
        } : (display_vector_t) {
            .x = 18, .y = logical_height - 48
        };
    if (camera->menu_close)
    {
        display_rect_t menu_border = ui_common_menu_get_border(
            camera->current_menu[menu_count - 1], &menu_origin,
            horizontal_alignment, vertical_alignment, max_items
        );
        display_rect_t menu_border_primary = display_rect_compensation(
            &menu_border, formats[0]
        );
        display_rect_t menu_border_secondary = display_rect_compensation(
            &menu_border, formats[1]
        );
        display_rect_expand(&menu_border_primary, 2, 2);
        display_rect_expand(&menu_border_secondary, 2, 2);
        display_fill_rect(0, orientation, &menu_border_primary,
            DISPLAY_COLOR_TRANSPARENT);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rect(1, orientation, &menu_border_secondary,
                DISPLAY_COLOR_TRANSPARENT);
        display_update(0, orientation, &menu_border_primary);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_update(1, orientation, &menu_border_secondary);

        while(ui_camera_menu_pop(camera));
        camera->menu_close = false;
        camera->status_request = true;
        ui_camera_on_draw(camera, formats, orientation);
        return;
    }
    else if (menu_count && (camera->show || camera->menu_request))
    {
        if (camera->last_selected_index < 0 || camera->show ||
            camera->last_selected_index / max_items !=
            camera->selected_index[menu_count] / max_items)
        {
            ui_menu_item_t *previous_menu = NULL;
            if (camera->last_selected_index < 0)
            {
                if (menu_count > 1)
                    previous_menu = camera->current_menu[menu_count - 2];
            }
            else if (camera->last_selected_index / max_items !=
                     camera->selected_index[menu_count] / max_items)
            {
                previous_menu = camera->current_menu[menu_count - 1];
            }
            if (previous_menu)
            {
                display_rect_t previous_menu_border = ui_common_menu_get_border(
                    previous_menu, &menu_origin,
                    horizontal_alignment, vertical_alignment, max_items
                );
                display_rect_t previous_menu_border_primary = display_rect_compensation(
                    &previous_menu_border, formats[0]
                );
                display_rect_t previous_menu_border_secondary = display_rect_compensation(
                    &previous_menu_border, formats[1]
                );
                display_rect_expand(&previous_menu_border_primary, 2, 2);
                display_rect_expand(&previous_menu_border_secondary, 2, 2);
                display_fill_rect(0, orientation, &previous_menu_border_primary,
                    DISPLAY_COLOR_TRANSPARENT);
                if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                    display_fill_rect(1, orientation, &previous_menu_border_secondary,
                        DISPLAY_COLOR_TRANSPARENT);
                display_update(0, orientation, &previous_menu_border_primary);
                if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                    display_update(1, orientation, &previous_menu_border_secondary);
            }
            ui_common_menu_draw_item(camera->current_menu[menu_count - 1],
                camera->selected_index[menu_count], true, 0, &menu_origin,
                horizontal_alignment, vertical_alignment, formats, orientation, true, max_items);
        }
        else
        {
            ui_common_menu_draw_item(camera->current_menu[menu_count - 1],
                camera->last_selected_index, false, 0, &menu_origin,
                horizontal_alignment, vertical_alignment, formats, orientation, false, max_items);
            ui_common_menu_draw_item(camera->current_menu[menu_count - 1],
                camera->selected_index[menu_count], true, 0, &menu_origin,
                horizontal_alignment, vertical_alignment, formats, orientation, false, max_items);
        }
    }

    camera->show = false;
    camera->status_request = false;
    camera->timeout_start = false;
    camera->timeout_clear = false;
    camera->main_ui_request = false;
    camera->menu_request = false;
}

static void ui_camera_capture(ui_camera_t *camera,
                              display_orientation_t orientation, bool ignore_timeout)
{
    camera_control_t *control = camera_control_get_current();
    int64_t current_time = esp_timer_get_time();
    if (!camera_is_ready())
    {
        ui_shell_show_toast(camera->base.parent,
            wkc_translations_get_string("camera_not_ready"), 5);
        camera_set_channel(control->channel);
        camera->status_request = true;
    }
    else if (!ignore_timeout && control->timeout != CAMERA_TIMEOUT_DISABLED)
    {
        int64_t timeout_increment = control->timeout == CAMERA_TIMEOUT_3S ?
            (int)3e6 : control->timeout == CAMERA_TIMEOUT_5S ? (int)5e6 :
            (int)1e7;
        camera->timeout = current_time + timeout_increment;
        camera->timeout_start = true;
    }
    else
    {
        uint8_t *capture_result;
        DISPLAY_CLEAR_SCREEN(0);
        DISPLAY_CLEAR_SCREEN(1);
        int image_size = camera_capture(&capture_result);
        if (image_size <= 0)
        {
            ui_shell_show_toast(camera->base.parent,
                wkc_translations_get_string("camera_fail"), 5);
            camera_set_channel(control->channel);
            camera->status_request = true;
        }
        else
        {
            char file_name[60];
            struct timeval current_timeval;
            gettimeofday(&current_timeval, NULL);
            struct tm *current_tm = localtime(&current_timeval.tv_sec);
            struct tm current_tm_from_day;
            memcpy(&current_tm_from_day, current_tm, sizeof(struct tm));
            current_tm_from_day.tm_hour = 0;
            current_tm_from_day.tm_min = 0;
            current_tm_from_day.tm_sec = 0;
            time_t current_time_from_day = mktime(&current_tm_from_day);

            sprintf(file_name, CAMERA_SAVE_PATTERN, current_tm->tm_year + 1900,
                current_tm->tm_mon, current_tm->tm_mday,
                (int)((current_timeval.tv_sec - current_time_from_day) * 1000 +
                current_timeval.tv_usec / 1000));
            if(wkc_save(file_name, (char*)capture_result, image_size))
                ui_shell_show_toast(camera->base.parent,
                    wkc_translations_get_string("camera_fail"), 5);
        }
        camera->show = true;
    }
}

static void ui_camera_timeout_stop(ui_camera_t *camera)
{
    camera->timeout = 0;
    camera->timeout_clear = true;
}

static void ui_camera_on_key_event(ui_camera_t *camera, int key_code)
{
    display_orientation_t orientation = ui_shell_get_orientation(camera->base.parent);
    int menu_count = ui_camera_get_menu_count(camera);
    if (menu_count == 0)
    {
        if ((key_code == UI_KEY_CODE_LEFT &&
            orientation != DISPLAY_ORIENTATION_VERTICAL_TILED ||
            key_code == UI_KEY_CODE_UP &&
            orientation == DISPLAY_ORIENTATION_VERTICAL_TILED) &&
            camera->selected_index[0] != 0)
        {
            camera->last_selected_index = camera->selected_index[0];
            camera->selected_index[0] = clamp(camera->selected_index[0] - 1, 0, 2);
            camera->main_ui_request = true;
        }
        else if ((key_code == UI_KEY_CODE_RIGHT &&
            orientation != DISPLAY_ORIENTATION_VERTICAL_TILED ||
            key_code == UI_KEY_CODE_DOWN &&
            orientation == DISPLAY_ORIENTATION_VERTICAL_TILED) &&
            camera->selected_index[0] != 2)
        {
            camera->last_selected_index = camera->selected_index[0];
            camera->selected_index[0] = clamp(camera->selected_index[0] + 1, 0, 2);
            camera->main_ui_request = true;
        }
        else if (key_code == UI_KEY_CODE_EXIT)
        {
            ui_camera_timeout_stop(camera);
            ui_page_t *home = ui_shell_find_page(camera->base.parent, UI_PAGE_TYPE_HOME);
            ui_shell_show_page(camera->base.parent, home);
        }
        else if (key_code == UI_KEY_CODE_MENU ||
                 camera->selected_index[0] == 0 && key_code == UI_KEY_CODE_OK)
        {
            ui_camera_menu_push(camera, ui_camera_build_common_menu());
            ui_camera_timeout_stop(camera);
            camera->last_selected_index = -1;
            camera->selected_index[1] = 0;
            camera->menu_request = true;
        }
        else if (camera->selected_index[0] == 1 && key_code == UI_KEY_CODE_OK)
        {
            ui_camera_capture(camera, orientation, false);
        }
        else if (camera->selected_index[0] == 2 && key_code == UI_KEY_CODE_OK)
        {
            ui_files_show(camera->base.parent, true);
        }
    }
    else
    {
        int item_count = ui_common_menu_get_item_count(
                         camera->current_menu[menu_count - 1]);
        if (key_code == UI_KEY_CODE_EXIT)
        {
            camera->menu_close = true;
        }
        else if (key_code != UI_KEY_CODE_MENU)
        {
            camera->menu_request = true;
            camera->last_selected_index = camera->selected_index[menu_count];
            ui_menu_item_t *current_item = &camera->current_menu[menu_count - 1][
                camera->selected_index[menu_count]];
            int last_value = current_item->current_value;
            if (key_code == UI_KEY_CODE_UP || key_code == UI_KEY_CODE_DOWN)
            {
                camera->selected_index[menu_count] = clamp(
                    camera->selected_index[menu_count] + (key_code ==
                    UI_KEY_CODE_DOWN ? 1 : key_code == UI_KEY_CODE_UP ? -1 : 0),
                    0, item_count - 1);
                if (camera->last_selected_index ==
                    camera->selected_index[menu_count])
                    camera->menu_request = false;
            }
            else if (key_code == UI_KEY_CODE_LEFT || key_code == UI_KEY_CODE_RIGHT)
            {
                if (current_item->type == UI_MENU_ITEM_PICKER)
                {
                    current_item->current_value = clamp(
                        current_item->current_value + (key_code == UI_KEY_CODE_RIGHT ? 1 :
                        key_code == UI_KEY_CODE_LEFT ? -1 : 0), 0, current_item->count - 1);
                    if (last_value != current_item->current_value)
                    {
                        if(current_item->action)
                            current_item->action(current_item, (ui_page_t*)camera);
                    }
                    else camera->menu_request = false;
                }
            }
            else if (key_code == UI_KEY_CODE_OK)
            {
                if (current_item->type == UI_MENU_ITEM_LABEL ||
                    current_item->type == UI_MENU_ITEM_SWITCH)
                {
                    if (current_item->type == UI_MENU_ITEM_SWITCH)
                        current_item->current_value = !current_item->current_value;
                    if (current_item->action)
                        current_item->action(current_item, (ui_page_t*)camera);
                    else
                        camera->menu_request = false;
                }
                else
                {
                    camera->menu_request = false;
                }
            }
        }
    }
}

static void ui_camera_on_format_changed(ui_camera_t *camera)
{
    camera->show = true;
    camera_set_channel(camera_control_get_current()->channel);
}

static void ui_camera_on_mainloop(ui_camera_t *camera, bool on_foreground)
{
    if (!on_foreground)
    {
        if (camera_get_power_state())
            camera_powerdown();
    }
    else
    {
        if (camera->timeout != 0)
        {
            ui_shell_acquire_interval(camera->base.parent, 100);
            if (esp_timer_get_time() - camera->timeout > 0)
            {
                ui_camera_capture(camera, ui_shell_get_orientation(camera->base.parent),
                                  true);
                ui_camera_timeout_stop(camera);
            }
        }
    }
}

ui_page_t *ui_camera_create()
{
    ui_camera_t *camera = (ui_camera_t*)calloc(1, sizeof(ui_camera_t));
    camera->base.type = UI_PAGE_TYPE_CAMERA;
    camera->base.on_show = (ui_page_event_t)ui_camera_on_show;
    camera->base.on_draw = (ui_page_draw_event_t)ui_camera_on_draw;
    camera->base.on_key_event = (ui_page_key_event_t)ui_camera_on_key_event;
    camera->base.on_mainloop = (ui_page_mainloop_event_t)ui_camera_on_mainloop;
    camera->base.on_format_changed = (ui_page_event_t)ui_camera_on_format_changed;
    return (ui_page_t*)camera;
}

int ui_camera_show(ui_shell_t *shell)
{
    if (!shell) return 1;
    int ensure = wkc_storage_ensure_capture_dir();
    if (ensure)
    {
        ui_shell_show_toast(shell,
            wkc_translations_get_string("files_insert_sd_card"), 5);
        return 1;
    }
    else
    {
        camera_device_type_t device_type = camera_control_get_current()->device_type;
        if (device_type != CAMERA_DEVICE_SAA7113 &&
            device_type != CAMERA_DEVICE_TW9910)
        {
            ui_shell_show_toast(shell,
                wkc_translations_get_string("camera_control_not_available"), 5);
            return 1;
        }
        ui_page_t *camera = ui_shell_find_page(shell, UI_PAGE_TYPE_CAMERA);
        if (camera != NULL)
        {
            if (battery_calibration_is_calibrating())
            {
                ui_shell_show_toast(ui_shell_get_current(), wkc_translations_get_string(
                    "camera_disabled_calibrate"), 5);
                return 1;
            }
            else ui_shell_show_page(shell, camera);
            return 0;
        }
    }
    return 1;
}