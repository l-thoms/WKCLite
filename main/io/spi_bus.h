#pragma once

#include "driver/spi_master.h"

void spi_bus_init();
spi_device_handle_t get_spi_device_handle();