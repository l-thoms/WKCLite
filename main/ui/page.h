#pragma once

#include "ui_common.h"
#include "display/graphics.h"

ui_shell_t *ui_page_get_parent(ui_page_t *page);
ui_page_type_t *ui_page_get_type(ui_page_t *page);
void *ui_page_reset(ui_page_t *page);
void *ui_page_on_show(ui_page_t *page);
void ui_page_on_draw(ui_page_t *page,  display_format_t *formats, display_orientation_t orientation);
void ui_page_on_key_event(ui_page_t *page, int key_code);
void ui_page_on_mainloop(ui_page_t *page, bool on_foreground);
void ui_page_on_format_changed(ui_page_t *page);