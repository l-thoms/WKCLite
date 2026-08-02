#pragma once

#include "ui_common.h"
#include "display/graphics.h"

void ui_shell_show_toast(ui_shell_t *shell, char *message, int duration);
void ui_shell_show_page(ui_shell_t *shell, ui_page_t *page);
ui_page_t *ui_shell_get_current_page(ui_shell_t *shell);
ui_page_t *ui_shell_find_page(ui_shell_t *shell, ui_page_type_t type);
display_orientation_t ui_shell_get_orientation(ui_shell_t *shell);
ui_shell_t *ui_shell_create();
void ui_shell_mainloop(ui_shell_t *shell);
void ui_shell_add_page(ui_shell_t *shell, ui_page_t *page);
void ui_shell_send_key(ui_shell_t *shell, int key_code);
void ui_shell_acquire_interval(ui_shell_t *shell, int interval);
ui_shell_t *ui_shell_get_current();