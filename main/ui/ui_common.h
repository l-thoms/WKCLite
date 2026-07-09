#pragma once

#include <stdlib.h>
#include <stdbool.h>
#include "display/display_common.h"

#define UI_KEY_CODE_UP 1
#define UI_KEY_CODE_LEFT 2
#define UI_KEY_CODE_RIGHT 3
#define UI_KEY_CODE_DOWN 4
#define UI_KEY_CODE_OK 5
#define UI_KEY_CODE_MENU 6
#define UI_KEY_CODE_EXIT 7

typedef enum
{
    UI_PAGE_TYPE_HOME,
    UI_PAGE_TYPE_MENU,
    UI_PAGE_TYPE_DEVICE_INFO,
    UI_PAGE_TYPE_SETTINGS,
    UI_PAGE_TYPE_CAMERA,
    UI_PAGE_TYPE_FILES,
} ui_page_type_t;

typedef struct ui_shell_t ui_shell_t;
typedef struct ui_page_t ui_page_t;

typedef void (*ui_page_event_t)(struct ui_page_t *page);
typedef void (*ui_page_key_event_t)(struct ui_page_t *page, int key_code);
typedef void (*ui_page_draw_event_t)(struct ui_page_t *page, display_format_t *formats,
                                     display_orientation_t orientation);
typedef void (*ui_page_mainloop_event_t)(struct ui_page_t *page, bool on_foreground);

typedef struct ui_page_t
{
    ui_page_type_t type;
    ui_shell_t *parent;
    ui_page_event_t on_show;
    ui_page_draw_event_t on_draw;
    ui_page_key_event_t on_key_event;
    ui_page_mainloop_event_t on_mainloop;
    ui_page_event_t on_format_changed;
} ui_page_t;