#include <stdio.h>
#include <stdlib.h>
#include "esp_log.h"
#include "esp_heap_caps.h"
#include "io/filesystem.h"
#include "display/display_control.h"
#include "settings.h"

#define TRANSLATIONS_PATH "/data_static/profile/translations.bin"

static uint8_t *translations_document = NULL;

int wkc_translations_init()
{
    if (translations_document)
    {
        free(translations_document);
        translations_document = NULL;
    }
    size_t translations_size;
    int ret = 0;
    if (wkc_get_file_size(TRANSLATIONS_PATH, &translations_size))
    {
        ret = 1;
        goto translations_init_end;
    }
    translations_document = heap_caps_calloc(translations_size, 1, MALLOC_CAP_SPIRAM);
    if (wkc_open(TRANSLATIONS_PATH, (char*)translations_document, translations_size))
    {
        ret = 1;
        goto translations_init_end;
    }

    translations_init_end:
    if (translations_document && ret != 0)
        free(translations_document);
    return ret;
}

int wkc_translations_get_languages_count()
{
    if (!translations_document) return 0;
    return ((int*)translations_document)[0];
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

    int item_index = 0;
    int *translations_indexes = &((int*)translations_document)[1];
    while (translations_indexes[item_index] > 0)
    {
        int selected_index = translations_indexes[item_index];
        if (strcmp(key_name, (char*)&translations_document[selected_index]) == 0)
        {
            for (int i = 0; i < language_id + 1; i++)
            {
                selected_index += strlen((char*)&translations_document[selected_index]) + 1;
            }
            return (char*)&translations_document[selected_index];
        }
        item_index += 1;
    }

    ESP_LOGE("TRANSLATIONS", "Failed to get translations result");

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
    display_control_record_operate_time();
    int language_id = wkc_settings_get_current()->language;
    return wkc_translations_get_string_priv(key_name, language_id);
}

char *wkc_translations_get_language_name_from_index(int language_id)
{
    return wkc_translations_get_string_priv("language_name", language_id);
}