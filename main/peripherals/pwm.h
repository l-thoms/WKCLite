#pragma once

#include <stdbool.h>

bool pwm_device_is_init();
void pwm_devices_init();
void pwm_device_set_eye_level(int level);
void pwm_device_set_fan_level(int level);
int pwm_device_toggle_eye();
int pwm_device_toggle_fan();
int pwm_device_get_eye_level();
int pwm_device_get_fan_level();
int pwm_device_get_power_compensation_value();
bool pwm_device_power_skip();
void pwm_device_check_power();
void pwm_device_load_from_settings();