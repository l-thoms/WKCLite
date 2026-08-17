#pragma once

#include <stdbool.h>

typedef struct
{
    double voltage_charging;
    double voltage_stdby;
    double value_zero;
    double power_base;
    double power_eye[3];
    double power_fan[3];
    double power_camera;
} battery_calibration_data_t;

void battery_calibration_init();
bool battery_calibration_is_valid();
bool battery_calibration_is_calibrating();
void battery_calibration_set(bool calibration);
battery_calibration_data_t *battery_calibration_get_current();
int battery_calibration_calibrate(double voltage_charging, double voltage_stdby);