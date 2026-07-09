#pragma once

#include "esp_system.h"
#include "time.h"

#define GPIO_NUM_EXTEND 0x80
#define IO_EXTEND_REG_POWER 0x00
#define IO_EXTEND_REG_DISPLAY_CONTROL 0x01
#define IO_EXTEND_REG_LOCK_BRIGHTNESS 0x02
#define IO_EXTEND_REG_OFFSET 0x03

void io_extend_init();
int io_extend_read_camera(uint8_t reg, uint8_t *value);
int io_extend_write_camera(uint8_t reg, uint8_t value);
int io_extend_test_camera();
void io_extend_set_offset(int index, int offset);
uint8_t io_extend_fetch(uint8_t reg);
bool io_extend_is_time_valid();
int io_extend_load_time();
int io_extend_save_time(struct tm *time_data);
esp_err_t gpio_write(int gpio_num, int value);
int gpio_read(int gpio_num);