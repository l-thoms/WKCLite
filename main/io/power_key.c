#include "driver/gpio.h"
#include "esp_log.h"
#include "peripherals/lock.h"
#include "io_extend.h"
#include "ui/shell.h"
#include "esp_timer.h"
#include "esp_sleep.h"
#include "display/display_control.h"

static bool power_state = true;
static ui_shell_t *current_shell = NULL;
int64_t last_keydown_time = 0;

bool power_key_get_state()
{
    return power_state;
}

static void power_key_isr(void *args)
{
    int64_t current_time = esp_timer_get_time();
    int64_t time_diff = current_time - last_keydown_time;
    last_keydown_time = current_time;
    if (time_diff < 20000 || gpio_read(GPIO_NUM_0) == 0) return;
    // Unlock whel locked
    if (display_get_power_save())
    {
        display_reset_power_save();
        return;
    }
    if (lock_get_state())
    {
        lock_set_from_isr(false, true, false);
        if (current_shell)
            ui_shell_show_toast(current_shell, "已解锁", 5);
        return;
    }
    power_state = !power_state;
    lock_set_from_isr(false, false, true);
    if (!power_state)
    {
        esp_sleep_enable_ext0_wakeup(GPIO_NUM_0, 0);
        esp_light_sleep_start();
    }
}

void power_key_set_shell(ui_shell_t *shell)
{
    current_shell = shell;
}

void power_key_init()
{
    gpio_set_intr_type(GPIO_NUM_0, GPIO_INTR_ANYEDGE);
    gpio_isr_handler_add(GPIO_NUM_0, power_key_isr, NULL);
}