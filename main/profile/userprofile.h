#pragma once

typedef struct
{
    char *device_name;
    char *owner;
    char *character;
    char *manufacturer;
} wkc_userprofile_t;

void wkc_userprofile_init();
void wkc_userprofile_save();
void wkc_userprofile_load_default();
wkc_userprofile_t *wkc_userprofile_get_current();
void wkc_userprofile_acquire_semaphore();
void wkc_userprofile_release_semaphore();