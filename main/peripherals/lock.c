#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"
#include <stdbool.h>
#include "esp_log.h"
#include "io/io_extend.h"
#include "adc.h"
#include "ui/shell.h"
#include "ui/home.h"
#include "ui/menu.h"
#include "profile/translations.h"
#include "peripherals/battery_calibration.h"
#include "protocol/ble.h"

static bool locked = false;
static SemaphoreHandle_t lock_semaphore = NULL;
QueueHandle_t lock_queue;
static ui_shell_t *current_shell = NULL;

typedef struct
{
    bool state;
    bool force;
    bool check;
} lock_queue_arg_t;


// TODO: Force unlock and disable lock when low battery
bool lock_is_busy()
{
    uint8_t reg_val = io_extend_fetch(2);
    return !!(reg_val & 0x0C);
}

static int _lock_set_priv(bool state, bool force, bool first_lock)
{
    if (!first_lock && locked == state) return 0;
    int ret;
    xSemaphoreTake(lock_semaphore, portMAX_DELAY);
    bool busy;
    do
    {
        busy = lock_is_busy();
    } while (force && busy);
    if (!busy)
    {
        gpio_write(GPIO_NUM_EXTEND | (16 + state + 2), 1);
        locked = state;
        ret = 0;
    }
    else
    {
        ESP_LOGW("LOCK", "Lock is busy");
        ret = 1;
    }
    xSemaphoreGive(lock_semaphore);
    return ret;
}

bool lock_check_power()
{
    int power_value;
    bool plugged, charging;
    adc_monitor_read_battery(&power_value, &charging, &plugged);
    if (!plugged || power_value < 10 && !charging || power_value < 20 && charging)
    {
        bool locked_pre = locked;
        _lock_set_priv(false, true, false);
        if (locked_pre)
            protocol_ble_notify_update_command("lock");
        return false;
    }
    return true;
}

int lock_set(bool state, bool force)
{
    if (lock_check_power())
    {
        if (!battery_calibration_is_calibrating())
            return _lock_set_priv(state, force, false);
        else return 3;
    }
    else return 2;
}

bool lock_get_state()
{
    return locked;
}

static void lock_check_queue(void *args)
{
    while(true)
    {
        lock_queue_arg_t lock_arg_resut;
        xQueueReceive(lock_queue, &lock_arg_resut, portMAX_DELAY);
        if(lock_arg_resut.check)
            lock_check_power();
        else
            _lock_set_priv(lock_arg_resut.state, lock_arg_resut.force, false);
        if (current_shell)
        {
            ui_home_update_from_shell(current_shell);
            ui_menu_update_from_shell(current_shell);
        }
    }
}

void lock_set_from_isr(bool state, bool force, bool check)
{
    xQueueOverwriteFromISR(lock_queue, (&(lock_queue_arg_t) {
        .state = state, .force = force, .check = check
    }), false);
}

void lock_init()
{
    lock_semaphore = xSemaphoreCreateMutex();
    lock_queue = xQueueCreate(1, sizeof(lock_queue_arg_t));
    xTaskCreatePinnedToCore((TaskFunction_t)lock_check_queue,
                            "lock_check_queue", 4096, NULL, 5, NULL, 1);
    _lock_set_priv(false, true, true);
}

void lock_set_shell(ui_shell_t *shell)
{
    current_shell = shell;
}

char *lock_result_to_char(int result)
{
    if (result == 1)
        return wkc_translations_get_string("menu_lock_too_fast");
    else if (result == 2)
        return wkc_translations_get_string("menu_lock_check_battery");
    else if (result == 3)
        return wkc_translations_get_string("menu_peripherals_disable_calibrate");
    else return NULL;
}