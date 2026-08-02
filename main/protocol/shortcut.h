#pragma once

#include <stdint.h>

int protocol_shortcut_get_current_output(uint8_t *buffer, int request_length);
int protocol_shortcut_get_table(char *key);
uint8_t protocol_shortcut_write(char *command);