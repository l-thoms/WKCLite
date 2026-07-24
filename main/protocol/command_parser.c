#include <stdio.h>
#include <string.h>
#include <time.h>
#include "esp_log.h"
#include "command_parser.h"
#include "cJSON.h"
#include "profile/userprofile.h"
#include "profile/settings.h"
#include "ble.h"
#include "nimble/ble.h"
#include "nimble/nimble_port.h"
#include "nimble/nimble_port_freertos.h"
#include "host/ble_hs.h"
#include "host/util/util.h"
#include "host/ble_gap.h"
#include "host/ble_gatt.h"
#include "host/ble_uuid.h"
#include "services/gap/ble_svc_gap.h"
#include "services/gatt/ble_svc_gatt.h"
#include "mbedtls/error.h"
#include "ui/ui_common.h"
#include "ui/shell.h"
#include "ui/home.h"
#include "ui/menu.h"
#include "peripherals/lock.h"
#include "peripherals/adc.h"
#include "io/io_extend.h"
#include "display/display_control.h"

#define TAG "WKC_CMD_PARSER"

#define WKC_NOTIFY_DEFAULT() {                                  \
os_mbuf_append(notify_om, (uint8_t[]){(uint8_t)0}, 1);          \
ble_gatts_notify_custom(conn_handle, attr_handle, notify_om);}  \

static wkc_command_t current_command = WKC_CMD_NONE;

int wkc_write_command(uint16_t conn_handle, uint16_t attr_handle,
    uint8_t* command, int length, ui_shell_t *shell)
{
    if(length == 0) return 0;
    wkc_command_t command_type = command[0];
    struct os_mbuf *notify_om = ble_hs_mbuf_att_pkt();
    int ret = 0;
    switch (command_type)
    {
        case WKC_CMD_KEY_CODE:
        {
            ui_shell_send_key(shell, command[1]);
            display_reset_power_save();
            WKC_NOTIFY_DEFAULT();
        }
        break;
        case WKC_CMD_TIME_SYNC:
        {
            if (length < 7)
            {
                os_mbuf_append(notify_om, (uint8_t[]){(uint8_t)1}, 1);
                ble_gatts_notify_custom(conn_handle, attr_handle, notify_om);
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
                    os_mbuf_append(notify_om, (uint8_t[]){(uint8_t)1}, 1);
                    ble_gatts_notify_custom(conn_handle, attr_handle, notify_om);
                }
                else WKC_NOTIFY_DEFAULT();
            }
        }
        break;
        // TODO
        case WKC_CMD_READ_SHORTCUT_TABLE:
        case WKC_CMD_READ_SHORTCUT_ITEM:
        case WKC_CMD_WRITE_SHORTCUT:
        case WKC_CMD_READ_SETTINGS_TABLE:
        {
            WKC_NOTIFY_DEFAULT();
        }
        break;
        case WKC_CMD_READ_SETTINGS_ITEM:
        {
            wkc_settings_set_current_output((char*)&command[1]);
            WKC_NOTIFY_DEFAULT();
        }
        break;
        case WKC_CMD_WRITE_SETTINGS:
        {
            int ret = wkc_settings_save_by_item((char*)(command + 1));
            if(ret != 0)
            {
                ESP_LOGE(TAG, "Invalid settings item");
                os_mbuf_append(notify_om, (uint8_t[]){(uint8_t)1}, 1);
                ble_gatts_notify_custom(conn_handle, attr_handle, notify_om);
            }
            else
            {
                ESP_LOGI(TAG, "Settings item changed");
                WKC_NOTIFY_DEFAULT();
            }
        }
        break;
        default:
        {
            os_mbuf_append(notify_om, (uint8_t[]){(uint8_t)-1}, 1);
            ble_gatts_notify_custom(conn_handle, attr_handle, notify_om);
            ESP_LOGE(TAG, "Command unsupported");
        }
        break;
    }
    return ret;
}

// TODO: implement shortcut and custom settings.
uint8_t *wkc_get_command_output(int *length)
{
    uint8_t *result = NULL;
    *length = 0;
    switch (current_command)
    {
        case WKC_CMD_READ_SETTINGS_ITEM:
            result = (uint8_t*)strdup(wkc_settings_get_current_output());
            break;
        default:
            result = (uint8_t*)strdup("{}");
            break;
    }
    if (result)
    {
        *length = (int)strlen((char*)result);
        ESP_LOGI(TAG, "Read command: %s", result);
    }
    return result;
}

char* wkc_get_device_info()
{
    cJSON *device_info_json = cJSON_CreateObject();
    cJSON_AddStringToObject(device_info_json, "owner", current_profile.owner);
    cJSON_AddStringToObject(device_info_json, "character", current_profile.character);
    cJSON_AddStringToObject(device_info_json, "manufacturer", current_profile.manufacturer);
    char *result = cJSON_Print(device_info_json);
    cJSON_Delete(device_info_json);
    return result;
}