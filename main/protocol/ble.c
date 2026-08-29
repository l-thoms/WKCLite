#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "esp_log.h"
#include "esp_bt.h"
#include "esp_random.h"
#include "freertos/task.h"
#include "nimble/nimble_port.h"
#include "nimble/nimble_port_freertos.h"
#include "host/ble_hs.h"
#include "host/util/util.h"
#include "host/ble_gap.h"
#include "host/ble_gatt.h"
#include "host/ble_uuid.h"
#include "services/gap/ble_svc_gap.h"
#include "services/gatt/ble_svc_gatt.h"
#include "command_parser.h"
#include "profile/userprofile.h"
#include "profile/settings.h"
#include "ui/ui_common.h"
#include "ui/shell.h"
#include "ui/home.h"
#include "security.h"
#include "profile/translations.h"

#define TAG "WKC_BLE"
#define DEVICE_MODEL "WKC Lite"

#define GATT_SVC_UUID 0xA000
#define GATT_CHR_SECURITY_UUID 0xA001   // Read: get public key; write: authenticate
#define GATT_CHR_COMMAND_UUID  0xA002   // Read: get shortcuts; write: execute
// 0x3b1e stands for 'WKC' (22*26^2+10*26+2=15134=0x3b1e)
#define BLE_GAP_APPEARANCE 0x3b1e
#define BLE_GAP_URI_PREFIX_HTTPS 0x17
#define BLE_GAP_LE_ROLE_PERIPHERAL 0x00

#define MFG_BLOCK_OWNER 0x00
#define MFG_BLOCK_CHARACTER 0x01
#define MFG_BLOCK_MANUFACTURER 0x02
#define MFG_BLOCK_DEVICE_MODEL 0x03

const uint8_t mfg_head[2] = { 0x1e, 0x3b };
uint8_t protocol_version[4] = { 0, 1, 1, 0 };

typedef struct {
    // Actual data length + 1
    uint8_t data_length;
    uint8_t data_type;
    uint8_t *data;
} ble_ext_adv_item_t;

static ui_shell_t *current_shell;
static uint16_t current_handle = BLE_HS_CONN_HANDLE_NONE;
static int passkey;

static int ext_adv_calc_size(ble_ext_adv_item_t *items, int count)
{
    int result = 0;
    for (int i = 0; i < count; i++)
        result += items[i].data_length + 2;
    return result;
}

static void ext_adv_build(ble_ext_adv_item_t *items, int count, uint8_t *data)
{
    int data_pos = 0;
    for(int i = 0; i < count; i++)
    {
        data[data_pos] = items[i].data_length + 1;
        data[data_pos + 1] = items[i].data_type;
        memcpy(&data[data_pos + 2], items[i].data, items[i].data_length);
        data_pos += items[i].data_length + 2;
    }
}

static int ext_adv_calc_mfg_data_size()
{
    wkc_userprofile_t *profile = wkc_userprofile_get_current();
    return strlen(profile->owner) + strlen(profile->character) +
           strlen(profile->manufacturer) + strlen(DEVICE_MODEL) + 14;
}

// begins with 0x3b1e(16-bit Little endian) stands for 'WKC' (22*26^2+10*26+2=15134=0x3b1e)
// Any devices using WKC protocol should use this manufacturer data to filter devices
// Format: Head <4-byte protocol version>
//         <owner length + 1> 0x01 <owner>
//         <character length + 1> 0x02 <character>
//         <manufacturer length + 1> 0x03 <manufacturer>
static void ext_adv_build_mfg_data(uint8_t *data)
{
    memcpy(&data[0], mfg_head, 2);
    memcpy(&data[2], protocol_version, 4);
    int data_pos = 6;
    wkc_userprofile_t *profile = wkc_userprofile_get_current();

    // Fill owner
    int item_length = strlen(profile->owner);
    data[data_pos] = item_length + 1;
    data[data_pos + 1] = MFG_BLOCK_OWNER;
    memcpy(&data[data_pos + 2], profile->owner, item_length);
    data_pos += item_length + 2;

    // Fill character
    item_length = strlen(profile->character);
    data[data_pos] = item_length + 1;
    data[data_pos + 1] = MFG_BLOCK_CHARACTER;
    memcpy(&data[data_pos + 2], profile->character, item_length);
    data_pos += item_length + 2;

    // Fill manufacturer
    item_length = strlen(profile->manufacturer);
    data[data_pos] = item_length + 1;
    data[data_pos + 1] = MFG_BLOCK_MANUFACTURER;
    memcpy(&data[data_pos + 2], profile->manufacturer, item_length);
    data_pos += item_length + 2;

    // Fill device model
    item_length = strlen(DEVICE_MODEL);
    data[data_pos] = item_length + 1;
    data[data_pos + 1] = MFG_BLOCK_DEVICE_MODEL;
    memcpy(&data[data_pos + 2], DEVICE_MODEL, item_length);
}

static int gatt_svr_security_access(uint16_t conn_handle, uint16_t attr_handle,
                                    struct ble_gatt_access_ctxt *ctxt, void *arg)
{
    int rc;
    struct os_mbuf *om = ctxt->om;
    int om_length = os_mbuf_len(om);
    uint16_t output_om_length;
    uint8_t *om_data = calloc(om_length, 1);
    ble_hs_mbuf_to_flat(om, om_data, om_length, &output_om_length);

    switch (ctxt->op)
    {
        // Read public key
        case BLE_GATT_ACCESS_OP_READ_CHR:
        {
            int key_length;
            uint8_t *key_buffer = protocol_security_get_public_key(&key_length);

            char *verification = wkc_translations_get_string("ble_passkey");
            char *message = (char*)calloc(strlen(verification) + 7, 1);
            sprintf(message, "%s%06d", verification, passkey);
            ui_shell_show_toast(current_shell, message, 30);
            free(message);

            rc = os_mbuf_append(om, key_buffer, key_length);
            free(key_buffer);
        }
        break;
        // Verify
        case BLE_GATT_ACCESS_OP_WRITE_CHR:
        {
            struct os_mbuf *notify_om = ble_hs_mbuf_att_pkt();
            if (current_handle != BLE_HS_CONN_HANDLE_NONE)
            {
                ui_shell_show_toast(current_shell,
                    wkc_translations_get_string("ble_disconnect_previous_device"), 5);
                rc = (int)WKC_NOTIFY_CONNECTION_OCCUPIED;
            }
            else if (protocol_security_verify(om_data, passkey, om_length) == 0)
            {
                ui_shell_show_toast(current_shell,
                    wkc_translations_get_string("ble_verification_success"), 5);
                ui_home_update_from_shell(current_shell);
                current_handle = conn_handle;
                ESP_LOGI(TAG, "Device verify okay");
                rc = (int)WKC_NOTIFY_SUCCESSED;
            }
            else
            {
                ui_shell_show_toast(current_shell,
                    wkc_translations_get_string("ble_verification_failed"), 5);
                rc = (int)WKC_NOTIFY_FAILED;
            }
            os_mbuf_append(notify_om, (uint8_t[]) { rc }, 1);
            ble_gatts_notify_custom(conn_handle, attr_handle, notify_om);
            os_mbuf_free_chain(notify_om);
        }
        break;
        default:
        {
            rc = BLE_ATT_ERR_UNLIKELY;
        }
        break;
    }

    free(om_data);
    return rc;
}

static int gatt_svr_command_access(uint16_t conn_handle, uint16_t attr_handle,
                               struct ble_gatt_access_ctxt *ctxt, void *arg)
{
    int rc;
    struct os_mbuf *om = ctxt->om;
    switch (ctxt->op)
    {
        case BLE_GATT_ACCESS_OP_READ_CHR:
        {
            if (conn_handle != current_handle)
            {
                ESP_LOGE(TAG, "Read permission denided.");
                return BLE_ATT_ERR_READ_NOT_PERMITTED;
            }
            int command_output_length = 0;
            uint8_t *command_output = wkc_get_command_output(&command_output_length);
            if(!command_output)
            {
                ESP_LOGE(TAG, "Failed to read command output");
                return BLE_ATT_ERR_INSUFFICIENT_RES;
            }
            else
            {
                rc = os_mbuf_append(om, command_output, command_output_length);
                if(rc != 0)
                    ESP_LOGE(TAG, "Failed to send result");
                free(command_output);
                return rc == 0 ? 0 : BLE_ATT_ERR_INSUFFICIENT_RES;
            }
        }
        case BLE_GATT_ACCESS_OP_WRITE_CHR:
        {
            if (conn_handle != current_handle)
            {
                ESP_LOGE(TAG, "Write permission denided.");
                return BLE_ATT_ERR_WRITE_NOT_PERMITTED;
            }
            // Write characteristics
            uint16_t command_length = os_mbuf_len(om), command_length_out;
            uint8_t *command = calloc(command_length + 1, 1);
            ble_hs_mbuf_to_flat(om, command, command_length, &command_length_out);
            wkc_write_command(conn_handle, attr_handle, command, command_length, current_shell);
            free(command);
            return 0;
        }
        default:
            return BLE_ATT_ERR_UNLIKELY;
    }
}

static int ble_gap_event_handler(struct ble_gap_event *event, void *arg);

static int set_adv_fields()
{
    int rc = 0;
    uint8_t *mfg_data = NULL, *ext_adv_data = NULL;
    struct os_mbuf *ext_adv_mbuf = NULL;
    wkc_userprofile_t *profile = wkc_userprofile_get_current();

    rc = ble_hs_util_ensure_addr(0);
    if (rc != 0)
    {
        ESP_LOGE(TAG, "device does not have any available bt address, reason: %d", rc);
        goto set_adv_fields_end;
    }

    uint8_t own_addr_type;
    rc = ble_hs_id_infer_auto(0, &own_addr_type);
    if (rc)
    {
        ESP_LOGE(TAG, "Cannot determine addr_type, reason: %d", rc);
        goto set_adv_fields_end;
    }

    // 0 stands for adv_data(conectable)
    if (ble_gap_ext_adv_active(0))
        ble_gap_ext_adv_stop(0);

    // Configure extended advertising
    struct ble_gap_ext_adv_params adv_params = {
        .sid = 0,
        .primary_phy = BLE_HCI_LE_PHY_1M,
        .secondary_phy = BLE_HCI_LE_PHY_1M,
        .tx_power = BLE_HS_ADV_TX_PWR_LVL_AUTO,
        .connectable = 1,
        .itvl_min = BLE_GAP_ADV_ITVL_MS(480),
        .itvl_max = BLE_GAP_ADV_ITVL_MS(520)
    };
    rc = ble_gap_ext_adv_configure(0, &adv_params, NULL, ble_gap_event_handler, NULL);
    if (rc != 0)
    {
        ESP_LOGE(TAG, "Failed to configure ext_adv, reason: %d", rc);
        goto set_adv_fields_end;
    }

    // Build advertise data
    uint8_t adv_flags_data = BLE_HS_ADV_F_DISC_GEN | BLE_HS_ADV_F_BREDR_UNSUP;
    uint8_t role = BLE_GAP_LE_ROLE_PERIPHERAL;
    uint16_t appearance = BLE_GAP_APPEARANCE;
    int mfg_data_length = ext_adv_calc_mfg_data_size();
    mfg_data = calloc(mfg_data_length, 1);
    ext_adv_build_mfg_data(mfg_data);

    ble_ext_adv_item_t ext_adv_items[] = {
        {
            .data_type = BLE_HS_ADV_TYPE_FLAGS,
            .data_length = 1,
            .data = &adv_flags_data
        },
        {
            .data_type = BLE_HS_ADV_TYPE_COMP_NAME,
            .data_length = strlen(profile->device_name),
            .data = (uint8_t*)profile->device_name
        },
        {
            .data_type = BLE_HS_ADV_TYPE_APPEARANCE,
            .data_length = 2,
            .data = (uint8_t*)&appearance
        },
        {
            .data_type = BLE_HS_ADV_TYPE_LE_ROLE,
            .data_length = 1,
            .data = &role
        },
        {
            .data_type = BLE_HS_ADV_TYPE_MFG_DATA,
            .data_length = mfg_data_length,
            .data = mfg_data
        },
    };
    int item_count = sizeof(ext_adv_items) / sizeof(ble_ext_adv_item_t);
    int ext_adv_size = ext_adv_calc_size(ext_adv_items, item_count);
    ext_adv_data = calloc(ext_adv_size, 1);
    ext_adv_build(ext_adv_items, item_count, ext_adv_data);

    ext_adv_mbuf = os_msys_get_pkthdr(ext_adv_size, 0);
    if (!ext_adv_mbuf)
    {
        ESP_LOGE(TAG, "Failed to create advertise mbuf.");
        goto set_adv_fields_end;
    }

    rc = os_mbuf_append(ext_adv_mbuf, ext_adv_data, ext_adv_size);
    if (rc)
    {
        ESP_LOGE(TAG, "Failed to append advertise data, reason: %d\n", rc);
        goto set_adv_fields_end;
    }

    rc = ble_gap_ext_adv_set_data(0, ext_adv_mbuf);
    if (rc)
    {
        ESP_LOGE(TAG, "Failed to set advertise data, reason: %d\n", rc);
        goto set_adv_fields_end;
    }

    set_adv_fields_end:

    if (ext_adv_data)
        free(ext_adv_data);
    if (mfg_data)
        free(mfg_data);
    if (ext_adv_mbuf)
        os_mbuf_free_chain(ext_adv_mbuf);
    return rc;
}


static void advertise()
{
    wkc_userprofile_acquire_semaphore();
    char *device_name = wkc_userprofile_get_current()->device_name;
    int rc = ble_svc_gap_device_name_set(device_name);
    if (rc != 0)
    {
        ESP_LOGE(TAG, "failed to set device name to %s, error code: %d",
                 device_name, rc);
        wkc_userprofile_release_semaphore();
        return;
    }

    if (set_adv_fields())
    {
        wkc_userprofile_release_semaphore();
        return;
    }

    rc = ble_gap_ext_adv_start(0, 0, 0);
    ESP_LOGI(TAG, "Start advertise.");

    if(rc == 0)
        ui_home_update_from_shell(current_shell);
    else
        ESP_LOGE(TAG, "ext_adv start failed, reason: %d, %d", rc);
    wkc_userprofile_release_semaphore();
}

static int ble_gap_event_handler(struct ble_gap_event *event, void *arg)
{
    switch (event->type)
    {
        case BLE_GAP_EVENT_CONNECT:
            passkey = esp_random() % 1000000;
            ESP_LOGI("WKC_BT", "Passkey: %06d", passkey);
            if(wkc_settings_get_current()->keep_advertise)
                advertise();
            else
                ui_home_update_from_shell(current_shell);
            break;
        case BLE_GAP_EVENT_DISCONNECT:
            ESP_LOGI(TAG, "Device disconnected, conn_handle: %d", event->connect.conn_handle);
            if (event->disconnect.conn.conn_handle == current_handle)
            {
                current_handle = BLE_HS_CONN_HANDLE_NONE;
                ui_shell_show_toast(current_shell, wkc_translations_get_string("ble_device_disconnected"), 5);
                ui_shell_show_page(current_shell, ui_shell_find_page(
                    current_shell, UI_PAGE_TYPE_HOME));
                ESP_LOGI(TAG, "Active device disconnected");
            }
            // Restart advertise
            advertise();
            ui_home_update_from_shell(current_shell);
            break;
        case BLE_GAP_EVENT_ADV_COMPLETE:
            ui_home_update_from_shell(current_shell);
            break;
        case BLE_GAP_EVENT_PARING_COMPLETE:
            // Prevent advertise stops when executing native pairing (unused)
            if (current_handle == BLE_HS_CONN_HANDLE_NONE ||
                wkc_settings_get_current()->keep_advertise)
                advertise();
            break;
        default:
            break;
    }

    return 0;
}

void protocol_ble_notify_update_command(const char *name)
{
    if (current_handle == BLE_HS_CONN_HANDLE_NONE) return;
    struct os_mbuf *notify_om = ble_hs_mbuf_att_pkt();
    os_mbuf_append(notify_om, (uint8_t[]){ WKC_NOTIFY_UPDATE_REQUIRED }, 1);
    os_mbuf_append(notify_om, name, (uint16_t)strlen(name));
    uint16_t command_attr_handle;
    ble_uuid16_t svc_uuid = BLE_UUID16_INIT(GATT_SVC_UUID);
    ble_uuid16_t chr_uuid = BLE_UUID16_INIT(GATT_CHR_COMMAND_UUID);
    ble_gatts_find_chr(&svc_uuid.u, &chr_uuid.u,
                      NULL,  &command_attr_handle);
    ble_gatts_notify_custom(current_handle, command_attr_handle, notify_om);
    os_mbuf_free_chain(notify_om);
}

bool protocol_ble_is_device_connected()
{
    return current_handle != BLE_HS_CONN_HANDLE_NONE;
}

static const struct ble_gatt_svc_def gatt_svr_svcs[] = {
    {
        .type = BLE_GATT_SVC_TYPE_PRIMARY,
        .uuid = BLE_UUID16_DECLARE(GATT_SVC_UUID),
        .characteristics = (struct ble_gatt_chr_def[]) {
            {
                .uuid = BLE_UUID16_DECLARE(GATT_CHR_SECURITY_UUID),
                .access_cb = gatt_svr_security_access,
                .flags = BLE_GATT_CHR_F_READ | BLE_GATT_CHR_F_WRITE | BLE_GATT_CHR_F_NOTIFY,
            },
            {
                .uuid = BLE_UUID16_DECLARE(GATT_CHR_COMMAND_UUID),
                .access_cb = gatt_svr_command_access,
                .flags = BLE_GATT_CHR_F_READ | BLE_GATT_CHR_F_WRITE | BLE_GATT_CHR_F_NOTIFY,
            },
            { 0 }
        }
    }, { 0 }
};

static void gatt_svr_init(void)
{
    int rc;

    rc = ble_gatts_count_cfg(gatt_svr_svcs);
    if (rc != 0)
    {
        ESP_LOGE(TAG, "ble_gatts_count_cfg failed: %d", rc);
        return;
    }

    rc = ble_gatts_add_svcs(gatt_svr_svcs);
    if (rc != 0)
    {
        ESP_LOGE(TAG, "ble_gatts_add_svcs failed: %d", rc);
        return;
    }
}

static void ble_app_task(void *pvParameter)
{
    nimble_port_run();
    vTaskDelete(NULL);
}

void protocol_ble_init(ui_shell_t *shell)
{
    current_shell = shell;
    int rc;
    ESP_ERROR_CHECK(esp_bt_controller_mem_release(ESP_BT_MODE_CLASSIC_BT));

    rc = nimble_port_init();
    if (rc != ESP_OK)
    {
        ESP_LOGE(TAG, "nimble_port_init failed: %d", rc);
        return;
    }
    // Init security
    protocol_security_init();
    ESP_LOGI(TAG, "Protocol security okay");

    ble_hs_cfg.sm_io_cap = BLE_HS_IO_NO_INPUT_OUTPUT;
    ble_hs_cfg.sm_bonding = 0;
    ble_hs_cfg.sm_mitm = 0;

    gatt_svr_init();
    nimble_port_freertos_init(ble_app_task);

    vTaskDelay(50 / portTICK_PERIOD_MS);
    advertise();
    ESP_LOGI(TAG, "Protocol BLE okay");
}

uint8_t *protocol_get_version()
{
    return protocol_version;
}