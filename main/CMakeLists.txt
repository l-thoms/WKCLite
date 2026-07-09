file(GLOB_RECURSE WKC_LITE_CS "${CMAKE_CURRENT_LIST_DIR}/*.c")
idf_component_register(SRCS ${WKC_LITE_CS}
                       INCLUDE_DIRS "."
                       PRIV_REQUIRES spi_flash nvs_flash bt esp_driver_i2c
                       esp_adc driver spiffs esp-tls esp_psram esp_driver_i2s
                       esp_driver_ledc esp32-camera esp_driver_sdmmc fatfs
                       INCLUDE_DIRS "")
