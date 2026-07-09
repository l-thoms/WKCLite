#pragma once

typedef struct
{
    char *device_name;
    char *owner;
    char *character;
    char *manufacturer;
    bool busy;
} wkc_userprofile_t;

extern wkc_userprofile_t current_profile;

void wkc_userprofile_init();
void wkc_userprofile_save();