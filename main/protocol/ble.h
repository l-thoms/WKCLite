#pragma once

#include <stdint.h>
#include "ui/ui_common.h"

extern uint16_t authorized_handle;

void protocol_ble_init(ui_shell_t *shell);
int protocol_ble_get_pairing_code();
bool protocol_ble_is_device_connected();
uint8_t *protocol_get_version();
void protocol_ble_notify_update_command(const char *name);