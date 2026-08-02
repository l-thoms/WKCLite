#pragma once

#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"

typedef struct
{
    bool remember_state;
    int fan;
    int eye;
} peripheral_settings_t;

typedef struct
{
    int x_offset;
    int y_offset;
    int output_timing;
} display_position_settings_t;

typedef struct
{
    int orientation;
    int output_mode;
    display_position_settings_t position[2];
    int capture_index;
    bool capture_osd;
} display_settings_t;

typedef struct
{
    int language;
    bool keep_advertise;
    int power_save;
    int homepage_status_bar_position;
    display_settings_t display;
    peripheral_settings_t peripherals;
} wkc_settings_t;

extern char* current_security_storage[10];

int clamp(int value, int min, int max);
void wkc_settings_load_default();
void wkc_security_load_default();
wkc_settings_t *wkc_settings_get_current();
char* wkc_settings_write();
void wkc_settings_save();
void wkc_security_save();
void wkc_security_append_key(char *key);
void wkc_settings_init();
void wkc_security_init();