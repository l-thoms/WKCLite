#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include "esp_log.h"
#include "psa/crypto.h"
#include "security.h"
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

#define WKC_NOTIFY_SINGLE(result) do { \
    int notify_length; \
    uint8_t *notify_packed = wkc_command_pack((uint8_t[]) { result }, 1, &notify_length); \
    if (notify_packed) \
    { \
        os_mbuf_append(notify_om, notify_packed, notify_length);  \
        ble_gatts_notify_custom(conn_handle, attr_handle, notify_om); \
        free(notify_packed); \
    } \
} while(0)

#define WKC_NOTIFY_DEFAULT() WKC_NOTIFY_SINGLE(0)

static wkc_command_t current_command = WKC_CMD_NONE;
// Microseconds from 1970/1/1
static uint64_t rx_timestamp = 0;
static uint64_t conn_timestamp = 0;

static bool wkc_verify_timestamp_priv(uint64_t time_data, uint64_t *reference,
                                      bool append)
{
    if (time_data > *reference)
    {
        if (append)
            *reference = time_data;
        return true;
    }
    else return false;
}

bool wkc_verify_rx_timestamp(uint64_t time_data)
{
    return wkc_verify_timestamp_priv(time_data, &rx_timestamp, true);
}

bool wkc_verify_conn_timestamp(uint64_t time_data)
{
    return wkc_verify_timestamp_priv(time_data, &conn_timestamp, false);
}

void wkc_append_conn_timestamp(uint64_t time_data)
{
    if (time_data > conn_timestamp)
        conn_timestamp = time_data;
}

void wkc_command_reset_timestamp()
{
    rx_timestamp = 0;
}

uint8_t *wkc_command_unpack(uint8_t *command, int length, int *output_length)
{
    if (!output_length) return NULL;
    if (!command || length < 28)
    {
        *output_length = 0;
        return NULL;
    }
    uint8_t *result = calloc(length - 28, 1);

    int status = protocol_security_decrypt(command, length, result, output_length);
    if (status) goto command_unpack_failed;

    // Verify timestamp
    uint64_t timestamp;
    memcpy(&timestamp, &result[*output_length - 8], 8);
    if (!wkc_verify_rx_timestamp(timestamp)) goto command_unpack_failed;
    *output_length -= 8;
    result[*output_length] = 0;

    return result;
    command_unpack_failed:
    *output_length = 0;
    free(result);
    return NULL;
}

uint8_t *wkc_command_pack(uint8_t *command, int length, int *output_length)
{
    if (!output_length || !command) return NULL;

    uint8_t *command_with_timestamp = calloc(length + 8, 1);
    uint8_t *result = calloc(length + 36, 1);
    if (!command_with_timestamp || !result) return NULL;
    memcpy(command_with_timestamp, command, length);
    struct timeval tv;
    gettimeofday(&tv, NULL);
    uint64_t tx_time = tv.tv_sec * 1000000 + tv.tv_usec;
    memcpy(&command_with_timestamp[length], &tx_time, 8);
    int status = protocol_security_encrypt(command_with_timestamp, length + 8, result,
                                           output_length);
    free(command_with_timestamp);
    if (status == 0)
    {
        *output_length += 12;
        return result;
    }

    *output_length = 0;
    free(result);
    return NULL;
}

int wkc_write_command(uint16_t conn_handle, uint16_t attr_handle,
    uint8_t* command, int length, ui_shell_t *shell)
{
    struct os_mbuf *notify_om = ble_hs_mbuf_att_pkt();
    if(length == 0)
    {
        os_mbuf_free_chain(notify_om);
        WKC_NOTIFY_SINGLE(1);
        return 0;
    }
    wkc_command_t command_type = command[0];
    current_command = (wkc_command_t)command_type;
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
        // Deprecated
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
    uint8_t *result_raw = NULL;
    uint8_t *result = NULL;
    int length_raw = 0;
    *length = 0;
    char *placeholder = "\0{}";
    switch (current_command)
    {
        case WKC_CMD_READ_SHORTCUT_TABLE:
        case WKC_CMD_READ_SHORTCUT_ITEM:
            result_raw = malloc(PROTOCOL_READ_REQUEST_LENGTH + 1);
            length_raw = protocol_shortcut_get_current_output(result_raw,
                         PROTOCOL_READ_REQUEST_LENGTH);
            break;
        case WKC_CMD_READ_SETTINGS_TABLE:
        case WKC_CMD_READ_SETTINGS_ITEM:
            result_raw = malloc(PROTOCOL_READ_REQUEST_LENGTH + 1);
            length_raw = protocol_quicksettings_get_current_output(result_raw,
                         PROTOCOL_READ_REQUEST_LENGTH);
            break;
        default:
            length_raw = sizeof(placeholder) - 1;
            result_raw = malloc(length_raw);
            memcpy(result_raw, placeholder, length_raw);
            break;
    }
    if (result_raw)
    {
        result = wkc_command_pack(result_raw, length_raw, length);
        free(result_raw);
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
        cJSON_AddStringToObject(group_json, "display_name", groups[i].display_name);
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