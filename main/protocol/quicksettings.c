#include <stdint.h>
#include <string.h>
#include "cJSON.h"
#include "esp_log.h"
#include "command_parser.h"
#include "profile/translations.h"
#include "profile/settings.h"
#include "profile/userprofile.h"
#include "peripherals/pwm.h"
#include "peripherals/lock.h"
#include "display/display_control.h"
#include "ui/shell.h"
#include "ui/home.h"
#include "ui/camera.h"
#include "ui/files.h"

static char *quicksettings_output = NULL;
static int read_pos = 0;

static void clear_output()
{
    if (quicksettings_output) free(quicksettings_output);
    quicksettings_output = NULL;
    read_pos = 0;
}

int protocol_quicksettings_get_current_output(uint8_t *buffer, int request_length)
{
    if (!quicksettings_output || read_pos >= strlen(quicksettings_output))
    {
        buffer[0] = 0;
        return 1;
    }
    int actual_length;
    if (strlen(quicksettings_output) - read_pos <= request_length)
    {
        actual_length = strlen(quicksettings_output) - read_pos;
        buffer[0] = 0;
    }
    else
    {
        actual_length = request_length;
        buffer[0] = 1;
    }
    memcpy(&buffer[1], &quicksettings_output[read_pos], actual_length);
    if (buffer[0] == 0) clear_output();
    read_pos += request_length;
    return actual_length + 1;
}

int protocol_quicksettings_get_table(char *key)
{
    clear_output();
    wkc_userprofile_acquire_semaphore();
    wkc_userprofile_t *profile = wkc_userprofile_get_current();
    wkc_table_item_t userprofile_items[] = {
        {
            .type = WKC_TABLE_ITEM_STRING,
            .name = "device_name",
            .display_name = wkc_translations_get_string("device_info_device_name"),
            .length = 30,
            .string = profile->device_name
        },
        {
            .type = WKC_TABLE_ITEM_STRING,
            .name = "owner",
            .display_name = wkc_translations_get_string("device_info_owner"),
            .length = 30,
            .string = profile->owner
        },
        {
            .type = WKC_TABLE_ITEM_STRING,
            .name = "character",
            .display_name = wkc_translations_get_string("device_info_character"),
            .length = 30,
            .string = profile->character
        },
        {
            .type = WKC_TABLE_ITEM_STRING,
            .name = "manufacturer",
            .display_name = wkc_translations_get_string("device_info_manufacturer"),
            .length = 30,
            .string = profile->manufacturer
        },
        {
            .type = WKC_TABLE_ITEM_END
        }
    };

    wkc_settings_t *settings = wkc_settings_get_current();
    char *screen_orientation_options[] = {
        wkc_translations_get_string("settings_horizontal"),
        wkc_translations_get_string("settings_vertical"),
        wkc_translations_get_string("settings_vertical_tiled"),
    };
    char *output_mode_options[] = {
        wkc_translations_get_string("settings_rising_edge"),
        wkc_translations_get_string("settings_falling_edge"),
        wkc_translations_get_string("settings_debug_mode"),
    };
    char *capture_card_output_options[] = {
        wkc_translations_get_string("settings_screen_id_1"),
        wkc_translations_get_string("settings_screen_id_2"),
    };
    wkc_table_item_t display_items[] = {
        {
            .type = WKC_TABLE_ITEM_PICKER,
            .name = "screen_orientation",
            .display_name = wkc_translations_get_string("settings_screen_orientation"),
            .count = 3,
            .options = screen_orientation_options,
            .value = settings->display.orientation
        },
        {
            .type = WKC_TABLE_ITEM_PICKER,
            .name = "output_mode",
            .display_name = wkc_translations_get_string("settings_output_mode"),
            .count = 3,
            .options = output_mode_options,
            .value = settings->display.output_mode
        },
        {
            .type = WKC_TABLE_ITEM_PICKER,
            .name = "capture_card_output",
            .display_name = wkc_translations_get_string("settings_capture_output"),
            .count = 2,
            .options = capture_card_output_options,
            .value = settings->display.capture_index
        },
        {
            .type = WKC_TABLE_ITEM_SWITCH,
            .name = "capture_with_osd",
            .display_name = wkc_translations_get_string("settings_capture_osd"),
            .value = settings->display.capture_osd
        },
        {
            .type = WKC_TABLE_ITEM_END
        }
    };

    char *power_save_options[] = {
        wkc_translations_get_string("settings_never"),
        wkc_translations_get_string("settings_1min"),
        wkc_translations_get_string("settings_5min"),
        wkc_translations_get_string("settings_10min")
    };
    char *homepage_status_bar_position_options[] = {
        wkc_translations_get_string("settings_top"),
        wkc_translations_get_string("settings_bottom")
    };
    wkc_table_item_t misc_items[] = {
        {
            .type = WKC_TABLE_ITEM_PICKER,
            .name = "power_save",
            .display_name = wkc_translations_get_string("settings_power_save"),
            .count = 4,
            .options = power_save_options,
            .value = settings->power_save
        },
        {
            .type = WKC_TABLE_ITEM_SWITCH,
            .name = "keep_advertise",
            .display_name = wkc_translations_get_string("settings_keep_advertise"),
            .value = settings->keep_advertise
        },
        {
            .type = WKC_TABLE_ITEM_SWITCH,
            .name = "remember_peripherals",
            .display_name = wkc_translations_get_string("settings_remember_peripherals"),
            .value = settings->peripherals.remember_state
        },
        {
            .type = WKC_TABLE_ITEM_PICKER,
            .name = "homepage_status_bar_position",
            .display_name = wkc_translations_get_string("settings_homepage_status_bar_position"),
            .count = 2,
            .options = homepage_status_bar_position_options,
            .value = settings->homepage_status_bar_position
        },
        {
            .type = WKC_TABLE_ITEM_END
        }
    };
    wkc_table_group_t groups[] = {
        {
            .name = wkc_translations_get_string("device_info_title"),
            .items = userprofile_items
        },
        {
            .name = wkc_translations_get_string("settings_display_settings"),
            .items = display_items
        },
        {
            .name = wkc_translations_get_string("settings_misc_settings"),
            .items = misc_items
        }
    };

    if (key == NULL)
    {
        quicksettings_output = wkc_table_build(groups, sizeof(groups) / sizeof(wkc_table_group_t));
        wkc_userprofile_release_semaphore();
        return 0;
    }
    else
    {
        cJSON *extracted = NULL;
        wkc_table_item_t *found_item = wkc_table_group_find_item(groups,
                                       sizeof(groups) / sizeof(wkc_table_group_t), key);
        if (!found_item)
        {
            wkc_userprofile_release_semaphore();
            return 1;
        }
        extracted = wkc_table_item_extract(found_item, true);
        if (extracted)
        {
            quicksettings_output = cJSON_Print(extracted);
            cJSON_Delete(extracted);
            wkc_userprofile_release_semaphore();
            return 0;
        }
        else
        {
            wkc_userprofile_release_semaphore();
            return 1;
        }
    }
}

static void quicksettings_check_settings_home()
{
    ui_shell_t *shell = ui_shell_get_current();
    ui_page_t *page = ui_shell_get_current_page(shell);
    if (page->type == UI_PAGE_TYPE_SETTINGS)
    {
        ui_page_t *home = ui_shell_find_page(shell, UI_PAGE_TYPE_HOME);
        ui_shell_show_page(shell, home);
    }
    else if (page->type == UI_PAGE_TYPE_HOME)
    {
        ui_home_update_from_shell(shell);
    }
}

uint8_t protocol_quicksettings_write(char *command)
{
    cJSON *command_json = cJSON_Parse(command);
    if (!command_json) return 1;
    wkc_userprofile_acquire_semaphore();
    quicksettings_check_settings_home();
    cJSON *child = command_json->child;
    wkc_userprofile_t *profile = wkc_userprofile_get_current();
    wkc_settings_t *settings = wkc_settings_get_current();
    int ret = 1;
    do
    {
        if (!child->string) continue;
        else if (strcmp(child->string, "device_name") == 0)
        {
            free(profile->device_name);
            profile->device_name = font_crop_text(cJSON_GetStringValue(child), 30);
            wkc_userprofile_save();
            ret = 0;
        }
        else if (strcmp(child->string, "owner") == 0)
        {
            free(profile->owner);
            profile->owner = font_crop_text(cJSON_GetStringValue(child), 30);
            wkc_userprofile_save();
            ret = 0;
        }
        else if (strcmp(child->string, "character") == 0)
        {
            free(profile->character);
            profile->character = font_crop_text(cJSON_GetStringValue(child), 30);
            wkc_userprofile_save();
            ret = 0;
        }
        else if (strcmp(child->string, "manufacturer") == 0)
        {
            free(profile->manufacturer);
            profile->manufacturer = font_crop_text(cJSON_GetStringValue(child), 30);
            wkc_userprofile_save();
            ret = 0;
        }
        else if (strcmp(child->string, "screen_orientation") == 0)
        {
            settings->display.orientation = (int)cJSON_GetNumberValue(child);
            display_settings_update();
            wkc_settings_save();
            ret = 0;
        }
        else if (strcmp(child->string, "output_mode") == 0)
        {
            settings->display.output_mode = (int)cJSON_GetNumberValue(child);
            display_settings_update();
            wkc_settings_save();
            ret = 0;
        }
        else if (strcmp(child->string, "capture_card_output") == 0)
        {
            settings->display.capture_index = (int)cJSON_GetNumberValue(child);
            display_settings_update();
            wkc_settings_save();
            ret = 0;
        }
        else if (strcmp(child->string, "capture_with_osd") == 0)
        {
            settings->display.capture_osd = cJSON_IsTrue(child);
            display_settings_update();
            wkc_settings_save();
            ret = 0;
        }
        else if (strcmp(child->string, "power_save") == 0)
        {
            settings->power_save = (int)cJSON_GetNumberValue(child);
            wkc_settings_save();
            ret = 0;
        }
        else if (strcmp(child->string, "keep_advertise") == 0)
        {
            settings->keep_advertise = cJSON_IsTrue(child);
            wkc_settings_save();
            ret = 0;
        }
        else if (strcmp(child->string, "remember_peripherals") == 0)
        {
            settings->peripherals.remember_state = cJSON_IsTrue(child);
            wkc_settings_save();
            ret = 0;
        }
        else if (strcmp(child->string, "homepage_status_bar_position") == 0)
        {
            settings->homepage_status_bar_position = cJSON_GetNumberValue(child);
            wkc_settings_save();
            ret = 0;
        }
        child = child->next;
    } while(child);
    wkc_userprofile_release_semaphore();
    cJSON_Delete(command_json);
    return ret;
}