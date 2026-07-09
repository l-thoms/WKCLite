#include <math.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_chip_info.h"
#include "esp_flash.h"
#include "esp_system.h"
#include "esp_adc/adc_oneshot.h"
#include "esp_log.h"
#include "driver/gpio.h"
#include "io/io_extend.h"
#include "adc.h"
#include "pwm.h"
#include "lock.h"

#define BATTERY_VALUE_FULL 3300
#define BATTERY_VALUE_CHARGING_FULL 3450
#define BATTERY_VALUE_EMPTY 2300
#define BATTERY_VALUE_CHARGING_EMPTY 2500
#define BATTERY_VALUE_LENGTH 10
#define BATTERY_VALID_THRESHOLD 150

#define IR_VALUE_THRESHOLD 3650

static adc_oneshot_unit_handle_t current_unit_handle;

static bool current_ir_value = false;
static bool battery_value_init = false;
static int battery_value_storage[BATTERY_VALUE_LENGTH] = { 0 };
static battery_state_t battery_state_storage[BATTERY_VALUE_LENGTH] = { 0 };
static int current_battery_index = 0;
static int current_battery_result = 0;
static battery_state_t state;
static bool is_battery_plugged = false;

static bool battery_value_check_valid()
{
    int battery_value_max = INT16_MIN, battery_value_min = INT16_MAX;
    for (int i = 0; i < BATTERY_VALUE_LENGTH; i++)
    {
        if (battery_state_storage[i] != BATTERY_STATE_NORMAL &&
            battery_state_storage[i] != BATTERY_STATE_CHRG)
        {
            if (battery_value_storage[i] > battery_value_max)
                battery_value_max = battery_value_storage[i];
            if (battery_value_storage[i] < battery_value_min)
                battery_value_min = battery_value_storage[i];
        }
    }
    return battery_value_max - battery_value_min < BATTERY_VALID_THRESHOLD;
}

static void adc_calculate_battery_percentage()
{
    int battery_value_average = 0;
    int battery_value_corrected[BATTERY_VALUE_LENGTH];
    memcpy(battery_value_corrected, battery_value_storage, sizeof(int) * BATTERY_VALUE_LENGTH);
    // Scale value by state, to uncharged format
    for (int i = 0; i < BATTERY_VALUE_LENGTH; i++)
    {
        if (battery_state_storage[i] == BATTERY_STATE_STDBY)
        {
            battery_value_corrected[i] = BATTERY_VALUE_FULL;
        }
        else if (battery_state_storage[i] == BATTERY_STATE_CHRG)
        {
            battery_value_corrected[i] = (int)(BATTERY_VALUE_EMPTY +
                (float)(battery_value_corrected[i] - BATTERY_VALUE_CHARGING_EMPTY) /
                (BATTERY_VALUE_CHARGING_FULL - BATTERY_VALUE_CHARGING_EMPTY) *
                (BATTERY_VALUE_FULL - BATTERY_VALUE_EMPTY) + 0.5f);
        }
    }

    for (int i = 0; i < BATTERY_VALUE_LENGTH; i++)
        battery_value_average += battery_value_corrected[i];
    battery_value_average = (int)((float)battery_value_average / BATTERY_VALUE_LENGTH + 0.5f);

    int calculated_percentage = (int)round((float)(battery_value_average - BATTERY_VALUE_EMPTY) /
                                (BATTERY_VALUE_FULL - BATTERY_VALUE_EMPTY) * 100);
    if(calculated_percentage > 100) calculated_percentage = 100;
    if(calculated_percentage < 0) calculated_percentage = 0;
    if (calculated_percentage != current_battery_result) // Single-directional increment
    {
        if (current_battery_index < BATTERY_VALUE_LENGTH || state == BATTERY_STATE_UNDEF ||
            state == BATTERY_STATE_NORMAL && calculated_percentage < current_battery_result ||
            state == BATTERY_STATE_CHRG && calculated_percentage > current_battery_result)
            current_battery_result = calculated_percentage;
        if (state == BATTERY_STATE_CHRG && current_battery_result == 100)
            current_battery_result = 99;
        else if (state == BATTERY_STATE_STDBY)
            current_battery_result = 100;
    }
}

static void adc_monitor_task(void *params)
{
    bool init = false;
    if (params != NULL) init = ((bool*)params)[0];
    do
    {
        // Pause monitor while state changed
        battery_state_t fetch = io_extend_fetch(0);
        if (state != fetch && !init)
        {
            state = fetch;
            goto adc_monitor_next;
        }
        if (lock_is_busy() || pwm_device_power_skip())
            goto adc_monitor_next;

        int read_ir_value, read_battery_value;
        esp_err_t result = adc_oneshot_read(current_unit_handle, ADC_CHANNEL_1,
            &read_ir_value);
        if(result == ESP_OK) current_ir_value = read_ir_value > IR_VALUE_THRESHOLD;
        result = adc_oneshot_read(current_unit_handle, ADC_CHANNEL_0, &read_battery_value);
        if(result)
        {
            ESP_LOGE("ADC", "Failed to read ADC value, reason: %d", result);
        }
        // Fix voltage drop on pwm peripherals
        if (fetch == BATTERY_STATE_NORMAL)
            read_battery_value += pwm_device_get_power_compensation_value();
        //printf("The battery ADC value is: %d, %d\n", read_battery_value, current_battery_result);
        // Record battery value
        if (!battery_value_init)
        {
            for (int i = 0; i < BATTERY_VALUE_LENGTH; i++)
            {
                battery_value_storage[i] = read_battery_value;
                battery_state_storage[i] = fetch;
            }
            battery_value_init = true;
        }
        battery_value_storage[current_battery_index++ %
                              BATTERY_VALUE_LENGTH] = read_battery_value;
        battery_state_storage[current_battery_index++ %
                              BATTERY_VALUE_LENGTH] = fetch;
        state = fetch;
        adc_calculate_battery_percentage();
        is_battery_plugged = battery_value_check_valid();
        pwm_device_check_power();
        lock_check_power();
        adc_monitor_next:
        if(!init)
            vTaskDelay(1000 / portTICK_PERIOD_MS);
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
    ESP_ERROR_CHECK(adc_oneshot_config_channel(current_unit_handle, ADC_CHANNEL_0,
        &adc_channel_config));

    adc_channel_config = (adc_oneshot_chan_cfg_t) {
        .bitwidth = ADC_BITWIDTH_12,
        .atten = ADC_ATTEN_DB_6,
    };
    ESP_ERROR_CHECK(adc_oneshot_config_channel(current_unit_handle, ADC_CHANNEL_1,
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
        //*value = battery_value_storage[current_battery_index %
        //                                BATTERY_VALUE_LENGTH] + current_battery_result * 10000;
    }
    if(charging != NULL)
        *charging = state != BATTERY_STATE_NORMAL;
    if(plugged != NULL)
        *plugged = is_battery_plugged;
}