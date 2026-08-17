#include "esp_err.h"
#include "esp_log.h"
#include "psa/crypto.h"
#include "profile/settings.h"

#define KEY_LENGTH 2048
#define KEY_USAGE PSA_KEY_USAGE_SIGN_HASH | PSA_KEY_USAGE_VERIFY_HASH | \
        PSA_KEY_USAGE_ENCRYPT | PSA_KEY_USAGE_DECRYPT | PSA_KEY_USAGE_EXPORT

static psa_key_id_t key_id;

void protocol_security_init()
{
    ESP_ERROR_CHECK(psa_crypto_init());
    psa_key_attributes_t attr = PSA_KEY_ATTRIBUTES_INIT;
    psa_set_key_type(&attr, PSA_KEY_TYPE_RSA_KEY_PAIR);
    psa_set_key_bits(&attr, KEY_LENGTH);
    psa_set_key_usage_flags(&attr, KEY_USAGE);
    psa_set_key_algorithm(&attr, PSA_ALG_RSA_OAEP(PSA_ALG_SHA_256));

    ESP_ERROR_CHECK(psa_generate_key(&attr, &key_id));
}

uint8_t *protocol_security_get_public_key(int *key_length)
{
    size_t key_size = 0;
    uint8_t tmp_data[512];
    psa_export_public_key(key_id, tmp_data, 512, &key_size);

    uint8_t *key_buffer = calloc(key_size, 1);
    psa_status_t status = psa_export_public_key(key_id, key_buffer, key_size, &key_size);

    if (status != PSA_SUCCESS)
    {
        ESP_LOGE("PROTOCOL_SECURITY", "Failed to get public key, reason: %d", status);
        return NULL;
    }
    *key_length = (int)key_size;
    return key_buffer;
}

int protocol_security_verify(uint8_t *data, int passkey, int input_length)
{
    uint8_t output[512] = { 0 };
    size_t output_length;
    psa_status_t verify_result = psa_asymmetric_decrypt(key_id, PSA_ALG_RSA_OAEP(PSA_ALG_SHA_256),
                                 data, input_length, NULL, 0, output, sizeof(output),
                                 &output_length);

    if (verify_result)
    {
        ESP_LOGE("PROTOCOL_SECURITY", "Security verify RSA not match, reason: %d",
                 verify_result);
        return verify_result;
    }

    // New verification
    if (output[0] == 0)
    {
        if (*((int*)&output[1]) != passkey)
        {
            ESP_LOGE("PROTOCOL_SECURITY", "Security verify passkey not match, reason: %d",
                     verify_result);
            return 1;
        }
        wkc_security_append_key(&output[5]);
        return 0;
    }
    else
    {
        for (int i = 0; i < wkc_get_security_storage_length(); i++)
        {
            if (memcmp(&output[1], current_security_storage[i], 16) == 0)
                return 0;
        }
    }
    return 1;
}