#include <stdio.h>
#include "esp_system.h"
#include "esp_log.h"
#include "userprofile.h"
#include "cJSON.h"
#include "settings.h"
#include "io/filesystem.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

#define SETTINGS_PATH_DEFAULT "/data_static/profile/settings.json"
#define SETTINGS_PATH_ACTIVE "/data_dynamic/profile/settings.json"
#define SECURITY_PATH_DEFAULT "/data_static/profile/security.json"
#define SECURITY_PATH_ACTIVE "/data_dynamic/profile/security.json"

static wkc_settings_t current_settings = { 0 };

char* current_security_storage[10];

int clamp(int value, int min, int max)
{
    return value < min ? min : value > max ? max : value;
}

wkc_settings_t *wkc_settings_get_current()
{
    return &current_settings;
}

void wkc_settings_load_default()
{
    wkc_copy(SETTINGS_PATH_DEFAULT, SETTINGS_PATH_ACTIVE);
}

void wkc_security_load_default()
{
    wkc_copy(SECURITY_PATH_DEFAULT, SECURITY_PATH_ACTIVE);
}

static void settings_parse()
{
    size_t settings_size;
    wkc_get_file_size(SETTINGS_PATH_ACTIVE, &settings_size);
    char settings_buffer[settings_size];
    wkc_open(SETTINGS_PATH_ACTIVE, settings_buffer, settings_size);

    cJSON *settings_json = cJSON_Parse(settings_buffer);
    if(settings_json == NULL)
    {
        wkc_settings_load_default();
        settings_parse();
        return;
    }
    current_settings = (wkc_settings_t) { 0 };
    cJSON *language = cJSON_GetObjectItem(settings_json, "language"),
          *keep_advertise = cJSON_GetObjectItem(settings_json, "keep_advertise"),
          *power_save = cJSON_GetObjectItem(settings_json, "power_save"),
          *display = cJSON_GetObjectItem(settings_json, "display"),
          *peripherals = cJSON_GetObjectItem(settings_json, "peripherals"),
          *homepage_status_bar_position = cJSON_GetObjectItem(settings_json, "homepage_status_bar_position");

    if (language)
        current_settings.language = (int)cJSON_GetNumberValue(language);
    if (keep_advertise)
        current_settings.keep_advertise = cJSON_IsTrue(keep_advertise);
    if (power_save)
        current_settings.power_save = clamp((int)cJSON_GetNumberValue(power_save), 0, 3);
    if (display)
    {
        cJSON *orientation = cJSON_GetObjectItem(display, "orientation"),
              *output_mode = cJSON_GetObjectItem(display, "output_mode"),
              *position = cJSON_GetObjectItem(display, "position"),
              *capture_index = cJSON_GetObjectItem(display, "capture_index"),
              *capture_osd = cJSON_GetObjectItem(display, "capture_osd");

        if (orientation)
            current_settings.display.orientation = (int)cJSON_GetNumberValue(orientation);
        if (output_mode)
            current_settings.display.output_mode = (int)cJSON_GetNumberValue(output_mode);
        if (capture_index)
            current_settings.display.capture_index = (int)cJSON_GetNumberValue(capture_index);
        if (output_mode)
            current_settings.display.capture_osd = (int)cJSON_IsTrue(capture_osd);
        if (homepage_status_bar_position)
            current_settings.homepage_status_bar_position = !!(int)cJSON_GetNumberValue(homepage_status_bar_position);

        if (position && cJSON_GetArraySize(position) >= 2)
        {
            for (int i = 0; i < 2; i++)
            {
                cJSON *position_item = cJSON_GetArrayItem(position, i);

                cJSON *x_offset = cJSON_GetObjectItem(position_item , "x_offset"),
                      *y_offset = cJSON_GetObjectItem(position_item , "y_offset"),
                      *output_timing = cJSON_GetObjectItem(position_item , "output_timing");

                if (x_offset)
                    current_settings.display.position[i].x_offset =
                        clamp((int)cJSON_GetNumberValue(x_offset), 0, 255);
                if (y_offset)
                    current_settings.display.position[i].y_offset =
                        clamp((int)cJSON_GetNumberValue(y_offset), -16, 16);
                if (output_timing)
                    current_settings.display.position[i].output_timing =
                        clamp((int)cJSON_GetNumberValue(output_timing), -15, 15);
            }
        }
    }
    if (peripherals)
    {
        cJSON *remember_state = cJSON_GetObjectItem(peripherals, "remember_state");
        if (remember_state && cJSON_IsTrue(remember_state))
        {
            current_settings.peripherals.remember_state = true;
            cJSON *fan = cJSON_GetObjectItem(peripherals, "fan"),
                  *eye = cJSON_GetObjectItem(peripherals, "eye");

            if (fan)
                current_settings.peripherals.fan = clamp((int)cJSON_GetNumberValue(fan), 0, 3);
            if (eye)
                current_settings.peripherals.eye = clamp((int)cJSON_GetNumberValue(eye), 0, 3);
        }
    }

    cJSON_Delete(settings_json);
}

static void security_parse()
{
    size_t security_size;
    wkc_get_file_size(SECURITY_PATH_ACTIVE, &security_size);
    char security_buffer[security_size];
    wkc_open(SECURITY_PATH_ACTIVE, security_buffer, security_size);

    cJSON *security_json = cJSON_Parse(security_buffer);
    if(security_json == NULL)
    {
        wkc_security_load_default();
        security_parse();
        return;
    }

    cJSON *security_storage = NULL;
    security_storage = cJSON_GetObjectItem(security_json, "security_storage");
    int arr_size = cJSON_GetArraySize(security_storage);
    if(arr_size > 10) arr_size = 10;
    if(arr_size <= 0)
    {
        cJSON_Delete(security_storage);
        return;
    }

    for(int i = 0; i < arr_size; i++)
    {
        cJSON *security_item = cJSON_GetArrayItem(security_storage, i);
        char *security_item_str = cJSON_GetStringValue(security_item);
        current_security_storage[i] = (char*)malloc(strlen(security_item_str) + 1);
        strncpy(current_security_storage[i], security_item_str, strlen(security_item_str) + 1);
    }
    cJSON_Delete(security_storage);
}

char* wkc_settings_write()
{
    cJSON *settings_json = cJSON_CreateObject();
    cJSON_AddNumberToObject(settings_json, "language", current_settings.language);
    cJSON_AddBoolToObject(settings_json, "keep_advertise", current_settings.keep_advertise);
    cJSON_AddNumberToObject(settings_json, "power_save", current_settings.power_save);
    cJSON_AddNumberToObject(settings_json, "homepage_status_bar_position", current_settings.homepage_status_bar_position);
    cJSON *display = cJSON_AddObjectToObject(settings_json, "display");
    cJSON_AddNumberToObject(display, "orientation", current_settings.display.orientation);
    cJSON_AddNumberToObject(display, "output_mode", current_settings.display.output_mode);
    cJSON *position = cJSON_AddArrayToObject(display, "position");
    for (int i = 0; i < 2; i++)
    {
        cJSON *position_item = cJSON_CreateObject();
        cJSON_AddNumberToObject(position_item, "x_offset",
            current_settings.display.position[i].x_offset);
        cJSON_AddNumberToObject(position_item, "y_offset",
            current_settings.display.position[i].y_offset);
        cJSON_AddNumberToObject(position_item, "output_timing",
            current_settings.display.position[i].output_timing);
        cJSON_AddItemToArray(position, position_item);
    }
    cJSON_AddNumberToObject(display, "capture_index", current_settings.display.capture_index);
    cJSON_AddBoolToObject(display, "capture_osd", current_settings.display.capture_osd);
    cJSON *peripherals = cJSON_AddObjectToObject(settings_json, "peripherals");
    cJSON_AddBoolToObject(peripherals, "remember_state",
        current_settings.peripherals.remember_state);
    cJSON_AddNumberToObject(peripherals, "fan", current_settings.peripherals.fan);
    cJSON_AddNumberToObject(peripherals, "eye", current_settings.peripherals.eye);
    char *result = cJSON_Print(settings_json);
    cJSON_Delete(settings_json);
    return result;
}

void wkc_settings_save()
{
    char *result = wkc_settings_write();
    wkc_save(SETTINGS_PATH_ACTIVE, result, strlen(result) + 1);
    free(result);
}

void wkc_security_save()
{
    int security_length = 0;
    for(int i = 0; i < 10; i++)
        if(current_security_storage[i] != NULL)
            security_length++;
        else break;
    cJSON *security_json = cJSON_CreateObject();
    cJSON *string_array = cJSON_AddArrayToObject(security_json, "security_storage");
    for(int i = 0; i < security_length; i++)
    {
        cJSON *string_object = cJSON_CreateString(current_security_storage[i]);
        cJSON_AddItemToArray(string_array, string_object);
    }
    char *result = cJSON_Print(security_json);
    wkc_save(SECURITY_PATH_ACTIVE, result, strlen(result) + 1);
    cJSON_Delete(security_json);
    free(result);
}

void wkc_security_append_key(char *key)
{
    if(current_security_storage[9] != NULL) free(current_security_storage[9]);
    for(int i = 8; i >= 0; i--)
    {
        current_security_storage[i + 1] = current_security_storage[i];
    }
    current_security_storage[0] = malloc(17);
    memcpy(current_security_storage[0], key, 16);
    current_security_storage[0][16] = 0;
    wkc_security_save();
}

void wkc_settings_init()
{
    if(!wkc_file_exist(SETTINGS_PATH_ACTIVE))
    {
        ESP_LOGW("WKC_SETTINGS", "Settings does not exist, create default");
        wkc_settings_load_default();
        wkc_settings_init();
        return;
    }
    settings_parse();
}

void wkc_security_init()
{
    if(!wkc_file_exist(SETTINGS_PATH_ACTIVE))
    {
        ESP_LOGW("WKC_SETTINGS", "Settings does not exist, create default");
        wkc_security_load_default();
        wkc_security_init();
        return;
    }
    security_parse();
}