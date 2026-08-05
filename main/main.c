#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "driver/gpio.h"
#include "nvs_flash.h"
#include "protocol/ble.h"
#include "io/filesystem.h"
#include "io/i2c_bus.h"
#include "io/io_extend.h"
#include "io/power_key.h"
#include "profile/userprofile.h"
#include "profile/settings.h"
#include "profile/translations.h"
#include "display/display_control.h"
#include "display/font_management.h"
#include "ui/shell.h"
#include "ui/home.h"
#include "ui/menu.h"
#include "ui/device_info.h"
#include "ui/settings.h"
#include "ui/files.h"
#include "ui/camera.h"
#include "peripherals/adc.h"
#include "peripherals/pwm.h"
#include "peripherals/lock.h"

void app_main(void)
{
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND)
    {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);
    // Init filesystem
    ESP_LOGI("MAIN", "Init file system...");
    wkc_storage_init_dynamic();
    wkc_storage_init_fonts();
    wkc_storage_init_static();

    // Init profile
    ESP_LOGI("MAIN", "Init userprofile...");
    wkc_userprofile_init();
    wkc_settings_init();
    wkc_security_init();

    // Init translations
    ESP_LOGI("MAIN", "Init translations...");
    wkc_translations_init();

    ESP_LOGI("MAIN", "Init I2C...");
    i2c_bus_init();
    io_extend_init();
    io_extend_load_time();

    ESP_LOGI("MAIN", "Init sdcard...");
    if(wkc_storage_init_sdcard())
        ESP_LOGW("MAIN", "Unable to mount sdcard");

    ESP_LOGI("MAIN", "Init ADC...");
    adc_monitor_init();

    ESP_LOGI("MAIN", "Init Lock...");
    lock_init();

    ESP_LOGI("MAIN", "Init PWM...");
    pwm_devices_init();
    pwm_device_load_from_settings();

    ESP_LOGI("MAIN", "Init power key...");
    gpio_uninstall_isr_service();
    gpio_install_isr_service(ESP_INTR_FLAG_EDGE | ESP_INTR_FLAG_IRAM | ESP_INTR_FLAG_LEVEL3);
    power_key_init();

    ESP_LOGI("MAIN", "Preload font...");
    font_preload();

    ESP_LOGI("MAIN", "Init display...");
    display_control_init();
    vTaskDelay(500 / portTICK_PERIOD_MS);

    ui_shell_t *shell = ui_shell_create();

    ESP_LOGI("MAIN", "Init bluetooth...");
    protocol_ble_init(shell);

    ESP_LOGI("MAIN", "Init UI...");
    ui_page_t *home = ui_home_create();
    ui_page_t *menu = ui_menu_create();
    ui_page_t *device_info = ui_device_info_create();
    ui_page_t *settings = ui_settings_create();
    ui_page_t *files = ui_files_create();
    ui_page_t *camera = ui_camera_create();
    ui_shell_add_page(shell, home);
    ui_shell_add_page(shell, menu);
    ui_shell_add_page(shell, device_info);
    ui_shell_add_page(shell, settings);
    ui_shell_add_page(shell, files);
    ui_shell_add_page(shell, camera);
    ui_shell_show_page(shell, home);
    power_key_set_shell(shell);
    lock_set_shell(shell);

    bool plugged;
    adc_monitor_read_battery(NULL, NULL, &plugged);
    // 警告: 当前设备未连接电池，请确保连接的电源（如充电宝）供电稳定，以免意外关机。
    // Warning: The current device is not connected to a battery. Please ensure that the connected power source (such as a power bank) provides stable power to avoid accidental shutdown.
    if(!plugged)
    ui_shell_show_toast(shell,
        wkc_translations_get_string("main_battery_disconnected_warning"), 30);
    // Begin main loop
    ESP_LOGI("MAIN", "Entering Mainloop...");
    //ui_shell_mainloop(shell);
    xTaskCreatePinnedToCore((TaskFunction_t)ui_shell_mainloop, "mainloop", 8192, shell, 5, NULL, 1);
    return;
}
