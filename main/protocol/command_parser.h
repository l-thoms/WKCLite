#pragma once

#include "stdbool.h"
#include "cJSON.h"
#include "ui/ui_common.h"

#define PROTOCOL_READ_REQUEST_LENGTH 200

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

typedef enum
{
    WKC_TABLE_ITEM_ACTION,
    WKC_TABLE_ITEM_SWITCH,
    WKC_TABLE_ITEM_INTEGER,
    WKC_TABLE_ITEM_DECIMAL,
    WKC_TABLE_ITEM_PICKER,
    WKC_TABLE_ITEM_STRING,
    WKC_TABLE_ITEM_END
} wkc_table_item_type_t;

typedef struct
{
    wkc_table_item_type_t type;
    char *name;
    char *display_name;
    double min;
    double value;
    union
    {
        double max;
        int count;
        int length;
    };
    union
    {
        char *string;
        char **options;
    };
} wkc_table_item_t;

typedef struct
{
    char *name;
    wkc_table_item_t *items;
} wkc_table_group_t;


int wkc_write_command(uint16_t conn_handle, uint16_t attr_handle,
uint8_t* command, int length, ui_shell_t *shell);
uint8_t *wkc_get_command_output(int *length);
cJSON *wkc_table_item_extract(wkc_table_item_t *item, bool value_only);
char *wkc_table_build(wkc_table_group_t *groups, int group_num);
wkc_table_item_t *wkc_table_group_find_item(wkc_table_group_t *groups, int count,
                                            const char *name);