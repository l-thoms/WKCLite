#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_adc/adc_oneshot.h"
#include "esp_log.h"
#include "battery_calibration.h"
#include "io/filesystem.h"
#include "io/io_extend.h"
#include "peripherals/adc.h"
#include "peripherals/lock.h"
#include "peripherals/pwm.h"
#include "profile/translations.h"

#define CALIBRATION_DATA_PATH "/data_dynamic/profile/battery_calibration.bin"

static battery_calibration_data_t calibration_data;
static bool calibration_valid = false;
static bool calibrating = false;
static bool calibration_start = false;

void battery_calibration_init()
{
    if (wkc_file_exist(CALIBRATION_DATA_PATH))
    {
        size_t file_size;
        wkc_get_file_size(CALIBRATION_DATA_PATH, &file_size);
        if (file_size == sizeof(battery_calibration_data_t))
        {
            wkc_open(CALIBRATION_DATA_PATH, (char*)&calibration_data, file_size);
            calibration_valid = true;
        }
    }
    else
        ESP_LOGW("BATTERY_CALIBRATION", "No battery calibration data.");
}

bool battery_calibration_is_valid()
{
    return calibration_valid;
}

bool battery_calibration_is_calibrating()
{
    return calibrating || calibration_start;
}

void battery_calibration_set(bool calibration)
{
    if (calibration_start) return;
    if (calibration)
    {
        lock_set(false, true);
        pwm_device_set_eye_level(0);
        pwm_device_set_fan_level(0);
    }
    calibrating = calibration;
}

battery_calibration_data_t *battery_calibration_get_current()
{
    return &calibration_data;
}

int battery_calibration_calibrate(double voltage_charging, double voltage_stdby)
{
    calibrating = true;
    ui_page_t *current_page = ui_shell_get_current_page(ui_shell_get_current());
    if (current_page && current_page->type == UI_PAGE_TYPE_SETTINGS)
    {
        ui_shell_show_page(ui_shell_get_current(), ui_shell_find_page(
            ui_shell_get_current(), UI_PAGE_TYPE_HOME
        ));
    }
    if (ui_shell_get_current_page(ui_shell_get_current()))
    ui_shell_show_toast(ui_shell_get_current(), wkc_translations_get_string("battery_calibrating"), 60);
    // Measure voltage
    vTaskDelay(10000 / portTICK_PERIOD_MS);
    double voltage_base = 0;
    for (int i = 0; i < 10; i++)
    {
        int voltage_read = adc_monitor_read_channel(ADC_BATTERY_CHANNEL);
        if (voltage_read < 0) goto battery_calibrate_failed;
        voltage_base += adc_value_to_voltage(voltage_read) / 10;
        vTaskDelay(100 / portTICK_PERIOD_MS);
    }

    double voltage_eye[3] = { 0 };
    for (int level = 1; level <= 3; level++)
    {
        pwm_device_set_eye_level_temp(level);
        vTaskDelay(4000 / portTICK_PERIOD_MS);
        for (int i = 0; i < 10; i++)
        {
            int voltage_read = adc_monitor_read_channel(ADC_BATTERY_CHANNEL);
            if (voltage_read < 0) goto battery_calibrate_failed;
            voltage_eye[level - 1] += adc_value_to_voltage(voltage_read) / 10;
            vTaskDelay(100 / portTICK_PERIOD_MS);
        }
    }
    pwm_device_set_eye_level_temp(0);

    double voltage_fan[3] = { 0 };
    for (int level = 1; level <= 3; level++)
    {
        pwm_device_set_fan_level_temp(level);
        vTaskDelay(4000 / portTICK_PERIOD_MS);
        for (int i = 0; i < 10; i++)
        {
            int voltage_read = adc_monitor_read_channel(ADC_BATTERY_CHANNEL);
            if (voltage_read < 0) goto battery_calibrate_failed;
            voltage_fan[level - 1] += adc_value_to_voltage(voltage_read) / 10;
            vTaskDelay(100 / portTICK_PERIOD_MS);
        }
    }
    pwm_device_set_fan_level_temp(0);

    double voltage_camera = 0;
    gpio_write(GPIO_NUM_EXTEND | 10, 1);
    vTaskDelay(4000 / portTICK_PERIOD_MS);
    for (int i = 0; i < 10; i++)
    {
        int voltage_read = adc_monitor_read_channel(ADC_BATTERY_CHANNEL);
        if (voltage_read < 0) goto battery_calibrate_failed;
        voltage_camera += adc_value_to_voltage(voltage_read) / 10;
        vTaskDelay(100 / portTICK_PERIOD_MS);
    }
    gpio_write(GPIO_NUM_EXTEND | 10, 0);

    // Calculate power
    double power_base = voltage_base * (voltage_stdby - voltage_base);
    double power_eye[3], power_fan[3];
    double resistance = vbat_to_resistance(voltage_stdby);
    for (int i = 0; i < 3; i++)
    {
        power_eye[i] = voltage_eye[i] * (voltage_stdby - voltage_eye[i]) / resistance - power_base;
        power_fan[i] = voltage_fan[i] * (voltage_stdby - voltage_fan[i]) / resistance - power_base;
    }
    double power_camera = 0;
    power_camera = voltage_camera * (voltage_stdby - voltage_camera) - power_base;

    // Calculate zero point
    int coarse = battery_value_get_coarse(3, power_base);

    calibration_data.value_zero = battery_value_to_vbat(coarse);
    calibration_data.voltage_charging = voltage_charging;
    calibration_data.voltage_stdby = voltage_stdby;
    calibration_data.power_base = power_base;
    memcpy(&calibration_data.power_eye, &power_eye, sizeof(power_eye));
    memcpy(&calibration_data.power_fan, &power_fan, sizeof(power_fan));
    calibration_data.power_camera = power_camera;

    wkc_save(CALIBRATION_DATA_PATH, (char*)&calibration_data, sizeof(battery_calibration_data_t));
    calibration_valid = true;
    calibrating = false;
    ui_shell_show_toast(ui_shell_get_current(), wkc_translations_get_string("battery_calibrated"), 5);
    calibration_start = false;
    return 0;

    battery_calibrate_failed:
    ui_shell_show_toast(ui_shell_get_current(), wkc_translations_get_string("battery_calibrate_failed"), 5);
    calibration_start = false;
    return 1;
}