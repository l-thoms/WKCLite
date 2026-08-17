#pragma once

#include "esp_adc/adc_oneshot.h"

#define ADC_BATTERY_CHANNEL ADC_CHANNEL_0
#define ADC_IR_CHANNEL ADC_CHANNEL_1

#define BATTERY_VOLTAGE_FULL 4.2
#define BATTERY_VOLTAGE_EMPTY 3.0

typedef enum
{
    BATTERY_STATE_NORMAL,
    BATTERY_STATE_STDBY,
    BATTERY_STATE_CHRG,
    BATTERY_STATE_UNDEF
} battery_state_t;

void adc_monitor_init();
double adc_value_to_voltage(int adc_value);
double battery_value_to_vbat(double battery_value);
double battery_value_get_coarse(double vload, double pload);
double vbat_to_resistance(double vbat);
int adc_monitor_read_channel(adc_channel_t channel);
void adc_monitor_read_battery(int *value, bool *charging, bool *plugged);
bool adc_monitor_read_ir();