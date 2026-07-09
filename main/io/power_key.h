#pragma once

#include "ui/shell.h"

bool power_key_get_state();
void power_key_set_shell(ui_shell_t *shell);
void power_key_init();