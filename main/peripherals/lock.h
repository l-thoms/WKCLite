#pragma once

#include <stdbool.h>
#include "ui/shell.h"

bool lock_is_busy();
int lock_set(bool state, bool force);
bool lock_get_state();
bool lock_check_power();
void lock_set_from_isr(bool state, bool force, bool check);
void lock_set_shell(ui_shell_t *shell);
void lock_init();