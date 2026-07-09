#pragma once

#include <stdint.h>

void protocol_security_init();
uint8_t *protocol_security_get_public_key(int *key_length);
int protocol_security_verify(uint8_t *data, int passkey, int input_length);