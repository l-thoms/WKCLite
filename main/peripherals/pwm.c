#include "driver/ledc.h"
#include "profile/settings.h"
#include "adc.h"
#include "io/power_key.h"
#include "driver/gpio.h"
#include "battery_calibration.h"

#define FAN_GPIO GPIO_NUM_45
#define EYE_GPIO GPIO_NUM_38

static int eye_level = 0;
static int fan_level = 0;

static bool power_changed = false;
static bool power_down = false;
static bool init = false;

void pwm_devices_init()
{
    ledc_timer_config_t timer_config = {
        .clk_cfg = LEDC_APB_CLK,
        .timer_num = LEDC_TIMER_0,
        .freq_hz = 100000,
        .duty_resolution = LEDC_TIMER_8_BIT,
        .speed_mode = LEDC_LOW_SPEED_MODE,
        .deconfigure = 0
    };
    ledc_timer_config(&timer_config);
    ledc_channel_config_t channel_config = {
        .channel = LEDC_CHANNEL_0,
        .timer_sel = LEDC_TIMER_0,
        .duty = 0,
        .gpio_num = EYE_GPIO,
        .hpoint = 0,
        .sleep_mode = LEDC_SLEEP_MODE_NO_ALIVE_NO_PD,
        .speed_mode = LEDC_LOW_SPEED_MODE,
        .intr_type = LEDC_INTR_DISABLE,
        .flags = {
            .output_invert = false
        }
    };
    ledc_channel_config(&channel_config);
    timer_config.timer_num = LEDC_TIMER_1;
    timer_config.duty_resolution = LEDC_TIMER_12_BIT,
    timer_config.freq_hz = 200;
    ledc_timer_config(&timer_config);
    channel_config.channel = LEDC_CHANNEL_1;
    channel_config.timer_sel = LEDC_TIMER_1;
    channel_config.gpio_num = FAN_GPIO;
    ledc_fade_func_install(ESP_INTR_FLAG_LEVEL1);
    ledc_channel_config(&channel_config);
    init = true;
}

bool pwm_device_is_init()
{
    return init;
}

static void pwm_device_set_eye_level_priv(int level, bool temp)
{
    if (level > 3) level = 3;
    if (level < 0) level = 0;
    if (!temp)
    {
        eye_level = level;
        wkc_settings_get_current()->peripherals.eye = eye_level;
    }
    int selected_duty = !temp && power_down ? 0 :
                        level == 1 ? 64 :
                        level == 2 ? 128 :
                        level == 3 ? 256 :
                        0;
    ledc_set_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0, selected_duty);
    ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0);
    if (!temp)
    {
        power_changed = true;
        wkc_settings_save();
    }
}

void pwm_device_set_eye_level(int level)
{
    if (!battery_calibration_is_calibrating())
        pwm_device_set_eye_level_priv(level, false);
}

void pwm_device_set_eye_level_temp(int level)
{
    pwm_device_set_eye_level_priv(level, true);
}

void pwm_device_set_fan_level_priv(int level, bool temp)
{
    if (level > 3) level = 3;
    if (level < 0) level = 0;
    if (!temp)
    {
        fan_level = level;
        wkc_settings_get_current()->peripherals.fan = fan_level;
    }
    int selected_duty = !temp && power_down ? 0 : level * 1365;
    ledc_fade_stop(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_1);
    if (selected_duty == 0)
    {
        ledc_set_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_1, selected_duty);
        ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_1);
    }
    else
    {
        ledc_set_fade_time_and_start(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_1, selected_duty,
                                     1000 * !!selected_duty, LEDC_FADE_NO_WAIT);
    }
    if (!temp)
    {
        power_changed = true;
        wkc_settings_save();
    }
}

void pwm_device_set_fan_level(int level)
{
    if (!battery_calibration_is_calibrating())
        pwm_device_set_fan_level_priv(level, false);
}

void pwm_device_set_fan_level_temp(int level)
{
    pwm_device_set_fan_level_priv(level, true);
}

int pwm_device_toggle_eye()
{
    pwm_device_set_eye_level((eye_level + 1) % 4);
    return eye_level;
}

int pwm_device_toggle_fan()
{
    pwm_device_set_fan_level((fan_level + 1) % 4);
    return fan_level;
}

int pwm_device_get_eye_level()
{
    return eye_level;
}

int pwm_device_get_fan_level()
{
    return fan_level;
}

bool pwm_device_power_skip()
{
    if (power_changed)
    {
        power_changed = false;
        return true;
    }
    return false;
}

void pwm_device_check_power()
{
    int power_value;
    bool charging;
    adc_monitor_read_battery(&power_value, &charging, NULL);
    if ((power_value < 10 && !charging || power_value < 20 && charging) && !power_down)
    {
        power_down = true;
        pwm_device_set_eye_level(eye_level);
        pwm_device_set_fan_level(fan_level);
    }
    else if (power_down)
    {
        power_down = false;
        pwm_device_set_eye_level(eye_level);
        pwm_device_set_fan_level(fan_level);
    }
}

void pwm_device_load_from_settings()
{
    wkc_settings_t *current_settings = wkc_settings_get_current();
    pwm_device_set_eye_level(current_settings->peripherals.eye);
    pwm_device_set_fan_level(current_settings->peripherals.fan);
}