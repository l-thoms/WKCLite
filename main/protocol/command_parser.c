#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include "esp_log.h"
#include "command_parser.h"
#include "cJSON.h"
#include "host/ble_gatt.h"
#include "host/ble_uuid.h"
#include "host/ble_hs.h"
#include "ui/ui_common.h"
#include "ui/shell.h"
#include "io/io_extend.h"
#include "display/display_control.h"
#include "shortcut.h"
#include "quicksettings.h"

#define WKC_NOTIFY_DEFAULT() do {                                           \
os_mbuf_append(notify_om, (uint8_t[]) {(uint8_t)WKC_NOTIFY_SUCCESSED}, 1);  \
ble_gatts_notify_custom(conn_handle, attr_handle, notify_om);} while(0)

#define WKC_NOTIFY_SINGLE(result) do {                                  \
os_mbuf_append(notify_om, (uint8_t[]) {(uint8_t)result}, 1);            \
ble_gatts_notify_custom(conn_handle, attr_handle, notify_om);} while(0)

static wkc_command_t current_command = WKC_CMD_NONE;

int wkc_write_command(uint16_t conn_handle, uint16_t attr_handle,
    uint8_t* command, int length, ui_shell_t *shell)
{
    if(length == 0) return 0;
    wkc_command_t command_type = command[0];
    current_command = (wkc_command_t)command_type;
    struct os_mbuf *notify_om = ble_hs_mbuf_att_pkt();
    int ret = 0;
    display_reset_power_save();
    switch (command_type)
    {
        case WKC_CMD_KEY_CODE:
        {
            ui_shell_send_key(shell, command[1]);
            WKC_NOTIFY_DEFAULT();
        }
        break;
        case WKC_CMD_TIME_SYNC:
        {
            if (length < 7)
            {
                WKC_NOTIFY_SINGLE(1);
            }
            else
            {
                struct tm time_data = {
                    .tm_year = (int)command[1] + 100,
                    .tm_mon = (int)command[2] - 1,
                    .tm_mday = (int)command[3],
                    .tm_hour = (int)command[4],
                    .tm_min = (int)command[5],
                    .tm_sec = (int)command[6],
                };
                if(io_extend_save_time(&time_data))
                {
                    WKC_NOTIFY_SINGLE(WKC_NOTIFY_FAILED);
                }
                else WKC_NOTIFY_DEFAULT();
            }
        }
        break;
        case WKC_CMD_READ_SHORTCUT_TABLE:
            protocol_shortcut_get_table(NULL);
            WKC_NOTIFY_DEFAULT();
            break;
        case WKC_CMD_READ_SHORTCUT_ITEM:
            WKC_NOTIFY_SINGLE(!!protocol_shortcut_get_table((char*)&command[1]));
            break;
        case WKC_CMD_WRITE_SHORTCUT:
            WKC_NOTIFY_SINGLE(!!protocol_shortcut_write((char*)&command[1]));
            break;
        case WKC_CMD_READ_SETTINGS_TABLE:
            protocol_quicksettings_get_table(NULL);
            WKC_NOTIFY_DEFAULT();
            break;
        case WKC_CMD_READ_SETTINGS_ITEM:
            WKC_NOTIFY_SINGLE(!!protocol_quicksettings_get_table((char*)&command[1]));
            break;
        case WKC_CMD_WRITE_SETTINGS:
            WKC_NOTIFY_SINGLE(!!protocol_quicksettings_write((char*)&command[1]));
            break;
        default:
        {
            WKC_NOTIFY_SINGLE(WKC_NOTIFY_FAILED);
            ESP_LOGE("WKC_CMD_PARSER", "Command unsupported");
        }
        break;
    }
    os_mbuf_free_chain(notify_om);
    return ret;
}

// Android does not support long read, so the data should be splitted
uint8_t *wkc_get_command_output(int *length)
{
    uint8_t *result = NULL;
    *length = 0;
    char *placeholder = "\0{}";
    switch (current_command)
    {
        case WKC_CMD_READ_SHORTCUT_TABLE:
        case WKC_CMD_READ_SHORTCUT_ITEM:
            result = malloc(PROTOCOL_READ_REQUEST_LENGTH + 1);
            *length = protocol_shortcut_get_current_output(result,
                      PROTOCOL_READ_REQUEST_LENGTH);
            break;
        case WKC_CMD_READ_SETTINGS_TABLE:
        case WKC_CMD_READ_SETTINGS_ITEM:
            result = malloc(PROTOCOL_READ_REQUEST_LENGTH + 1);
            *length = protocol_quicksettings_get_current_output(result,
                      PROTOCOL_READ_REQUEST_LENGTH);
            break;
        default:
            *length = sizeof(placeholder) - 1;
            result = malloc(*length);
            memcpy(result, placeholder, *length);
            break;
    }
    return result;
}

static char *table_type_to_char(wkc_table_item_type_t type)
{
    switch (type)
    {
        case WKC_TABLE_ITEM_ACTION:
            return "action";
        case WKC_TABLE_ITEM_SWITCH:
            return "switch";
        case WKC_TABLE_ITEM_INTEGER:
            return "integer";
        case WKC_TABLE_ITEM_DECIMAL:
            return "decimal";
        case WKC_TABLE_ITEM_PICKER:
            return "picker";
        case WKC_TABLE_ITEM_STRING:
            return "string";
        default:
            return "unknown";
    }
}

cJSON *wkc_table_item_extract(wkc_table_item_t *item, bool value_only)
{
    if (item->type == WKC_TABLE_ITEM_END) return NULL;

    cJSON *item_json = cJSON_CreateObject();
    cJSON_AddStringToObject(item_json, "name", item->name);
    if (!value_only)
    {
        cJSON_AddStringToObject(item_json, "display_name", item->display_name);
        cJSON_AddStringToObject(item_json, "type", table_type_to_char(
        item->type));
    }
    switch (item->type)
    {
        case WKC_TABLE_ITEM_ACTION:
        case WKC_TABLE_ITEM_PICKER:
        {
            if (!value_only || item->type == WKC_TABLE_ITEM_ACTION)
            {
                cJSON *options_json = cJSON_AddArrayToObject(item_json, "options");
                for (int k = 0; k < item->count; k++)
                {
                    cJSON *option = cJSON_CreateString(item->options[k]);
                    cJSON_AddItemToArray(options_json, option);
                }
            }
            if (item->type == WKC_TABLE_ITEM_PICKER)
                cJSON_AddNumberToObject(item_json, "value", item->value);
        }
        break;
        case WKC_TABLE_ITEM_SWITCH:
        {
            cJSON_AddBoolToObject(item_json, "value", !!(int)(item->value));
        }
        break;
        case WKC_TABLE_ITEM_INTEGER:
        case WKC_TABLE_ITEM_DECIMAL:
        {
            if (!value_only)
            {
                cJSON_AddNumberToObject(item_json, "min", item->min);
                cJSON_AddNumberToObject(item_json, "max", item->max);
            }
            cJSON_AddNumberToObject(item_json, "value", item->value);
        }
        break;
        case WKC_TABLE_ITEM_STRING:
        {
            if (!value_only)
                cJSON_AddNumberToObject(item_json, "length", item->length);
            cJSON_AddStringToObject(item_json, "value", item->string);
        }
        break;
        default:
            break;
    }
    return item_json;
}

char *wkc_table_build(wkc_table_group_t *groups, int group_num)
{
    cJSON *table_json = cJSON_CreateArray();
    for (int i = 0; i < group_num; i++)
    {
        cJSON *group_json = cJSON_CreateObject();
        cJSON_AddStringToObject(group_json, "name", groups[i].name);
        cJSON *items_json = cJSON_AddArrayToObject(group_json, "items");

        int j = 0;
        while (groups[i].items[j].type != WKC_TABLE_ITEM_END)
        {
            wkc_table_item_t *item = &groups[i].items[j];
            cJSON *item_json = wkc_table_item_extract(item, false);
            cJSON_AddItemToArray(items_json, item_json);
            j += 1;
        }

        cJSON_AddItemToArray(table_json, group_json);
    }
    char *result = cJSON_Print(table_json);
    cJSON_Delete(table_json);
    return result;
}

wkc_table_item_t *wkc_table_group_find_item(wkc_table_group_t *groups, int count,
                                            const char *name)
{
    for (int i = 0; i < count; i++)
    {
        int j = 0;
        while (groups[i].items[j].type != WKC_TABLE_ITEM_END)
        {
            if (strcmp(name, groups[i].items[j].name) == 0)
            {
                return &groups[i].items[j];
            }
            j += 1;
        }
    }
    return NULL;
}