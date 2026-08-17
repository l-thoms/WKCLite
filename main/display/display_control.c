#include <string.h>
#include <math.h>
#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"
#include "driver/i2s_std.h"
#include "driver/gpio.h"
#include "rom/ets_sys.h"
#include "io/io_extend.h"
#include "io/power_key.h"
#include "display_control.h"
#include "esp_cpu.h"
#include "esp_attr.h"
#include "esp_timer.h"
#include "esp_log.h"
#include "display_common.h"
#include "display_control.h"
#include "graphics.h"
#include "profile/settings.h"
#include "peripherals/adc.h"
#include "peripherals/battery_calibration.h"

// PAL: 768x576 active, transmit 800x625
// NTSC: 640x480 active, transmit 800x525

#define OPERATE_THRESHOLD 2000000
#define OPERATE_PRE       1000000

#define DISP_GPIO GPIO_NUM_21

#define SYNC_DIFF_PAL_STD 9600000
#define SYNC_DIFF_NTSC_STD 8008000
#define I2S_TRANSMISSION_UNIT_TIME 122880

#define CPU_CYCLE_TO_PIXEL(cycle) (((cycle) * 15 + ets_get_cpu_frequency()) / \
                                  (ets_get_cpu_frequency() * 2))
#define CPU_CYCLE_TO_PIXEL_FLOAT(cycle) ((cycle) * 7.5 / ets_get_cpu_frequency())

static i2s_chan_handle_t handle_primary;
static i2s_chan_handle_t handle_secondary;

static display_sync_info_t primary_sync_info;
static display_sync_info_t secondary_sync_info;

static bool current_power_state = false;
static int64_t power_save_begin = 0;

static int64_t last_operate_time;
static int64_t last_cancel_start;
static int64_t last_cancel_duration;
static SemaphoreHandle_t operate_hang_semaphore;
static int operate_hang_count;

static i2s_chan_config_t primary_chan_config = {
    .id = I2S_NUM_0,
    .role = I2S_ROLE_MASTER,
    .dma_desc_num = 2,
    .dma_frame_num = 240,
    .auto_clear_after_cb = false,
    .auto_clear_before_cb = true,
    .allow_pd = false,
    .intr_priority = 4
};

static i2s_chan_config_t secondary_chan_config = {
    .id = I2S_NUM_1,
    .role = I2S_ROLE_MASTER,
    .dma_desc_num = 2,
    .dma_frame_num = 240,
    .auto_clear_after_cb = false,
    .auto_clear_before_cb = true,
    .allow_pd = false,
    .intr_priority = 4
};

// Buffer allocated into internal to interact with I2S directly
uint8_t *primary_frame_buffer = NULL;
uint8_t *secondary_frame_buffer = NULL;

// Separate main and overlay layer into PSRAM
uint8_t *primary_main_buffer = NULL;
uint8_t *secondary_main_buffer = NULL;
uint8_t *primary_overlay_buffer = NULL;
uint8_t *secondary_overlay_buffer = NULL;

static bool IRAM_ATTR i2s_controller_tx_callback(i2s_chan_handle_t handle, i2s_event_data_t *event, void *user_ctx)
{
    int new_transmission_time = esp_cpu_get_cycle_count();
    if(user_ctx == NULL) return true;
    display_sync_info_t *sync_info = (display_sync_info_t*)user_ctx;
    bool current_field = gpio_read(sync_info->vsync_gpio);
    int last_transmission_time_result = sync_info->last_transmit_time;
    sync_info->last_transmit_time = new_transmission_time;
    uint32_t *buf = (uint32_t*)event->dma_buf;
    int length = event->size / 4;
    wkc_settings_t *current_settings = wkc_settings_get_current();

    uint32_t *uint32 = (uint32_t*)sync_info->frame_buffer;

    // Select format data
    int actual = sync_info->format == DISPLAY_FORMAT_NTSC ? I2S_ACTUAL_NTSC : I2S_ACTUAL_PAL;
    int actual_num = sync_info->format == DISPLAY_FORMAT_NTSC ? I2S_ACTUAL_NUM_NTSC:
                                          I2S_ACTUAL_NUM_PAL;
    int actual_den = sync_info->format == DISPLAY_FORMAT_NTSC ? I2S_ACTUAL_DEN_NTSC:
                                          I2S_ACTUAL_DEN_PAL;
    int active_begin_upper = sync_info->format == DISPLAY_FORMAT_NTSC ?
                                                  I2S_ACTIVE_BEGIN_NTSC_UPPER:
                                                  I2S_ACTIVE_BEGIN_PAL_UPPER;
    int active_begin_lower = sync_info->format == DISPLAY_FORMAT_NTSC ?
                                                  I2S_ACTIVE_BEGIN_NTSC_LOWER:
                                                  I2S_ACTIVE_BEGIN_PAL_LOWER;
    int active_left = sync_info->format == DISPLAY_FORMAT_NTSC ?
                                           I2S_ACTIVE_LEFT_NTSC :
                                           I2S_ACTIVE_LEFT_PAL;
    int display_height = sync_info->format == DISPLAY_FORMAT_NTSC ?
                                              DISPLAY_HEIGHT_NTSC :
                                              DISPLAY_HEIGHT_PAL;
    int frame_size = sync_info->format == DISPLAY_FORMAT_NTSC ?
                                          I2S_FRAME_SIZE_NTSC :
                                          I2S_FRAME_SIZE_PAL;
    int start_offset = sync_info->format == DISPLAY_FORMAT_NTSC ? -72 : -48;
    if (sync_info == &primary_sync_info)
    {
        start_offset += 16 * current_settings->display.position[0].output_timing;
        active_begin_upper += current_settings->display.position[0].y_offset;
        active_begin_lower += current_settings->display.position[0].y_offset;
    }
    else if (sync_info == &secondary_sync_info)
    {
        start_offset += 16 * current_settings->display.position[1].output_timing;
        active_begin_upper += current_settings->display.position[1].y_offset;
        active_begin_lower += current_settings->display.position[1].y_offset;
    }

    if(sync_info->channel_reset)
    {
        sync_info->transmit_ticks = 0;
        sync_info->transmit_num = 0;
        sync_info->transmission_offset = CPU_CYCLE_TO_PIXEL(new_transmission_time  -
                                         sync_info->transmission_cycle_count) - start_offset -
                                         (sync_info->intr_edge == GPIO_INTR_NEGEDGE) *
                                         actual / 2;
        sync_info->channel_reset -= 1;
    }
    else
    {
        // Transmission loss detect
        sync_info->transmit_num += 1;
        int transmit_increment = new_transmission_time - last_transmission_time_result;
        sync_info->transmit_ticks += transmit_increment;
        if (transmit_increment <= I2S_TRANSMISSION_UNIT_TIME)
        {
            int calculated_transmit_num = (sync_info->transmit_ticks +
                                          I2S_TRANSMISSION_UNIT_TIME / 2) /
                                          I2S_TRANSMISSION_UNIT_TIME;
            int skip_transmit_count = calculated_transmit_num - sync_info->transmit_num;
            sync_info->transmission_offset += event->size * 4 * skip_transmit_count;
            sync_info->transmit_num += skip_transmit_count;
        }
    }

    int current_transmission_offset = sync_info->transmission_offset;
    // Precalculate next transmission offset
    if (current_field != sync_info->switch_field)
    {
        if(current_field)
        {
            sync_info->transmission_offset -= sync_info->auto_compensation_major -
                                              sync_info->auto_compensation_major / 2;
            sync_info->update_frame_count++;
        }
        else
        {
            bool compensation_minor_en = false;
            for(int i = 0; i < sync_info->auto_compensation_minor; i++)
            {
                if (sync_info->update_frame_count % 100 ==
                    i * 100 / sync_info->auto_compensation_minor)
                {
                    compensation_minor_en = true;
                    break;
                }
            }
            sync_info->transmission_offset -= sync_info->auto_compensation_major / 2 +
                                              (compensation_minor_en);
        }
    }
    sync_info->transmission_offset += event->size * 4;
    sync_info->transmission_offset = (sync_info->transmission_offset + frame_size * 2) % frame_size;
    sync_info->switch_field = current_field;
    for(int i = 0; i < length; i++) // 4 bytes per unit
    {
        int offset_corrected = (current_transmission_offset + frame_size) % frame_size;
        int selected_pixel = offset_corrected + i * 16;
        int selected_x_coarse = selected_pixel % actual_num;
        int selected_y_coarse = selected_pixel / actual_num;
        int selected_x = selected_x_coarse % actual;
        int selected_y = selected_y_coarse * actual_den + selected_x_coarse / actual;
        if (selected_x < active_left || selected_x >= active_left + DISPLAY_WIDTH_PAL)
        {
            // Begin of the horizontal line and tell FPGA to set horizontal resolution
            // 10: NTSC, 11: PAL
            if (selected_x < active_left && selected_x >= active_left - 16)
                buf[i] = sync_info->format == DISPLAY_FORMAT_NTSC ? 0x00020000 : 0x00030000;
            continue;
        }
        if (selected_y < active_begin_upper ||
           (selected_y >= active_begin_upper + display_height &&
            selected_y < active_begin_lower) ||
            selected_y >= active_begin_lower + display_height)
            continue;
        selected_x -= active_left;
        if(selected_y > active_begin_lower)
            selected_y -= active_begin_lower;
        else selected_y -= active_begin_upper;
        uint32_t selected_unit = (selected_y * DISPLAY_WIDTH_PAL + selected_x) / 16;
        buf[i] = uint32[selected_unit];
    }
    return true;
}

static void display_control_disable_secondary()
{
    if(handle_secondary != NULL)
    {
        i2s_channel_disable(handle_secondary);
        i2s_del_channel(handle_secondary);
        handle_secondary = NULL;
    }
}

static void display_control_set_secondary(display_format_t format)
{
    display_control_disable_secondary();
    i2s_new_channel(&secondary_chan_config, &handle_secondary, NULL);
    i2s_std_slot_config_t slot = I2S_STD_PCM_SLOT_DEFAULT_CONFIG(I2S_DATA_BIT_WIDTH_16BIT, I2S_SLOT_MODE_STEREO);
    slot.ws_width = 1;
    slot.bit_shift = false;
    i2s_std_clk_config_t clk = I2S_STD_CLK_DEFAULT_CONFIG(468750);
    clk.clk_src = I2S_CLK_SRC_PLL_240M;
    i2s_std_gpio_config_t gpio = {
        .bclk = SECONDARY_CLK_GPIO,
        .ws = -1,
        .din = -1,
        .dout = SECONDARY_SD_GPIO,
        .mclk = -1,
    };
    i2s_std_config_t std_config = {
        .clk_cfg = clk,
        .gpio_cfg = gpio,
        .slot_cfg = slot
    };
    i2s_event_callbacks_t callbacks = {
        .on_sent = i2s_controller_tx_callback
    };
    i2s_channel_init_std_mode(handle_secondary, &std_config);
    i2s_channel_register_event_callback(handle_secondary, &callbacks, &secondary_sync_info);
    i2s_channel_enable(handle_secondary);
}

static void display_control_disable_primary()
{
    if(handle_primary != NULL)
    {
        i2s_channel_disable(handle_primary);
        i2s_del_channel(handle_primary);
        handle_primary = NULL;
    }
}

static void display_control_set_primary(display_format_t format)
{
    display_control_disable_primary();
    i2s_new_channel(&primary_chan_config, &handle_primary, NULL);
    i2s_std_slot_config_t slot = I2S_STD_PCM_SLOT_DEFAULT_CONFIG(I2S_DATA_BIT_WIDTH_16BIT, I2S_SLOT_MODE_STEREO);
    slot.ws_width = 1;
    slot.bit_shift = false;
    i2s_std_clk_config_t clk = I2S_STD_CLK_DEFAULT_CONFIG(468750);
    clk.clk_src = I2S_CLK_SRC_PLL_240M;
    i2s_std_gpio_config_t gpio = {
        .bclk = PRIMARY_CLK_GPIO,
        .ws = -1,
        .din = -1,
        .dout = PRIMARY_SD_GPIO,
        .mclk = -1,
    };
    i2s_std_config_t std_config = {
        .clk_cfg = clk,
        .gpio_cfg = gpio,
        .slot_cfg = slot
    };
    i2s_event_callbacks_t callbacks = {
        .on_sent = i2s_controller_tx_callback
    };
    i2s_channel_init_std_mode(handle_primary, &std_config);
    i2s_channel_register_event_callback(handle_primary, &callbacks, &primary_sync_info);
    i2s_channel_enable(handle_primary);
}

static void IRAM_ATTR vsync_isr(void *args)
{
    int cpu_cycle = esp_cpu_get_cycle_count();
    int64_t cycle_us = esp_timer_get_time();
    if(args == NULL) return;
    display_sync_info_t *sync_info = (display_sync_info_t*)args;
    int64_t diff_us = cycle_us - sync_info->sync_time_us;
    double diff_fps = 1e06 / diff_us;
    if(diff_fps >= 22.5 && diff_fps < 27.5)
        sync_info->format = DISPLAY_FORMAT_PAL;
    else if(diff_fps >= 27.5 && diff_fps < 32.5)
        sync_info->format = DISPLAY_FORMAT_NTSC;
    sync_info->sync_time_us = cycle_us;
    sync_info->sync_index = (sync_info->sync_index + 1) % SYNC_ITEMS_COUNT;
    int diff = cpu_cycle - sync_info->last_cpu_cycle;
    sync_info->last_cpu_cycle = cpu_cycle;
    int diff_std = sync_info->format == DISPLAY_FORMAT_NTSC ? SYNC_DIFF_NTSC_STD :
                                        SYNC_DIFF_PAL_STD;
    if (diff > diff_std * 5 / 4 || diff < diff_std * 3 / 4 ||
        (cycle_us - last_operate_time > 0 &&
        last_operate_time + OPERATE_THRESHOLD - cycle_us > 0) ||
        operate_hang_count > 0)
        sync_info->diff_broken = 3;

    double diff_average = 0;
    int diff_max = INT_MIN, diff_min = INT_MAX;
    for(int i = 0; i < SYNC_ITEMS_COUNT; i++)
    {
        diff_average += sync_info->sync_diff[i];
        diff_max = sync_info->sync_diff[i] > diff_max ? sync_info->sync_diff[i] : diff_max;
        diff_min = sync_info->sync_diff[i] < diff_min ? sync_info->sync_diff[i] : diff_min;
    }
    diff_max = diff > diff_max ? diff : diff_max;
    diff_min = diff < diff_min ? diff : diff_min;
    diff_average /= SYNC_ITEMS_COUNT;
    if (fabs(diff_average - diff) >= 50 || abs(diff_max - diff_min) >= 100 ||
        sync_info->diff_broken)
    {
        sync_info->inertia_cnt = 3;
    }
    if (!sync_info->diff_broken && fabs(diff_average - diff) < 100 &&
        abs(diff_max - diff_min) < 150)
    {
        double auto_compensation_float = CPU_CYCLE_TO_PIXEL_FLOAT(diff_average - diff_std);
        sync_info->auto_compensation_history[sync_info->auto_compensation_index %
                                             COMP_HISTORY_COUNT] = auto_compensation_float;
        sync_info->auto_compensation_index++;
        if (sync_info->auto_compensation_index >= COMP_HISTORY_COUNT)
        {
            double auto_compensation_average = 0;
            double auto_compensation_max = INT_MIN, auto_compensation_min = INT_MAX;
            for(int i = 0; i < COMP_HISTORY_COUNT; i++)
            {
                auto_compensation_average += sync_info->auto_compensation_history[i];
                if(sync_info->auto_compensation_history[i] > auto_compensation_max)
                    auto_compensation_max = sync_info->auto_compensation_history[i];
                if(sync_info->auto_compensation_history[i] < auto_compensation_min)
                    auto_compensation_min = sync_info->auto_compensation_history[i];
            }
            auto_compensation_average -= auto_compensation_max + auto_compensation_min;
            auto_compensation_average /= COMP_HISTORY_COUNT - 2;
            sync_info->auto_compensation_major = (int)(auto_compensation_average);
            sync_info->auto_compensation_minor = (int)(0.5 + (auto_compensation_average -
                                                  sync_info->auto_compensation_major) * 100);
        }
        else
        {
            sync_info->auto_compensation_major = (int)(auto_compensation_float);
            sync_info->auto_compensation_minor = (int)(0.5 + (auto_compensation_float -
                                                  sync_info->auto_compensation_major) * 100);
        }
    }
    if(!sync_info->diff_broken)
    {
        sync_info->sync_diff[sync_info->diff_index] = diff;
        sync_info->diff_index = (sync_info->diff_index + 1) % SYNC_ITEMS_COUNT;
    }

    if(sync_info->diff_broken > 0) sync_info->diff_broken -= 1;

    if(sync_info->inertia_cnt == 0)
    {
        sync_info->transmission_cycle_count = cpu_cycle;
        sync_info->channel_reset = 3;
        sync_info->inertia_cnt = -1;
    }
    else
    {
        sync_info->inertia_cnt -= 1;
    }
}

void display_control_init_sync_info(display_sync_info_t *sync_info, uint8_t *frame_buffer,
    gpio_num_t vsync_gpio, int intr_edge)
{
    sync_info->frame_buffer = frame_buffer;
    sync_info->format = DISPLAY_FORMAT_UNDEFINDED;
    sync_info->last_format = DISPLAY_FORMAT_UNDEFINDED;
    sync_info->vsync_gpio = vsync_gpio;
    sync_info->sync_index = 0;
    sync_info->diff_index = 0;
    sync_info->diff_broken = 0;
    sync_info->inertia_cnt = 0;
    sync_info->sync_loop_count = 0;
    sync_info->transmission_offset = 0;
    sync_info->update_frame_count = 0;
    sync_info->auto_compensation_major = 0;
    sync_info->auto_compensation_minor = 0;
    sync_info->transmission_cycle_count = 0;
    sync_info->switch_field = false;
    sync_info->channel_reset = 0;
    sync_info->last_transmit_time = 0;
    sync_info->transmit_ticks = 0;
    sync_info->transmit_num = 0;
    sync_info->intr_edge = intr_edge;

    gpio_set_direction(vsync_gpio, GPIO_MODE_INPUT);
    gpio_set_intr_type(vsync_gpio, intr_edge);
    gpio_isr_handler_add(vsync_gpio, vsync_isr, sync_info);
}

static bool display_control_sync_lost_detection(display_sync_info_t *sync_info, gpio_num_t gpio,
                                         const char *description)
{
    int64_t current_us = esp_timer_get_time();
    if (current_us - sync_info->sync_time_us > 100000)
    {
        if(!sync_info->sync_loss_detection_enable)
        {
            sync_info->sync_loss_detection_level = gpio_read(gpio);
            sync_info->sync_loss_detection_enable = true;
        }
        else
        {
            if(gpio_read(gpio) != sync_info->sync_loss_detection_level)
            {
                ESP_LOGW("DISPLAY_CONTROL", "%s vsync ISR lost", description);
                sync_info->sync_loss_detection_enable = false;
                return true;
            }
        }
    }
    else sync_info->sync_loss_detection_enable = false;
    return false;
}

static void display_control_polling_task(void *params)
{
    while (true)
    {
        bool last_power_state = current_power_state;
        bool primary_reset_format = false, secondary_reset_format = false;
        if (primary_sync_info.format != primary_sync_info.last_format)
        {
            display_control_cancel_operate_time(2000000);
            primary_reset_format = true;
            primary_sync_info.last_format = primary_sync_info.format;
            ESP_LOGI("DISPLAY_CONTROL", "Switching primary format...");
        }

        if (secondary_sync_info.format != secondary_sync_info.last_format)
        {
            display_control_cancel_operate_time(2000000);
            secondary_reset_format = true;
            secondary_sync_info.last_format = secondary_sync_info.format;
            ESP_LOGI("DISPLAY_CONTROL", "Switching secondary format...");
        }

        if (primary_reset_format || secondary_reset_format ||
            last_power_state != current_power_state)
        {
            display_control_set_primary(primary_sync_info.format);
            display_control_set_secondary(secondary_sync_info.format);
            display_settings_update();
        }

        bool primary_lost = display_control_sync_lost_detection(&primary_sync_info,
                            PRIMARY_VSYNC_GPIO, "Primary");
        vTaskDelay(50 / portTICK_PERIOD_MS);
        // Flip edge to avoid crash
        bool secondary_lost = display_control_sync_lost_detection(&secondary_sync_info, SECONDARY_VSYNC_GPIO,
                              "Secondary");
        if(primary_lost || secondary_lost || primary_reset_format || secondary_reset_format)
        {
            gpio_uninstall_isr_service();
            gpio_install_isr_service(ESP_INTR_FLAG_EDGE | ESP_INTR_FLAG_IRAM | ESP_INTR_FLAG_LEVEL3);
            power_key_init();
            secondary_sync_info.intr_edge = secondary_sync_info.intr_edge == GPIO_INTR_POSEDGE ?
                                                                             GPIO_INTR_NEGEDGE :
                                                                             GPIO_INTR_POSEDGE;
            gpio_set_direction(PRIMARY_VSYNC_GPIO, GPIO_MODE_INPUT);
            gpio_set_direction(SECONDARY_VSYNC_GPIO, GPIO_MODE_INPUT);
            gpio_set_intr_type(PRIMARY_VSYNC_GPIO, primary_sync_info.intr_edge);
            gpio_isr_handler_add(PRIMARY_VSYNC_GPIO, vsync_isr, &primary_sync_info);
            gpio_set_intr_type(SECONDARY_VSYNC_GPIO, secondary_sync_info.intr_edge);
            gpio_isr_handler_add(SECONDARY_VSYNC_GPIO, vsync_isr, &secondary_sync_info);
        }
        // Power save detection
        int64_t power_save_time;
        switch (wkc_settings_get_current()->power_save)
        {
            case 1:
                power_save_time = 60 * 1000000;
                break;
            case 5:
                power_save_time = 5 * 60 * 1000000;
                break;
            case 10:
                power_save_time = 10 * 60 * 1000000;
                break;
            default:
                power_save_time = -1;
                break;
        }
        if (!adc_monitor_read_ir() || power_save_time < 0)
        {
            power_save_begin = esp_timer_get_time();
            current_power_state = false;
        }
        else if (esp_timer_get_time() - power_save_begin > power_save_time &&
                 !battery_calibration_is_calibrating())
        {
            current_power_state = true;
        }

        if (!last_power_state && current_power_state)
            gpio_write(DISP_GPIO, 0);
        else if (last_power_state && !current_power_state)
            gpio_write(DISP_GPIO, 1);

        vTaskDelay(50 / portTICK_PERIOD_MS);
    }
}

void display_reset_power_save()
{
    power_save_begin = esp_timer_get_time();
    current_power_state = false;
    gpio_write(DISP_GPIO, 1);
}

bool display_get_power_save()
{
    return current_power_state;
}

void display_settings_update()
{
    wkc_settings_t *current_settings = wkc_settings_get_current();
    switch (current_settings->display.output_mode)
    {
        case 0:
            gpio_write(GPIO_NUM_EXTEND | 11, 0);
            gpio_write(GPIO_NUM_EXTEND | 12, 0);
        break;
        case 1:
            gpio_write(GPIO_NUM_EXTEND | 11, 1);
            gpio_write(GPIO_NUM_EXTEND | 12, 0);
        break;
        default:
            gpio_write(GPIO_NUM_EXTEND | 12, 1);
        break;
    }
    int primary_offset = current_settings->display.position[0].x_offset;
    int secondary_offset = current_settings->display.position[1].x_offset;
    if (primary_sync_info.format == DISPLAY_FORMAT_NTSC)
        primary_offset = (int)(primary_offset / 1.2f + 0.5f);
    if (secondary_sync_info.format == DISPLAY_FORMAT_NTSC)
        secondary_offset = (int)(secondary_offset / 1.2f + 0.5f);

    io_extend_set_offset(0, primary_offset);
    io_extend_set_offset(1, secondary_offset);
    gpio_write(GPIO_NUM_EXTEND | 8, current_settings->display.capture_index);
    gpio_write(GPIO_NUM_EXTEND | 9, current_settings->display.capture_osd);
    gpio_write(GPIO_NUM_EXTEND | 14, primary_sync_info.format != DISPLAY_FORMAT_NTSC);
    gpio_write(GPIO_NUM_EXTEND | 13, secondary_sync_info.format != DISPLAY_FORMAT_NTSC);
}

void display_set_power_down(bool power_down)
{
    gpio_write(GPIO_NUM_EXTEND | 10, !power_down);
}

void display_control_init()
{
    operate_hang_semaphore = xSemaphoreCreateMutex();
    gpio_write(DISP_GPIO, 1);
    display_settings_update();
    vTaskDelay(100 / portTICK_PERIOD_MS);
    primary_frame_buffer = (uint8_t*)heap_caps_calloc(384 * 288 / 4, 1, MALLOC_CAP_INTERNAL);
    secondary_frame_buffer = (uint8_t*)heap_caps_calloc(384 * 288 / 4, 1, MALLOC_CAP_INTERNAL);
    primary_main_buffer = (uint8_t*)heap_caps_calloc(384 * 288 / 4, 1, MALLOC_CAP_SPIRAM);
    secondary_main_buffer = (uint8_t*)heap_caps_calloc(384 * 288 / 4, 1, MALLOC_CAP_SPIRAM);
    primary_overlay_buffer = (uint8_t*)heap_caps_calloc(384 * 288 / 4, 1, MALLOC_CAP_SPIRAM);
    secondary_overlay_buffer = (uint8_t*)heap_caps_calloc(384 * 288 / 4, 1, MALLOC_CAP_SPIRAM);
    DISPLAY_CLEAR_SCREEN(0);
    DISPLAY_CLEAR_SCREEN(1);

    // Init sync info
    gpio_set_direction(PRIMARY_VSYNC_GPIO, GPIO_MODE_INPUT);
    gpio_set_direction(SECONDARY_VSYNC_GPIO, GPIO_MODE_INPUT);
    display_control_init_sync_info(&primary_sync_info, primary_frame_buffer,
                                   PRIMARY_VSYNC_GPIO, GPIO_INTR_POSEDGE);
    display_control_init_sync_info(&secondary_sync_info, secondary_frame_buffer,
                                   SECONDARY_VSYNC_GPIO, GPIO_INTR_NEGEDGE);

    xTaskCreatePinnedToCore(display_control_polling_task, "display_control_polling_pask",
                            4096, NULL, 10, NULL, 1);
}

uint8_t* display_control_get_primary_frame_buffer()
{
    return primary_frame_buffer;
}

uint8_t* display_control_get_secondary_frame_buffer()
{
    return secondary_frame_buffer;
}

uint8_t* display_control_get_primary_main_buffer()
{
    return primary_main_buffer;
}

uint8_t* display_control_get_secondary_main_buffer()
{
    return secondary_main_buffer;
}

uint8_t* display_control_get_primary_overlay_buffer()
{
    return primary_overlay_buffer;
}

uint8_t* display_control_get_secondary_overlay_buffer()
{
    return secondary_overlay_buffer;
}

void display_control_get_formats(display_format_t *formats)
{
    formats[0] = primary_sync_info.format;
    formats[1] = secondary_sync_info.format;
}

void display_control_record_operate_time()
{
    int64_t current_time = esp_timer_get_time();
    if (!(current_time - last_cancel_start > 0 &&
        last_cancel_start + last_cancel_duration - current_time > 0))
        last_operate_time = current_time - OPERATE_PRE;
}

void display_control_cancel_operate_time(int64_t cancel_duration)
{
    int64_t current_time = esp_timer_get_time();
    last_operate_time = current_time - OPERATE_THRESHOLD - OPERATE_PRE;
    last_cancel_duration = cancel_duration;
    last_cancel_start = current_time;
}

void display_control_operate_hang_request()
{
    xSemaphoreTake(operate_hang_semaphore, portMAX_DELAY);
    operate_hang_count += 1;
    xSemaphoreGive(operate_hang_semaphore);
}

void display_control_operate_hang_release()
{
    xSemaphoreTake(operate_hang_semaphore, portMAX_DELAY);
    if (operate_hang_count > 0)
        operate_hang_count--;
    display_control_record_operate_time();
    xSemaphoreGive(operate_hang_semaphore);
}