#include <math.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_log.h"
#include "io/io_extend.h"
#include "adc.h"
#include "pwm.h"
#include "lock.h"
#include "battery_calibration.h"
#include "profile/settings.h"
#include "ui/ui_common.h"
#include "esp_random.h"

#define BATTERY_VALID_THRESHOLD 150

#define IR_VALUE_THRESHOLD 3650

static adc_oneshot_unit_handle_t current_unit_handle;

static bool current_ir_value = false;
static bool temp_increment = false;
static int current_battery_result = 0;
static battery_state_t state;
static int battery_invalid_count = 0;
ui_page_type_t last_page_type;
static int charging_value = -1;
static int stdby_value = -1;

double adc_value_to_voltage(int adc_value)
{
    return adc_value * 1.5 / 4096 * 3.3;
}

double battery_value_to_vbat(double battery_value)
{
    double battery_uniform = battery_value / 100;
    return -0.7 * pow(battery_uniform, 4) + 3.6 * pow (battery_uniform, 3) -
           4.5 * pow(battery_uniform, 2) + 2.8 * battery_uniform + 3;
}

// Assume R_load = 1 in 100%
double vbat_to_resistance(double vbat)
{
    return 0.6966 * pow(vbat - 3, 4) - 2.572 * pow(vbat - 3, 3) +
           4.63 * pow(vbat - 3, 2) - 3.704 * (vbat - 3) + 1.778;
}

static inline double rload_get_from_stdby(double vload)
{
    return vload / BATTERY_VOLTAGE_FULL / (1 - vload / BATTERY_VOLTAGE_FULL);
}

static inline double pload_get_from_stdby(double vload)
{
    return pow(vload, 2) / rload_get_from_stdby(vload);
}

static inline double rload_get(double vload, double pload)
{
    return pow(vload, 2) / pload;
}

static inline double iload_get(double vload, double pload)
{
    return vload / pload;
}

static double vbat_to_battery_value(double vbat)
{
    int iter = 12;
    // Actually the charging and standby voltage may be slightly higher than 4.2V
    double battery_value_start = 0, battery_value_end = 125; // About 4.8V
    while (iter--)
    {
        double battery_value_mid = (battery_value_start + battery_value_end) / 2;
        double vbat_mid = battery_value_to_vbat(battery_value_mid);
        if (vbat_mid < vbat)
            battery_value_start = battery_value_mid;
        else
            battery_value_end = battery_value_mid;
    }
    return (battery_value_start + battery_value_end) / 2;
}

static inline double battery_aux_function(double vload, double pload, double vbat_ideal)
{
    return vload * (1 + vbat_to_resistance(vbat_ideal) / rload_get(vload, pload)) - vbat_ideal;
}

static inline double battery_aux_derivative(double vload, double pload, double vbat_ideal)
{
    return vload / rload_get(vload, pload) * (2.7864 * pow(vbat_ideal - 3, 3) -
           7.716 * pow (vbat_ideal - 3, 2) + 9.26 * (vbat_ideal - 3) - 3.704) - 1;
}

double battery_value_get_coarse(double vload, double pload)
{
    double derivative_zp_start = BATTERY_VOLTAGE_EMPTY,
           derivative_zp_end = battery_value_to_vbat(125),
           derivative_zp;
    int iter = 10;
    if (battery_aux_function(vload, pload, 3.) < 0) return 0;
    // Calculate derivative = 0
    double derivative_zp_end_value = battery_aux_derivative(vload, pload,
                                     derivative_zp_end);
    if (derivative_zp_end_value < 0) derivative_zp = derivative_zp_end;
    else
    {
        while (iter--)
        {
            double derivative_zp_mid = (derivative_zp_start + derivative_zp_end) / 2;
            double derivative_zp_mid_value = battery_aux_derivative(vload, pload,
                                             derivative_zp_mid);
            if (derivative_zp_mid_value < 0)
            {
                derivative_zp_start = derivative_zp_mid;
            }
            else
            {
                derivative_zp_end = derivative_zp_mid;
            }
        }
        derivative_zp = (derivative_zp_start + derivative_zp_end) / 2;
    }

    if (battery_aux_function(vload, pload, derivative_zp) > 0)
        return vbat_to_battery_value(derivative_zp);
    else
    {
        double battery_voltage_start = BATTERY_VOLTAGE_EMPTY;
        double battery_voltage_end = derivative_zp;
        iter = 10;
        while (iter--)
        {
            double battery_voltage_mid = (battery_voltage_start + battery_voltage_end) / 2;
            double battery_aux_mid = battery_aux_function(vload, pload, battery_voltage_mid);
            if(battery_aux_mid < 0)
                battery_voltage_end = battery_voltage_mid;
            else
                battery_voltage_start = battery_voltage_mid;
        }
        return vbat_to_battery_value((battery_voltage_start + battery_voltage_end) / 2);
    }
}

static int battery_value_get_precise(double vload, double pload)
{
    double zero_point = battery_calibration_get_current()->value_zero;
    double full_point = vbat_to_battery_value(
        battery_calibration_get_current()->voltage_charging);
    double current_point = battery_value_get_coarse(vload, pload);
    return clamp((int)((current_point - zero_point) / (full_point - zero_point) * 100 +
                 0.5), 0, 100);
}

static int battery_value_get(double vload, double pload)
{
    int precise_value = battery_value_get_precise(vload, pload);
    if (precise_value < current_battery_result ||
        precise_value >= current_battery_result + 5)
        return precise_value;
    else return current_battery_result;
}

int adc_monitor_read_channel(adc_channel_t channel)
{
    int read_value;
    if (adc_oneshot_read(current_unit_handle, channel, &read_value))
        return -1;
    return read_value;
}

static void adc_monitor_task(void *params)
{
    bool init = false;
    if (params != NULL) init = ((bool*)params)[0];
    do
    {
        // Pause monitor while state changed
        battery_state_t fetch = io_extend_fetch(0) & 3;

        if (state != fetch && !init)
        {
            temp_increment = false;
            if (battery_invalid_count == 0)
            {
                if (state == BATTERY_STATE_STDBY && fetch == BATTERY_STATE_NORMAL &&
                    battery_calibration_is_calibrating() && charging_value != -1 &&
                    stdby_value != -1)
                {
                    ESP_LOGI("ADC", "Begin calibrate");
                    battery_calibration_calibrate(adc_value_to_voltage(charging_value),
                        adc_value_to_voltage(stdby_value));
                }
                else
                {
                    vTaskDelay(1000 / portTICK_PERIOD_MS);
                }
            }
            state = fetch;
            continue;
        }
        if (lock_is_busy() || pwm_device_power_skip())
        {
            vTaskDelay(1000 / portTICK_PERIOD_MS);
            continue;
        }
        ui_page_t *current_page = ui_shell_get_current_page(
                                  ui_shell_get_current());
        ui_page_type_t current_page_type = UI_PAGE_TYPE_HOME;
        if (!init && current_page)
        {
            ui_page_type_t current_page_type = current_page->type;
            if (current_page_type == UI_PAGE_TYPE_CAMERA && last_page_type != UI_PAGE_TYPE_CAMERA ||
                current_page_type != UI_PAGE_TYPE_CAMERA && last_page_type == UI_PAGE_TYPE_CAMERA)
            {
                last_page_type = current_page_type;
                vTaskDelay(1000 / portTICK_PERIOD_MS);
                continue;
            }
            else
                last_page_type = current_page_type;
        }

        int read_ir_value, read_battery_value;
        read_ir_value = adc_monitor_read_channel(ADC_IR_CHANNEL);
        if(read_ir_value < 0)
        {
            ESP_LOGE("ADC", "Failed to read IR value");
        }
        else
        {
            current_ir_value = read_ir_value > IR_VALUE_THRESHOLD;
        }

        int battery_value_min = INT_MAX, battery_value_max = INT_MIN;
        double battery_value_average = 0;
        for (int i = 0; i < 10; i++)
        {
            int current = adc_monitor_read_channel(ADC_BATTERY_CHANNEL);
            if (current == -1) battery_invalid_count = 5;
            if (battery_value_min > current) battery_value_min = current;
            if (battery_value_max < current) battery_value_max = current;
            battery_value_average += current / 10.;
            vTaskDelay (100 / portTICK_PERIOD_MS);
        }
        fetch = io_extend_fetch(0) & 3;
        current_page = ui_shell_get_current_page(ui_shell_get_current());
        if (!init && current_page)
        {
            current_page_type = current_page->type;
        }
        if (state != fetch || current_page_type != last_page_type && !init && current_page)
        {
            vTaskDelay(1000 / portTICK_PERIOD_MS);
            continue;
        }
        else if (battery_value_max - battery_value_min >= BATTERY_VALID_THRESHOLD)
        {
            battery_invalid_count = 5;
        }
        read_battery_value = (int)(battery_value_average + 0.5);

        battery_calibration_data_t *calibration_data = battery_calibration_get_current();

        if (fetch == BATTERY_STATE_CHRG)
        {
            double coefficient = vbat_to_battery_value(
                battery_calibration_get_current()->voltage_stdby
            ) / 100;
            current_battery_result = clamp((int)(vbat_to_battery_value(
                adc_value_to_voltage(read_battery_value)) * coefficient + 0.5f), 0, 99);

            if (battery_invalid_count == 0)
                charging_value = read_battery_value;
        }
        else if (fetch == BATTERY_STATE_STDBY)
        {
            if (battery_invalid_count == 0)
                stdby_value = read_battery_value;
            current_battery_result = 100;
        }
        else
        {
            double current_power = calibration_data->power_base;
            int current_eye_level = clamp(pwm_device_get_eye_level(), 0, 3);
            int current_fan_level = clamp(pwm_device_get_fan_level(), 0, 3);
            if (current_eye_level > 0)
                current_power += calibration_data->power_eye[current_eye_level - 1];
            if (current_fan_level > 0)
                current_power += calibration_data->power_fan[current_fan_level - 1];
            if (current_page_type == UI_PAGE_TYPE_CAMERA)
                current_power += calibration_data->power_camera;
            current_battery_result = battery_value_get(adc_value_to_voltage(
                                     read_battery_value), current_power);
            charging_value = -1;
            stdby_value = -1;
        }

        if (battery_invalid_count > 0)
            battery_invalid_count -= 1;
        else
            battery_invalid_count = 0;

        pwm_device_check_power();
        lock_check_power();
    } while (!init);
}

void adc_monitor_init()
{
    adc_oneshot_unit_init_cfg_t adc_config = {
        .unit_id = ADC_UNIT_1,
        .ulp_mode = ADC_ULP_MODE_DISABLE,
    };
    ESP_ERROR_CHECK(adc_oneshot_new_unit(&adc_config, &current_unit_handle));

    adc_oneshot_chan_cfg_t adc_channel_config = {
        .bitwidth = ADC_BITWIDTH_12,
        .atten = ADC_ATTEN_DB_12,
    };
    ESP_ERROR_CHECK(adc_oneshot_config_channel(current_unit_handle, ADC_BATTERY_CHANNEL,
        &adc_channel_config));

    adc_channel_config = (adc_oneshot_chan_cfg_t) {
        .bitwidth = ADC_BITWIDTH_12,
        .atten = ADC_ATTEN_DB_6,
    };
    ESP_ERROR_CHECK(adc_oneshot_config_channel(current_unit_handle, ADC_IR_CHANNEL,
        &adc_channel_config));
    // Read first value
    bool init = true;
    adc_monitor_task(&init);
    xTaskCreatePinnedToCore(adc_monitor_task, "adc_monitor", 3072, NULL, 10, NULL, 1);
}

bool adc_monitor_read_ir()
{
    return current_ir_value;
}

void adc_monitor_read_battery(int *value, bool *charging, bool *plugged)
{
    if(value != NULL)
    {
        *value = current_battery_result;
    }
    if(charging != NULL)
        *charging = state != BATTERY_STATE_NORMAL;
    if(plugged != NULL)
        *plugged = battery_invalid_count == 0;
}