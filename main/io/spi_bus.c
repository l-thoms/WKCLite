#include "driver/spi_master.h"
#include "hal/spi_ll.h"
#include "hal/spi_hal.h"

#define SPI_MASTER_MOSI_IO 12
#define SPI_MASTER_MISO_IO 14
#define SPI_MASTER_SCLK_IO 13

static spi_device_handle_t spi_device_handle;

void spi_bus_init()
{
    spi_bus_config_t config = {
        .mosi_io_num = SPI_MASTER_MOSI_IO,
        .miso_io_num = SPI_MASTER_MISO_IO,
        .sclk_io_num = SPI_MASTER_SCLK_IO,
        .max_transfer_sz = 4000,
        .data_io_default_level = 0,
        .quadhd_io_num = -1,
        .quadwp_io_num = -1
    };
    ESP_ERROR_CHECK(spi_bus_initialize(SPI2_HOST, &config, SPI_DMA_CH_AUTO));
}

spi_device_handle_t get_spi_device_handle()
{
    return spi_device_handle;
}