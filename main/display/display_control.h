#pragma once

#include "display_common.h"
#include "driver/gpio.h"

#define I2S_CLK 7500000

#define I2S_ACTUAL_PAL 480
#define I2S_ACTUAL_NTSC 477
#define I2S_ACTUAL_NUM_PAL 480
#define I2S_ACTUAL_NUM_NTSC 1430
#define I2S_ACTUAL_DEN_PAL 1
#define I2S_ACTUAL_DEN_NTSC 3
#define I2S_ACTUAL_HEIGHT_PAL 625
#define I2S_ACTUAL_HEIGHT_NTSC 525
#define I2S_ACTIVE_BEGIN_PAL_UPPER 15
#define I2S_ACTIVE_BEGIN_NTSC_UPPER 9
#define I2S_ACTIVE_BEGIN_PAL_LOWER 327
#define I2S_ACTIVE_BEGIN_NTSC_LOWER 271
#define I2S_ACTIVE_LEFT_PAL 80
#define I2S_ACTIVE_LEFT_NTSC 74
#define I2S_FRAME_SIZE_PAL 300000
#define I2S_FRAME_SIZE_NTSC 250250

#define SYNC_ITEMS_COUNT 5
#define COMP_HISTORY_COUNT 20

#define PRIMARY_SD_GPIO GPIO_NUM_40
#define PRIMARY_CLK_GPIO GPIO_NUM_39
#define PRIMARY_VSYNC_GPIO GPIO_NUM_47

#define SECONDARY_SD_GPIO GPIO_NUM_42
#define SECONDARY_CLK_GPIO GPIO_NUM_41
#define SECONDARY_VSYNC_GPIO GPIO_NUM_48

typedef struct
{
    uint8_t *frame_buffer;
    int64_t sync_time_us;
    display_format_t format;
    display_format_t last_format;
    gpio_num_t vsync_gpio;
    int sync_diff[SYNC_ITEMS_COUNT];
    int transmit_time[SYNC_ITEMS_COUNT];
    int transmit_diff[SYNC_ITEMS_COUNT];
    int sync_loop_count;
    int last_cpu_cycle;
    double auto_compensation_history[COMP_HISTORY_COUNT];
    int sync_index;
    int diff_index;
    int diff_broken;
    int auto_compensation_index;
    int inertia_cnt;
    int transmission_offset;
    int update_frame_count;
    int auto_compensation_major;
    int auto_compensation_minor;
    int transmission_cycle_count;
    bool switch_field;
    int channel_reset;
    int last_transmit_time;
    bool sync_loss_detection_enable;
    bool sync_loss_detection_level;
    int intr_edge;
} display_sync_info_t;


void display_control_init();
void display_settings_update();
void display_reset_power_save();
bool display_get_power_save();
uint8_t* display_control_get_primary_frame_buffer();
uint8_t* display_control_get_secondary_frame_buffer();
uint8_t* display_control_get_primary_main_buffer();
uint8_t* display_control_get_secondary_main_buffer();
uint8_t* display_control_get_primary_overlay_buffer();
uint8_t* display_control_get_secondary_overlay_buffer();
void display_set_power_down(bool power_down);
void display_control_get_formats(display_format_t *formats);