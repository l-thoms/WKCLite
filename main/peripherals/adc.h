#pragma once

typedef enum
{
    BATTERY_STATE_NORMAL,
    BATTERY_STATE_STDBY,
    BATTERY_STATE_CHRG,
    BATTERY_STATE_UNDEF
} battery_state_t;

void adc_monitor_init();
void adc_monitor_read_battery(int *value, bool *charging, bool *plugged);
bool adc_monitor_read_ir();