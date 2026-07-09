#include <stdio.h>
#include <stdlib.h>
#include "esp_log.h"
#include "cJSON.h"
#include "io/filesystem.h"
#include "settings.h"

#define TRANSLATIONS_PATH "/data_static/profile/translations.json"

static cJSON *translations_document = NULL;

int wkc_translations_init()
{
    if (translations_document)
    {
        cJSON_Delete(translations_document);
        translations_document = NULL;
    }
    size_t translations_size;
    int ret = 0;
    char *translations_buffer = NULL;
    if (wkc_get_file_size(TRANSLATIONS_PATH, &translations_size))
    {
        ret = 1;
        goto translations_init_end;
    }
    translations_buffer = calloc(translations_size, 1);
    if (wkc_open(TRANSLATIONS_PATH, translations_buffer, translations_size))
    {
        ret = 1;
        goto translations_init_end;
    }
    translations_document = cJSON_Parse(translations_buffer);
    if (!translations_document)
    {
        ret = 1;
        goto translations_init_end;
    }

    translations_init_end:
    if (translations_buffer)
        free(translations_buffer);
    return ret;
}

int wkc_translations_get_languages_count()
{
    if (!translations_document) return 0;
    cJSON *language_list = cJSON_GetObjectItem(translations_document, "language_list");
    if (!language_list) return 0;
    return cJSON_GetArraySize(language_list);
}

static char *wkc_translations_get_string_priv(char *key_name, int language_id)
{
    if (!translations_document)
    {
        ESP_LOGE("TRANSLATIONS", "Translations does not initialized");
        goto translations_failed;
    }
    int languages_count = wkc_translations_get_languages_count();
    if (languages_count == 0)
    {
        ESP_LOGE("TRANSLATIONS", "Failed to get languages count");
        goto translations_failed;
    }
    if (language_id >= languages_count) language_id = 0;

    cJSON *language_list = cJSON_GetObjectItem(translations_document, "language_list");
    if (!language_list)
    {
        ESP_LOGE("TRANSLATIONS", "Failed to get languages list");
        goto translations_failed;
    }
    cJSON *language_item = cJSON_GetArrayItem(language_list, language_id);
    if (!language_item)
    {
        ESP_LOGE("TRANSLATIONS", "Failed to get languages item");
        goto translations_failed;
    }
    char *language_name = cJSON_GetStringValue(language_item);
    if (!language_name)
    {
        ESP_LOGE("TRANSLATIONS", "Failed to get languages name");
        goto translations_failed;
    }

    cJSON *translations_item = cJSON_GetObjectItem(translations_document, key_name);
    if (!translations_item)
    {
        ESP_LOGE("TRANSLATIONS", "Failed to get translation item");
        goto translations_failed;
    }
    cJSON *translations_result = cJSON_GetObjectItem(translations_item, language_name);
    if (!translations_result)
    {
        ESP_LOGE("TRANSLATIONS", "Failed to get translation result");
        goto translations_failed;
    }
    char *ret = cJSON_GetStringValue(translations_result);
    if (!ret)
    {
        ESP_LOGE("TRANSLATIONS", "Translation result is null");
        goto translations_failed;
    }
    return ret;
    translations_failed:
    return key_name;
}

char *wkc_translations_get_string(char *key_name)
{
    if (!translations_document)
    {
        ESP_LOGE("TRANSLATIONS", "Translations does not initialized");
        return key_name;
    }
    int language_id = wkc_settings_get_current()->language;
    return wkc_translations_get_string_priv(key_name, language_id);
}

char *wkc_translations_get_language_name_from_index(int language_id)
{
    return wkc_translations_get_string_priv("language_name", language_id);
}