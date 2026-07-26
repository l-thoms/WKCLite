#include <stdio.h>
#include "esp_system.h"
#include "esp_log.h"
#include "userprofile.h"
#include "cJSON.h"
#include "io/filesystem.h"

#define USERPROFILE_PATH_DEFAULT "/data_static/profile/userprofile.json"
#define USERPROFILE_PATH_ACTIVE "/data_dynamic/profile/userprofile.json"

wkc_userprofile_t current_profile;

void wkc_userprofile_load_default()
{
    assert(wkc_file_exist(USERPROFILE_PATH_DEFAULT));
    wkc_copy(USERPROFILE_PATH_DEFAULT, USERPROFILE_PATH_ACTIVE);
}

static void userprofile_parse()
{
    size_t profile_size;
    wkc_get_file_size(USERPROFILE_PATH_ACTIVE, &profile_size);
    char profile_buffer[profile_size];
    wkc_open(USERPROFILE_PATH_ACTIVE, profile_buffer, profile_size);

    cJSON *profile_json = cJSON_Parse(profile_buffer);
    if(profile_json == NULL)
    {
        wkc_userprofile_load_default();
        userprofile_parse();
        return;
    }
    cJSON *device_name = NULL, *owner = NULL, *character = NULL, *manufacturer = NULL;

    device_name = cJSON_GetObjectItem(profile_json, "device_name");
    owner = cJSON_GetObjectItem(profile_json, "owner");
    character = cJSON_GetObjectItem(profile_json, "character");
    manufacturer = cJSON_GetObjectItem(profile_json, "manufacturer");

    char *device_name_str = cJSON_GetStringValue(device_name);
    char *owner_str = cJSON_GetStringValue(owner);
    char *character_str = cJSON_GetStringValue(character);
    char *manufacturer_str = cJSON_GetStringValue(manufacturer);

    current_profile.device_name = (char*)malloc(strlen(device_name_str) + 1);
    current_profile.owner = (char*)malloc(strlen(owner_str) + 1);
    current_profile.character = (char*)malloc(strlen(character_str) + 1);
    current_profile.manufacturer = (char*)malloc(strlen(manufacturer_str) + 1);

    strncpy(current_profile.device_name, device_name_str, strlen(device_name_str) + 1);
    strncpy(current_profile.owner, owner_str, strlen(owner_str) + 1);
    strncpy(current_profile.character, character_str, strlen(character_str) + 1);
    strncpy(current_profile.manufacturer, manufacturer_str, strlen(manufacturer_str) + 1);

    cJSON_Delete(profile_json);
}

void wkc_userprofile_save()
{
    cJSON *profile_json = cJSON_CreateObject();
    cJSON_AddStringToObject(profile_json, "device_name", current_profile.device_name);
    cJSON_AddStringToObject(profile_json, "owner", current_profile.owner);
    cJSON_AddStringToObject(profile_json, "character", current_profile.character);
    cJSON_AddStringToObject(profile_json, "manufacturer", current_profile.manufacturer);
    char *result = cJSON_Print(profile_json);
    cJSON_Delete(profile_json);
    wkc_save(USERPROFILE_PATH_ACTIVE, result, strlen(result) + 1);
    free(result);
}

void wkc_userprofile_init()
{
    if(!wkc_file_exist(USERPROFILE_PATH_ACTIVE))
    {
        ESP_LOGW("WKC_USERPROFILE", "Userprofile does not exist, create default");
        wkc_userprofile_load_default();
        wkc_userprofile_init();
        return;
    }
    current_profile.busy = false;
    userprofile_parse();
}