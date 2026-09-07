#pragma once

#include <stdint.h>

void protocol_security_init();
int protocol_security_set_aes(uint8_t *aes);
uint8_t *protocol_security_get_public_key(int *key_length);
int protocol_security_verify(uint8_t *data, int passkey, int input_length);
int protocol_security_decrypt(uint8_t *data, int length,
    uint8_t *result, int *output_length);
int protocol_security_encrypt(uint8_t *data, int length,
    uint8_t *result, int *output_length);