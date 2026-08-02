#include <stdint.h>
#include <string.h>
#include "cJSON.h"
#include "esp_log.h"
#include "command_parser.h"
#include "profile/translations.h"
#include "peripherals/pwm.h"
#include "peripherals/lock.h"
#include "ui/shell.h"
#include "ui/home.h"
#include "ui/camera.h"
#include "ui/files.h"

static char *shortcut_output = NULL;
static int read_pos = 0;

static void clear_output()
{
    if (shortcut_output) free(shortcut_output);
    shortcut_output = NULL;
    read_pos = 0;
}

int protocol_shortcut_get_current_output(uint8_t *buffer, int request_length)
{
    if (!shortcut_output || read_pos >= strlen(shortcut_output))
    {
        buffer[0] = 0;
        return 1;
    }
    int actual_length;
    if (strlen(shortcut_output) - read_pos <= request_length)
    {
        actual_length = strlen(shortcut_output) - read_pos;
        buffer[0] = 0;
    }
    else
    {
        actual_length = request_length;
        buffer[0] = 1;
    }
    memcpy(&buffer[1], &shortcut_output[read_pos], actual_length);
    if (buffer[0] == 0) clear_output();
    read_pos += request_length;
    return actual_length + 1;
}

int protocol_shortcut_get_table(char *key)
{
    clear_output();
    char *lock_options[] = {
        wkc_translations_get_string("shortcut_lock"),
        wkc_translations_get_string("shortcut_unlock")
    };
    char *open[] = { wkc_translations_get_string("shortcut_open") };
    wkc_table_item_t shortcut_items[] = {
        {
            .type = WKC_TABLE_ITEM_ACTION,
            .name = "camera",
            .display_name = wkc_translations_get_string("menu_camera"),
            .count = 1,
            .options = open
        },
        {
            .type = WKC_TABLE_ITEM_ACTION,
            .name = "files",
            .display_name = wkc_translations_get_string("menu_files"),
            .count = 1,
            .options = open
        },
        {
            .type = WKC_TABLE_ITEM_INTEGER,
            .name = "eye",
            .display_name = wkc_translations_get_string("menu_eye"),
            .min = 0,
            .max = 3,
            .value = pwm_device_get_eye_level()
        },
        {
            .type = WKC_TABLE_ITEM_INTEGER,
            .name = "fan",
            .display_name = wkc_translations_get_string("menu_fan"),
            .min = 0,
            .max = 3,
            .value = pwm_device_get_fan_level()
        },
        {
            .type = WKC_TABLE_ITEM_ACTION,
            .name = "lock",
            .display_name = wkc_translations_get_string("menu_lock"),
            .count = 2,
            .options = lock_options
        },
        {
            .type = WKC_TABLE_ITEM_END
        }
    };
    wkc_table_group_t groups[] = {
        {
            .name = wkc_translations_get_string("shortcut_shortcuts"),
            .items = shortcut_items
        }
    };

    if (key == NULL)
    {
        shortcut_output = wkc_table_build(groups, sizeof(groups) / sizeof(wkc_table_group_t));
        return 0;
    }
    else
    {
        cJSON *extracted = NULL;
        wkc_table_item_t *found_item = wkc_table_group_find_item(groups,
                                       sizeof(groups) / sizeof(wkc_table_group_t), key);
        if (!found_item)
            return 1;
        extracted = wkc_table_item_extract(found_item, true);
        if (extracted)
        {
            shortcut_output = cJSON_Print(extracted);
            cJSON_Delete(extracted);
            return 0;
        }
        else return 1;
    }
}

static void shortcut_check_menu_home()
{
    ui_shell_t *shell = ui_shell_get_current();
    ui_page_t *page = ui_shell_get_current_page(shell);
    if (page->type == UI_PAGE_TYPE_MENU)
    {
        ui_page_t *home = ui_shell_find_page(shell, UI_PAGE_TYPE_HOME);
        ui_shell_show_page(shell, home);
    }
    else if (page->type == UI_PAGE_TYPE_HOME)
    {
        ui_home_update_from_shell(shell);
    }
}

uint8_t protocol_shortcut_write(char *command)
{
    cJSON *command_json = cJSON_Parse(command);
    if (!command_json) return 1;
    cJSON *child = command_json->child;
    int ret = 1;
    ui_page_type_t current_page_type = ui_shell_get_current_page(
                                       ui_shell_get_current())->type;
    do
    {
        if (!child->string) continue;
        else if (strcmp(child->string, "camera") == 0)
        {
            if (current_page_type != UI_PAGE_TYPE_CAMERA)
                ui_camera_show(ui_shell_get_current());
            ret = 0;
        }
        else if (strcmp(child->string, "files") == 0)
        {
            if (current_page_type != UI_PAGE_TYPE_FILES)
                ui_files_show(ui_shell_get_current(),
                              current_page_type == UI_PAGE_TYPE_CAMERA);
            ret = 0;
        }
        else if (strcmp(child->string, "eye") == 0)
        {
            int level = (int)cJSON_GetNumberValue(child);
            pwm_device_set_eye_level(level);
            shortcut_check_menu_home();
            ret = 0;
        }
        else if (strcmp(child->string, "fan") == 0)
        {
            int level = (int)cJSON_GetNumberValue(child);
            pwm_device_set_fan_level(level);
            shortcut_check_menu_home();
            ret = 0;
        }
        else if (strcmp(child->string, "lock") == 0)
        {
            bool state = !(int)cJSON_GetNumberValue(child);
            int lock_result = lock_set(state, false);
            if (lock_result)
                ui_shell_show_toast(ui_shell_get_current(), lock_result_to_char(lock_result), 5);
            shortcut_check_menu_home();
            ret = 0;
        }
        child = child->next;
    } while(child);
    cJSON_Delete(command_json);
    return ret;
}