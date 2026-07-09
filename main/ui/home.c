#include "ui_common.h"
#include "page.h"
#include "esp_timer.h"
#include "shell.h"
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include "peripherals/lock.h"
#include "protocol/ble.h"
#include "display/graphics.h"
#include "host/ble_gap.h"
#include "peripherals/adc.h"
#include "io/io_extend.h"
#include "peripherals/pwm.h"

typedef struct
{
    ui_page_t base;
    bool show;
    bool battery_query_request;
    bool status_query_request;
    bool time_query_request;
    bool last_power_save_value;
    int last_battery_value;
    bool last_battery_plugged;
    int last_minute;
    int last_hour;
    bool last_valid;
    int64_t last_power_save_query_time;
    bool last_battery_charging;
} ui_home_t;

static void ui_home_on_show(ui_home_t *home)
{
    home->show = true;
    home->battery_query_request = true;
    home->status_query_request = true;
    home->time_query_request = true;
}

static void select_battery_icon(char *battery_icon_char, int value, bool charging, bool plugged,
    display_format_t format, int *actaual_width)
{
    if (!plugged)
    {
        display_get_icon("battery_question", format, false, battery_icon_char, actaual_width);
        return;
    }
    int battery_icon_index = value < 10 ? 0:
                             value < 20 ? 1:
                             value < 40 ? 2:
                             value < 60 ? 3:
                             value < 80 ? 4:
                             value < 90 ? 5:
                             6;
    display_get_icon_indexed(charging ? "charging" : "battery", format, false,
                             battery_icon_index, battery_icon_char, actaual_width);
}

static void ui_home_draw_status_icon(const char *name, display_format_t formats[],
                                     display_orientation_t orientation, int *icon_draw_index)
{
    char icon[60] = { 0 };
    int icon_width;
    display_vector_t icon_coordinate_primary = display_coordinate_compensation(
                                              *icon_draw_index, 12,
                                              formats[0]);
    display_get_icon(name, formats[0], false, icon, &icon_width);
    display_draw_image(0, orientation, icon_coordinate_primary.x + 1,
                       icon_coordinate_primary.y + 1, icon, icon_width, DISPLAY_COLOR_BLACK);
    display_draw_image(0, orientation, icon_coordinate_primary.x,
                       icon_coordinate_primary.y, icon, icon_width, DISPLAY_COLOR_WHITE);
    if(orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
    {
        display_vector_t icon_coordinate_secondary = display_coordinate_compensation(
                                              *icon_draw_index, 12,
                                              formats[1]);
        display_get_icon(name, formats[1], false, icon, &icon_width);
        display_draw_image(1, orientation, icon_coordinate_secondary.x + 1,
                           icon_coordinate_secondary.y + 1, icon, icon_width, DISPLAY_COLOR_BLACK);
        display_draw_image(1, orientation, icon_coordinate_secondary.x,
                           icon_coordinate_secondary.y, icon, icon_width, DISPLAY_COLOR_WHITE);
    }
    *icon_draw_index += 24;
}

static void ui_home_on_draw(ui_home_t *home, display_format_t *formats, display_orientation_t orientation)
{
    int logical_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                        DISPLAY_WIDTH_PAL : DISPLAY_HEIGHT_PAL;
    if(home->show)
    {
        DISPLAY_CLEAR_SCREEN(0);
        DISPLAY_CLEAR_SCREEN(1);
        home->show = false;
    }

    display_vector_t icon_draw_origin = {
        .x = 16, .y = 14
    };
    display_vector_t icon_draw_origin_primary = display_vector_compensation(
        &icon_draw_origin, formats[0]
    );
    display_vector_t icon_draw_origin_secondary = display_vector_compensation(
        &icon_draw_origin, formats[1]
    );
    display_rect_t total_rect_primary = {
        .x = icon_draw_origin_primary.x, .y = icon_draw_origin_primary.y,
        .width = 0, .height = 0
    };
    display_rect_t total_rect_secondary = {
        .x = icon_draw_origin_secondary.x, .y = icon_draw_origin_secondary.y,
        .width = 0, .height = 0
    };

    if (io_extend_is_time_valid() && home->time_query_request)
    {
        char time_char[6];
        time_t current_time = time(NULL);
        struct tm *time_val = localtime(&current_time);
        display_vector_t text_coordinate_primary = display_vector_compensation(
                         &icon_draw_origin, formats[0]);
        display_vector_t text_coordinate_secondary = display_vector_compensation(
                         &icon_draw_origin, formats[1]);
        sprintf(time_char, "%d:%02d", time_val->tm_hour, time_val->tm_min);
        int time_length;
        display_vector_t std_size, primary_size, secondary_size;
        free(font_measure_text(
            time_char, DISPLAY_FORMAT_PAL, 0, &time_length, &std_size));
        text_position_descriptor_t *primary_descriptor = font_measure_text(
            time_char, formats[0], 0, NULL, &primary_size);
        text_position_descriptor_t *secondary_descriptor = font_measure_text(
            time_char, formats[1], 0, NULL, &secondary_size);

        display_rect_t time_rect = {
            .x = icon_draw_origin.x - 4, .y = 12, .width = std_size.x + 8, .height = 24
        };
        display_rect_t time_rect_primary = display_rect_compensation(&time_rect, formats[0]);
        display_rect_t time_rect_secondary = display_rect_compensation(&time_rect, formats[1]);
        display_fill_rect(0, orientation, &time_rect_primary, DISPLAY_COLOR_TRANSPARENT);
        display_fill_rect(1, orientation, &time_rect_secondary, DISPLAY_COLOR_TRANSPARENT);

        display_draw_text(0, orientation, text_coordinate_primary.x + 1,
            text_coordinate_primary.y + 1, primary_descriptor, time_length,
            DISPLAY_COLOR_BLACK, formats[0]);
        display_draw_text(0, orientation, text_coordinate_primary.x,
            text_coordinate_primary.y, primary_descriptor, time_length,
            DISPLAY_COLOR_WHITE, formats[0]);

        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_text(1, orientation, text_coordinate_secondary.x + 1,
                text_coordinate_secondary.y + 1, secondary_descriptor, time_length,
                DISPLAY_COLOR_BLACK, formats[1]);
            display_draw_text(1, orientation, text_coordinate_secondary.x,
                text_coordinate_secondary.y, secondary_descriptor, time_length,
                DISPLAY_COLOR_WHITE, formats[1]);
        }

        display_rect_union(&total_rect_primary, &time_rect_primary);
        display_rect_union(&total_rect_secondary, &time_rect_secondary);
        icon_draw_origin.x += std_size.x + 4;
        free(primary_descriptor);
        free(secondary_descriptor);
    }

    if(home->status_query_request || home->time_query_request)
    {
        int update_width = home->last_valid ? 150 : 180;
        // Draw time
        display_vector_t icon_coordinate_primary = display_vector_compensation(
                                                   &icon_draw_origin, formats[0]);
        display_vector_t icon_coordinate_secondary = display_vector_compensation(
                                                     &icon_draw_origin, formats[1]);
        display_vector_t update_size_primary = display_coordinate_compensation(update_width, 24,
                                               formats[0]);
        display_vector_t update_size_secondary = display_coordinate_compensation(update_width, 24,
                                                 formats[0]);
        // Draw icon
        display_rect_t update_rect_primary = {
            .x = icon_coordinate_primary.x, .width = update_size_primary.x + 1,
            .y = icon_coordinate_primary.y, .height = update_size_primary.y + 1
        };
        display_rect_t update_rect_secondary = {
            .x = icon_coordinate_secondary.x, .width = update_size_secondary.x + 1,
            .y = icon_coordinate_secondary.y, .height = update_size_secondary.y + 1
        };
        display_fill_rect(0, orientation, &update_rect_primary, DISPLAY_COLOR_TRANSPARENT);
        display_fill_rect(1, orientation, &update_rect_secondary, DISPLAY_COLOR_TRANSPARENT);

        if (home->last_power_save_value)
        {
            ui_home_draw_status_icon("power_save", formats, orientation, &icon_draw_origin.x);
        }
        if (protocol_ble_is_device_connected())
        {
            ui_home_draw_status_icon("bluetooth", formats, orientation, &icon_draw_origin.x);
        }
        if (ble_gap_adv_active())
        {
            ui_home_draw_status_icon("advertise", formats, orientation, &icon_draw_origin.x);
        }
        if (pwm_device_get_fan_level())
        {
            ui_home_draw_status_icon("fan", formats, orientation, &icon_draw_origin.x);
        }
        if (pwm_device_get_eye_level())
        {
            ui_home_draw_status_icon("eye", formats, orientation, &icon_draw_origin.x);
        }
        if (lock_get_state())
        {
            ui_home_draw_status_icon("lock", formats, orientation, &icon_draw_origin.x);
        }

        display_rect_union(&total_rect_primary, &update_rect_primary);
        display_rect_union(&total_rect_secondary, &update_rect_secondary);
        home->status_query_request = false;
        home->time_query_request = false;
    }

    if(home->battery_query_request)
    {
        char battery_value[10];
        sprintf(battery_value, "%d%%", home->last_battery_value);
        int icon_height_primary = display_coordinate_compensation(0, 24, formats[0]).y;
        int icon_height_secondary = display_coordinate_compensation(0, 24, formats[0]).y;
        // Draw battery icon and text
        display_vector_t icon_coordinate_primary = display_coordinate_compensation(
                                                   logical_width - 78, icon_draw_origin.y - 2,

                                                  formats[0]);
        display_vector_t icon_coordinate_secondary = display_coordinate_compensation(
                                                     logical_width - 78, icon_draw_origin.y - 2,
                                                     formats[1]);
        char battery_icon_primary[60];
        char battery_icon_secondary[60];
        int battery_icon_width_primary, battery_icon_width_secondary;
        select_battery_icon(battery_icon_primary, home->last_battery_value,
            home->last_battery_charging, home->last_battery_plugged, formats[0], &battery_icon_width_primary);
        select_battery_icon(battery_icon_secondary, home->last_battery_value,
            home->last_battery_charging, home->last_battery_plugged, formats[1], &battery_icon_width_secondary);

        int text_length;
        display_vector_t text_size_primary, text_size_secondary;
        text_position_descriptor_t *descriptor_primary = font_measure_text(battery_value,
                                   formats[0], 0, &text_length,
                                   &text_size_primary);
        text_position_descriptor_t *descriptor_secondary = font_measure_text(battery_value,
                                   formats[1], 0, &text_length,
                                   &text_size_secondary);

        display_rect_t battery_rect_primary = {
            .x = icon_coordinate_primary.x,
            .y = icon_coordinate_primary.y,
            .width = battery_icon_width_primary + text_size_primary.x + 20,
            .height = icon_height_primary + 1
        };
        display_rect_t battery_rect_secondary = {
            .x = icon_coordinate_secondary.x,
            .y = icon_coordinate_secondary.y,
            .width = battery_icon_width_secondary + text_size_secondary.x + 20,
            .height = icon_height_secondary + 1
        };
        display_fill_rect(0, orientation, &battery_rect_primary, DISPLAY_COLOR_TRANSPARENT);
        display_fill_rect(1, orientation, &battery_rect_secondary, DISPLAY_COLOR_TRANSPARENT);

        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_image(0, orientation, icon_coordinate_primary.x + 1,
                               icon_coordinate_primary.y + 1, battery_icon_primary,
                               battery_icon_width_primary, DISPLAY_COLOR_BLACK);
            display_draw_image(0, orientation, icon_coordinate_primary.x,
                               icon_coordinate_primary.y, battery_icon_primary,
                               battery_icon_width_primary, DISPLAY_COLOR_WHITE);
        }
        display_draw_image(1, orientation, icon_coordinate_secondary.x + 1,
                           icon_coordinate_secondary.y + 1, battery_icon_secondary,
                           battery_icon_width_secondary, DISPLAY_COLOR_BLACK);
        display_draw_image(1, orientation, icon_coordinate_secondary.x,
                           icon_coordinate_secondary.y, battery_icon_secondary,
                           battery_icon_width_secondary, DISPLAY_COLOR_WHITE);

        display_vector_t text_coordinate_primary = display_coordinate_compensation(
                                                  logical_width - 52, icon_draw_origin.y, formats[0]);
        display_vector_t text_coordinate_secondary = display_coordinate_compensation(
                                                    logical_width - 52, icon_draw_origin.y, formats[1]);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_text(0, orientation, text_coordinate_primary.x + 1,
                              text_coordinate_primary.y + 1, descriptor_primary, text_length,
                              DISPLAY_COLOR_BLACK, formats[0]);
            display_draw_text(0, orientation, text_coordinate_primary.x,
                              text_coordinate_primary.y, descriptor_primary, text_length,
                              DISPLAY_COLOR_WHITE, formats[0]);
        }
        display_draw_text(1, orientation, text_coordinate_secondary.x + 1,
                          text_coordinate_secondary.y + 1, descriptor_secondary, text_length,
                          DISPLAY_COLOR_BLACK, formats[1]);
        display_draw_text(1, orientation, text_coordinate_secondary.x,
                          text_coordinate_secondary.y, descriptor_secondary, text_length,
                          DISPLAY_COLOR_WHITE, formats[1]);

        display_rect_union(&total_rect_primary, &battery_rect_primary);
        display_rect_union(&total_rect_secondary, &battery_rect_secondary);
        free(descriptor_primary);
        free(descriptor_secondary);
        home->battery_query_request = false;
    }
    display_update(0, orientation, &total_rect_primary);
    display_update(1, orientation, &total_rect_secondary);
}

static void ui_home_on_key_event(ui_home_t *home, int key_code)
{
    if(key_code == UI_KEY_CODE_MENU)
    {
        ui_page_t *menu_page = ui_shell_find_page(home->base.parent, UI_PAGE_TYPE_MENU);
        if(menu_page != NULL)
            ui_shell_show_page(home->base.parent, menu_page);
    }
}

static void ui_home_on_mainloop(ui_home_t *home, bool on_foreground)
{
    int64_t current_time = esp_timer_get_time();
    if(current_time - home->last_power_save_query_time >= 1000000)
    {
        home->last_power_save_query_time = current_time;
        bool new_power_save_value = adc_monitor_read_ir();
        if(new_power_save_value != home->last_power_save_value)
        {
            home->last_power_save_value = new_power_save_value;
            home->status_query_request = true;
        }
        int battery_value;
        bool charging;
        bool plugged;
        adc_monitor_read_battery(&battery_value, &charging, &plugged);
        if (charging != home->last_battery_charging || battery_value != home->last_battery_value ||
            plugged != home->last_battery_plugged)
        {
            home->last_battery_charging = charging;
            home->last_battery_value = battery_value;
            home->last_battery_plugged = plugged;
            home->battery_query_request = true;
        }
        time_t current_time = time(NULL);
        struct tm *time_val = localtime(&current_time);
        if (time_val->tm_min != home->last_minute || home->status_query_request ||
            home->last_valid != io_extend_is_time_valid())
        {
            if (time_val->tm_hour < home->last_hour ||
                time_val->tm_hour >= 10 && home->last_hour < 10)
                home->status_query_request = true;
            home->last_minute = time_val->tm_min;
            home->last_hour = time_val->tm_hour;
            home->time_query_request = true;
            home->last_valid = io_extend_is_time_valid();
        }
    }
}

static void _ui_home_request_update_priv(ui_page_t *page)
{
    if(page->type != UI_PAGE_TYPE_HOME) return;
    ui_home_t *home = (ui_home_t*)page;
    home->status_query_request = true;
    home->time_query_request = true;
    home->last_power_save_value = adc_monitor_read_ir();
    int64_t current_time = esp_timer_get_time();
    home->last_power_save_query_time = current_time;
}

void ui_home_update_from_shell(ui_shell_t *shell)
{
    ui_page_t *current_page = ui_shell_get_current_page(shell);
    if(current_page == NULL) return;
    if(current_page->type == UI_PAGE_TYPE_HOME)
    {
        _ui_home_request_update_priv(current_page);
    }
}

ui_page_t *ui_home_create()
{
    ui_home_t *home = (ui_home_t*)calloc(1, sizeof(ui_home_t));
    home->base.type = UI_PAGE_TYPE_HOME;
    home->base.on_show = (ui_page_event_t)ui_home_on_show;
    home->base.on_draw = (ui_page_draw_event_t)ui_home_on_draw;
    home->base.on_key_event = (ui_page_key_event_t)ui_home_on_key_event;
    home->base.on_mainloop = (ui_page_mainloop_event_t)ui_home_on_mainloop;
    home->base.on_format_changed = (ui_page_event_t)ui_home_on_show;
    home->battery_query_request = true;
    home->status_query_request = true;
    home->time_query_request = true;
    home->last_power_save_value = false;
    home->last_battery_charging = false;
    home->last_battery_plugged = false;
    home->last_valid = false;
    return (ui_page_t*)home;
}
