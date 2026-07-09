#pragma once

#include "ui/ui_common.h"

typedef enum
{
    WKC_CMD_NONE,
    WKC_CMD_KEY_CODE,
    WKC_CMD_TIME_SYNC,
    WKC_CMD_READ_SHORTCUT_TABLE,
    WKC_CMD_READ_SHORTCUT_ITEM,
    WKC_CMD_WRITE_SHORTCUT,
    WKC_CMD_READ_SETTINGS_TABLE,
    WKC_CMD_READ_SETTINGS_ITEM,
    WKC_CMD_WRITE_SETTINGS
} wkc_command_t;

int wkc_write_command(uint16_t conn_handle, uint16_t attr_handle,
uint8_t* command, int length, ui_shell_t *shell);
uint8_t *wkc_get_command_output(int *length);
char* wkc_get_device_info();