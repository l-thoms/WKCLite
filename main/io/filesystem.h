#pragma once

#include "esp_system.h"
#define CAPTURE_DIR "/sdcard/wkc_capture"

esp_err_t wkc_storage_init_static();
esp_err_t wkc_storage_init_fonts();
esp_err_t wkc_storage_init_dynamic();
int wkc_storage_ensure_capture_dir();
void wkc_storage_remove_sdcard();
bool wkc_storage_is_sdcard_active();
esp_err_t wkc_storage_init_sdcard();
int wkc_copy(const char *src, const char *dst);
void wkc_size_to_char(size_t size, char *result);
int wkc_get_file_size(const char *path, size_t *size);
int wkc_open(const char *path, char *buffer, size_t size);
int wkc_save(const char *path, char *buffer, size_t size);
bool wkc_file_exist(const char *path);
int wkc_directory_file_count(const char *path);