#include "driver/ledc.h"
#include "profile/settings.h"
#include "adc.h"
#include "io/power_key.h"
#include "driver/gpio.h"

#define FAN_GPIO GPIO_NUM_45
#define EYE_GPIO GPIO_NUM_38

static int eye_level = 0;
static int fan_level = 0;

static bool power_changed = false;
static bool power_down = false;
static bool current_power_state = false;

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
    ledc_channel_config(&channel_config);
}

void pwm_device_set_eye_level(int level)
{
    if (level > 3) level = 3;
    if (level < 0) level = 0;
    eye_level = level;
    wkc_settings_get_current()->peripherals.eye = eye_level;
    int selected_duty = power_down || !current_power_state ? 0 :
                        eye_level == 1 ? 64 :
                        eye_level == 2 ? 128 :
                        eye_level == 3 ? 256 :
                        0;
    ledc_set_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0, selected_duty);
    ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0);
    power_changed = true;
    wkc_settings_save();
}

void pwm_device_set_fan_level(int level)
{
    if (level > 3) level = 3;
    if (level < 0) level = 0;
    fan_level = level;
    wkc_settings_get_current()->peripherals.fan = fan_level;
    int selected_duty = power_down || !current_power_state ? 0 : fan_level * 1365;
    ledc_set_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_1, selected_duty);
    ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_1);
    power_changed = true;
    wkc_settings_save();
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

int pwm_device_get_power_compensation_value()
{
    if (power_down || !current_power_state) return 0;
    return eye_level * 10 + !!fan_level * 60;
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
    adc_monitor_read_battery(&power_value, NULL, NULL);
    current_power_state = power_key_get_state();
    if (power_value < 10 && !power_down)
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