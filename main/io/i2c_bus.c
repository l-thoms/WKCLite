#include "driver/i2c_master.h"

#define I2C_MASTER_SCL_IO GPIO_NUM_20
#define I2C_MASTER_SDA_IO GPIO_NUM_19

static i2c_master_bus_handle_t i2c_master_bus_handle;

void i2c_bus_init()
{
    i2c_master_bus_config_t config = {
        .clk_source = I2C_CLK_SRC_DEFAULT,
        .i2c_port = -1,
        .scl_io_num = I2C_MASTER_SCL_IO,
        .sda_io_num = I2C_MASTER_SDA_IO,
        .flags.enable_internal_pullup = true,
        .glitch_ignore_cnt = 7,
    };
    ESP_ERROR_CHECK(i2c_new_master_bus(&config, &i2c_master_bus_handle));
}

i2c_master_bus_handle_t get_i2c_master_bus_handle()
{
    return i2c_master_bus_handle;
}