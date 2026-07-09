#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/i2c_master.h"
#include "driver/gpio.h"
#include "io/i2c_bus.h"
#include "esp_system.h"
#include "esp_log.h"
#include "io_extend.h"
#include "time.h"
#include "esp_rtc_time.h"
#include "sys/time.h"
#include <unistd.h>

#define IO_EXTEND_ADDRESS 0x2c
#define IO_EXTEND_RTC_ADDRESS 0x51

#define IO_EXTEND_CAMERA_ADDRESS 0x5D

#define TAG "IO_EXTEND"

static i2c_master_dev_handle_t io_extend_device;
static i2c_master_dev_handle_t io_extend_rtc_device;
static i2c_master_dev_handle_t io_extend_camera_device;
static uint8_t io_extend_output_reg1 = 0;
static bool time_valid = false;

void io_extend_init()
{
    gpio_install_isr_service(ESP_INTR_FLAG_EDGE);
    i2c_device_config_t device_config = {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address = IO_EXTEND_ADDRESS,
        .scl_speed_hz = 100000
    };

    ESP_ERROR_CHECK(i2c_master_bus_add_device(get_i2c_master_bus_handle(),
    &device_config, &io_extend_device));

    i2c_device_config_t rtc_device_config = {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address = IO_EXTEND_RTC_ADDRESS,
        .scl_speed_hz = 100000
    };

    ESP_ERROR_CHECK(i2c_master_bus_add_device(get_i2c_master_bus_handle(),
    &rtc_device_config, &io_extend_rtc_device));

    i2c_device_config_t camera_device_config = {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address = IO_EXTEND_CAMERA_ADDRESS,
        .scl_speed_hz = 100000
    };

    ESP_ERROR_CHECK(i2c_master_bus_add_device(get_i2c_master_bus_handle(),
    &camera_device_config, &io_extend_camera_device));

    bool pass;
    do
    {
        pass = true;
        uint8_t read_buffer, write_buffer;
        write_buffer = 0;
        if (i2c_master_transmit(io_extend_rtc_device, (uint8_t[]){ 0 }, 1, -1))
        {
            ESP_LOGE("I2C_INIT", "IO extend RTC test failed");
            continue;
        }
        else
            ESP_LOGI("I2C_INIT", "IO extend RTC test successed");

        if (i2c_master_transmit(io_extend_device, &write_buffer, 1, -1))
        {
            ESP_LOGE("I2C_INIT", "IO extend reg 0 test failed");
            pass = false;
        }
        else if (i2c_master_receive(io_extend_device, &read_buffer, 1, -1))
        {
            ESP_LOGE("I2C_INIT", "IO extend reg 0 receive failed");
            pass = false;
        }

        write_buffer = 1;
        if (i2c_master_transmit(io_extend_device, &write_buffer, 1, -1))
        {
            ESP_LOGE("I2C_INIT", "IO extend reg 1 test failed");
            pass = false;
        }
        else if (i2c_master_receive(io_extend_device, &read_buffer, 1, -1))
        {
            ESP_LOGE("I2C_INIT", "IO extend reg 1 receive failed");
            pass = false;
        }
        else if (read_buffer & (1 << 5))
        {
            ESP_LOGE("I2C_INIT", "IO extend reg 1 busy: %d", read_buffer);
            pass = false;
        }

        write_buffer = 2;
        if (i2c_master_transmit(io_extend_device, &write_buffer, 1, -1))
        {
            ESP_LOGE("I2C_INIT", "IO extend reg 2 test failed");
            pass = false;
        }
        else if (i2c_master_receive(io_extend_device, &read_buffer, 1, -1))
        {
            ESP_LOGE("I2C_INIT", "IO extend reg 2 receive failed");
            pass = false;
        }
        else if (read_buffer & 15)
        {
            ESP_LOGE("I2C_INIT", "IO extend reg 2 busy: %d", read_buffer);
            pass = false;
        }
    } while (!pass);
    ESP_LOGI("I2C_INIT", "IO extend test successed");
}

int io_extend_read_camera(uint8_t reg, uint8_t *value)
{
    int trial = 100;
    while (trial--)
    {
        if (i2c_master_transmit(io_extend_camera_device, &reg, 1, -1) == 0)
            break;
    }
    if (trial == 0) return 1;
    trial = 100;
    while (trial--)
    {
        if (i2c_master_receive(io_extend_camera_device, value, 1, -1) == 0)
            return 0;
    }
    return 1;
}

int io_extend_write_camera(uint8_t reg, uint8_t value)
{
    int trial = 100;
    uint8_t write_value[] = { reg, value };
    while (trial--)
    {
        if (i2c_master_transmit(io_extend_camera_device, write_value, 2, -1) == 0)
            return 0;
        ESP_LOGW("IO_EXTEND", "Trial %d: %02X, %02X", 100 - trial, (int)reg, (int)value);
    }
    return 1;
}

int io_extend_test_camera()
{
    uint8_t write_buffer[2] = { 0 };
    return i2c_master_transmit(io_extend_camera_device, write_buffer, 2, -1);
}

uint8_t io_extend_fetch(uint8_t reg)
{
    while (i2c_master_transmit(io_extend_device, &reg, 1, -1));
    uint8_t result;
    while (i2c_master_receive(io_extend_device, &result, 1, -1));
    return result;
}

void io_extend_set_offset(int index, int offset)
{
    if (index > 1 || offset >= 256) return;
    uint8_t buffer[] = { IO_EXTEND_REG_OFFSET + index, offset };
    while (i2c_master_transmit(io_extend_device, buffer, 2, -1));
}

bool io_extend_is_time_valid()
{
    return time_valid;
}

int io_extend_load_time()
{
    uint8_t read_data[7];
    while (i2c_master_transmit(io_extend_rtc_device, (uint8_t[]) { 2 }, 1, -1));
    while (i2c_master_receive(io_extend_rtc_device, read_data, 7, -1));
    if (read_data[0] & 0x80)
        return 1;
    time_valid = true;
    struct tm time_data = {
        .tm_sec = (read_data[0] >> 4) % 8 * 10 + read_data[0] % 16,
        .tm_min = (read_data[1] >> 4) % 8 * 10 + read_data[1] % 16,
        .tm_hour = (read_data[2] >> 4) % 4 * 10 + read_data[2] % 16,
        .tm_mday = (read_data[3] >> 4) % 4 * 10 + read_data[3] % 16,
        .tm_mon = (read_data[5] >> 4) % 2 * 10 + read_data[5] % 16 - 1,
        .tm_year = ((read_data[6] >> 4) * 10 + read_data[6] % 16) + 100,
    };
    settimeofday(&(struct timeval) { .tv_sec = mktime(&time_data) },
                 &(struct timezone) { .tz_minuteswest = 0, .tz_dsttime = DST_NONE });
    return 0;
}

int io_extend_save_time(struct tm *time_data)
{
    if (settimeofday(&(struct timeval) { .tv_sec = mktime(time_data) },
                 &(struct timezone) { .tz_minuteswest = 0, .tz_dsttime = DST_NONE }))
        return 1;
    while (i2c_master_transmit(io_extend_rtc_device, (uint8_t[]) { 2,
        time_data->tm_sec / 10 << 4 | time_data->tm_sec % 10,
        time_data->tm_min / 10 << 4 | time_data->tm_min % 10,
        time_data->tm_hour / 10 << 4 | time_data->tm_hour % 10,
        time_data->tm_mday / 10 << 4 | time_data->tm_mday % 10,
        time_data->tm_wday,
        (time_data->tm_mon + 1) / 10 << 4 | time_data->tm_mon % 10,
        (time_data->tm_year - 100) / 10 << 4 | time_data->tm_year % 10
    }, 8, -1));
    time_valid = true;
    return 0;
}

esp_err_t gpio_write(int gpio_num, int value)
{
    esp_err_t ret;
    if(gpio_num > 0xFF) return ESP_ERR_INVALID_ARG;
    else if (gpio_num & GPIO_NUM_EXTEND)
    {
        int io_extend_index = gpio_num & ~GPIO_NUM_EXTEND;
        uint8_t write_buffer[2];
        write_buffer[0] = io_extend_index / 8;
        if (io_extend_index / 8 == IO_EXTEND_REG_DISPLAY_CONTROL)
        {
            io_extend_output_reg1 &= ~(1 << (io_extend_index % 8));
            io_extend_output_reg1 |= (!!value) << (io_extend_index % 8);
            write_buffer[1] = io_extend_output_reg1;
        }
        else
            write_buffer[1] = (!!value) << (io_extend_index % 8);
        while (i2c_master_transmit(io_extend_device, write_buffer, 2, -1));
    }
    else
    {
        ret = gpio_set_direction(gpio_num, GPIO_MODE_OUTPUT);
        if(ret != ESP_OK)
        {
            ESP_LOGE(TAG, "Failed to set direction of GPIO %d: %s", gpio_num, esp_err_to_name(ret));
            return ret;
        }
        ret = gpio_set_level(gpio_num, value);
        if(ret != ESP_OK)
        {
            ESP_LOGE(TAG, "Failed to set level of GPIO %d: %s", gpio_num, esp_err_to_name(ret));
            return ret;
        }
    }
    return ret;
}

int gpio_read(int gpio_num)
{
    if(gpio_num & GPIO_NUM_EXTEND)
    {
        int io_extend_index = gpio_num & ~GPIO_NUM_EXTEND;
        return !!(io_extend_fetch(io_extend_index / 8) & (1 << (io_extend_index % 8)));
    }
    else
    {
        gpio_set_direction(gpio_num, GPIO_MODE_INPUT);
        return gpio_get_level(gpio_num);
    }
}