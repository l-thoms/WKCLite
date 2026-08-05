#include <stdio.h>
#include <sys/stat.h>
#include "esp_log.h"
#include "esp_littlefs.h"
#include "esp_vfs_fat.h"
#include "driver/sdmmc_host.h"
#include <sys/dir.h>
#include <sys/dirent.h>
#include "filesystem.h"

#define TAG "WKC_FILESYSTEM"

sdmmc_card_t *sd_card = NULL;

esp_err_t wkc_storage_init_static()
{
    ESP_LOGI(TAG, "Init static partition...");
    esp_vfs_fat_mount_config_t mount_config = VFS_FAT_MOUNT_DEFAULT_CONFIG();
    mount_config.max_files = 10;
    esp_err_t ret = esp_vfs_fat_spiflash_mount_ro("/data_static", "data_static",
                    &mount_config);
    if(ret != ESP_OK)
    {
        if(ret == ESP_FAIL)
            ESP_LOGE(TAG, "Failed to mount static partition");
        else if (ret == ESP_ERR_NOT_FOUND)
            ESP_LOGE(TAG, "Failed to find static partition");
        else
            ESP_LOGE(TAG, "Failed to initialize filesystem: %s", esp_err_to_name(ret));

    }
    return ret;
}

esp_err_t wkc_storage_init_fonts()
{
    ESP_LOGI(TAG, "Init fonts partition...");
    esp_vfs_fat_mount_config_t mount_config = VFS_FAT_MOUNT_DEFAULT_CONFIG();
    mount_config.max_files = 10;
    esp_err_t ret = esp_vfs_fat_spiflash_mount_ro("/data_fonts", "data_fonts",
                    &mount_config);
    if(ret != ESP_OK)
    {
        if(ret == ESP_FAIL)
            ESP_LOGE(TAG, "Failed to mount fonts partition");
        else if (ret == ESP_ERR_NOT_FOUND)
            ESP_LOGE(TAG, "Failed to find fonts partition");
        else
            ESP_LOGE(TAG, "Failed to initialize filesystem: %s", esp_err_to_name(ret));

    }
    return ret;
}

esp_err_t wkc_storage_init_dynamic()
{
    ESP_LOGI(TAG, "Init dynamic partition...");
    esp_vfs_littlefs_conf_t conf = {
        .base_path = "/data_dynamic",
        .partition_label = "data_dynamic",
        .read_only = false,
        .dont_mount = false,
        .format_if_mount_failed = true
    };
    esp_err_t ret = esp_vfs_littlefs_register(&conf);
    if(ret != ESP_OK)
    {
        if(ret == ESP_FAIL)
            ESP_LOGE(TAG, "Failed to mount dynamic partition");
        else if (ret == ESP_ERR_NOT_FOUND)
            ESP_LOGE(TAG, "Failed to find dynamic partition");
        else
            ESP_LOGE(TAG, "Failed to initialize filesystem: %s", esp_err_to_name(ret));

    }
    return ret;
}

void wkc_storage_remove_sdcard()
{
    if (sd_card)
    {
        esp_vfs_fat_sdcard_unmount("/sdcard", sd_card);
        sd_card = NULL;
    }
}

bool wkc_storage_is_sdcard_active()
{
    return sd_card != NULL;
}

esp_err_t wkc_storage_init_sdcard()
{
    if (sd_card)
        return ESP_OK;
    sdmmc_host_t host = SDMMC_HOST_DEFAULT();
    sdmmc_slot_config_t slot_config = SDMMC_SLOT_CONFIG_DEFAULT();
    slot_config.cmd = GPIO_NUM_16;
    slot_config.clk = GPIO_NUM_17;
    slot_config.d0 = GPIO_NUM_18;
    slot_config.d1 = GPIO_NUM_8;
    slot_config.d2 = GPIO_NUM_7;
    slot_config.d3 = GPIO_NUM_15;
    slot_config.width = 4;
    esp_vfs_fat_mount_config_t mount_config = {
        .disk_status_check_enable = true,
        .allocation_unit_size = 0,
        .format_if_mount_failed = false,
        .use_one_fat = false,
        .max_files = 5,
    };
    esp_err_t ret = esp_vfs_fat_sdmmc_mount("/sdcard", &host, &slot_config, &mount_config, &sd_card);
    if (ret)
    {
        wkc_storage_remove_sdcard();
        return ret;
    }
    return ret;
}

int wkc_storage_ensure_capture_dir()
{
    int ret;
    if (!sd_card)
    {
        ret = wkc_storage_init_sdcard();
        if (ret) return ret;
    }
    DIR *capture_dir = opendir(CAPTURE_DIR);
    if (capture_dir)
    {
        closedir(capture_dir);
        return 0;
    }
    else
    {
        if(mkdir(CAPTURE_DIR, 0755))
        {
            wkc_storage_remove_sdcard();
            ret = wkc_storage_init_sdcard();
            if (wkc_storage_init_sdcard() || mkdir(CAPTURE_DIR, 0755))
                return 1;
            return 0;
        }
        return 0;
    }
}

int wkc_copy(const char *src, const char *dst)
{
    FILE *file_src = fopen(src, "rb");
    if(file_src == NULL) return 1;
    FILE *file_dst = fopen(dst, "wb");
    int ch;
    while ((ch = fgetc(file_src)) != EOF)
        fputc(ch, file_dst);

    fclose(file_src);
    fclose(file_dst);
    return 0;
}

int wkc_get_file_size(const char *path, size_t *size)
{
    struct stat st;
    int ret = stat(path, &st);
    if (ret) return ret;
    *size = (size_t)st.st_size;
    return 0;
}

void wkc_size_to_char(size_t size, char *result)
{
    if (size >= 1 << 30)
        sprintf(result, "%.3g %s", (double)size / (1 << 30), "GB");
    else if (size >= 1 << 20)
        sprintf(result, "%.3g %s", (double)size / (1 << 20), "MB");
    else if (size >= 1 << 10)
        sprintf(result, "%.3g %s", (double)size / (1 << 10), "KB");
    else
        sprintf(result, "%d %s", (int)size, "B");
}

int wkc_open(const char *path, char *buffer, size_t size)
{
    FILE *file = fopen(path, "rb");
    if(file == NULL) return 1;
    fread(buffer, size, 1, file);
    fclose(file);
    return 0;
}

int wkc_save(const char *path, char *buffer, size_t size)
{
    FILE *file = fopen(path, "wb");
    if(file == NULL)return 1;
    fwrite(buffer, size, 1, file);
    fclose(file);
    return 0;
}

bool wkc_file_exist(const char *path)
{
    FILE *file = fopen(path, "r");
    if(file == NULL)return false;
    fclose(file);
    return true;
}

int wkc_directory_file_count(const char *path)
{
    DIR *capture_dir = opendir(CAPTURE_DIR);
    if (!capture_dir) return -1;
    struct dirent *directory_dirent;
    int file_count = 0;
    while (directory_dirent = readdir(capture_dir))
    {
        if (directory_dirent->d_type == DT_REG)
            file_count++;
    }
    closedir(capture_dir);
    return file_count;
}