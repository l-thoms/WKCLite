#include <string.h>
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "ui_common.h"
#include "page.h"
#include "shell.h"
#include "math.h"
#include "profile/translations.h"
#include "peripherals/lock.h"
#include "peripherals/pwm.h"
#include "io/io_extend.h"
#include "esp_log.h"
#include "jpeg_decoder.h"
#include "io/filesystem.h"
#include "camera.h"
#include "files.h"

typedef struct
{
    ui_page_t base;
    int selected_index;
    int last_selected_index;
    bool draw_request;
    bool brightness_tweak;
    int horizontal_mirror_count;
} ui_menu_t;

static void ui_menu_on_show(ui_menu_t *menu)
{
    menu->selected_index = 0;
    menu->last_selected_index= -1;
    menu->draw_request = true;
    menu->brightness_tweak = false;
}

static void ui_menu_draw_item(ui_menu_t *menu, int item_index, bool highlight,
                       display_format_t formats[], display_orientation_t orientation)
{
    if(item_index < 0 || item_index >= 8) return;
    char text[50] = { 0 };
    char image_name[20] = { 0 };
    switch (item_index)
    {
    case 0:
        strcpy(text, wkc_translations_get_string("menu_device_info"));
        strcpy(image_name, "info");
        break;
    case 1:
        strcpy(text, wkc_translations_get_string("menu_settings"));
        strcpy(image_name, "settings");
        break;
    case 2:
        strcpy(text, wkc_translations_get_string("menu_camera"));
        strcpy(image_name, "camera");
        break;
    case 3:
        strcpy(text, wkc_translations_get_string("menu_files"));
        strcpy(image_name, "folder");
        break;
    case 4:
        strcpy(text, menu->brightness_tweak ?
                     wkc_translations_get_string("menu_tweaking") :
                     wkc_translations_get_string("menu_brightness"));
        strcpy(image_name, "brightness");
        break;
    case 5:
        int fan_level = pwm_device_get_fan_level();
        if (!fan_level)
        {
            sprintf(text, "%s: %s",
                wkc_translations_get_string("menu_fan"),
                wkc_translations_get_string("menu_off"));
            strcpy(image_name, "fan_disabled");
        }
        else
        {
            sprintf(text, "%s: %d", wkc_translations_get_string("menu_fan"), fan_level);
            strcpy(image_name, "fan");
        }
        break;
    case 6:
        int eye_level = pwm_device_get_eye_level();
        if (!eye_level)
        {
            sprintf(text, "%s: %s",
                wkc_translations_get_string("menu_eye"),
                wkc_translations_get_string("menu_off"));
            strcpy(image_name, "eye_disabled");
        }
        else
        {
            sprintf(text, "%s: %d", wkc_translations_get_string("menu_eye"), eye_level);
            strcpy(image_name, "eye");
        }
        break;
    case 7:
        if(lock_get_state())
        {
            strcpy(text, wkc_translations_get_string("menu_locked"));
            strcpy(image_name, "lock");
        }
        else
        {
            strcpy(text, wkc_translations_get_string("menu_unlocked"));
            strcpy(image_name, "unlock");
        }
        break;

    default:
        break;
    }
    char image_path_primary[60] = { 0 };
    char image_path_secondary[60] = { 0 };
    int image_width_primary, image_width_secondary;
    int text_length;
    display_vector_t text_size_primary, text_size_secondary;
    text_position_descriptor_t *descriptor_primary = font_measure_text(text, formats[0], 0,
                                                     &text_length, &text_size_primary);
    text_position_descriptor_t *descriptor_secondary = font_measure_text(text, formats[1], 0,
                                                     &text_length, &text_size_secondary);
    display_rect_t border_rect_primary, border_rect_secondary;
    if(orientation == DISPLAY_ORIENTATION_HORIZONTAL)
    {
        display_get_icon(image_name, formats[0], true,
                         image_path_primary, &image_width_primary);
        display_get_icon(image_name, formats[1], true,
                         image_path_secondary, &image_width_secondary);
        int origin_center_x = DISPLAY_WIDTH_PAL / 2 + (int)((item_index % 4 - 1.5f) * 68 + 0.5f);
        int origin_center_y = DISPLAY_HEIGHT_PAL / 2 + (int)(item_index / 4) * 84 - 42;
        int image_origin_x = origin_center_x - 24;
        int border_origin_x = origin_center_x - 32;

        int origin_center_primary = display_coordinate_compensation(origin_center_x, 0, formats[0]).x;
        int origin_center_secondary = display_coordinate_compensation(origin_center_x, 0, formats[1]).x;

        int text_origin_x_primary = origin_center_primary - text_size_primary.x / 2;
        int text_origin_x_secondary = origin_center_secondary - text_size_secondary.x / 2;
        int text_origin_y_primary = display_coordinate_compensation(0, origin_center_y + 16, formats[0]).y;
        int text_origin_y_secondary = display_coordinate_compensation(0, origin_center_y + 16, formats[1]).y;
        display_rect_t border_rect = {
            .x = border_origin_x, .width = 64, .y = origin_center_y - 40, .height = 80
        };
        border_rect_primary = display_rect_compensation(&border_rect, formats[0]);
        border_rect_secondary = display_rect_compensation(&border_rect, formats[1]);
        display_vector_t image_origin_primary = display_coordinate_compensation(image_origin_x,
                                                origin_center_y - 36, formats[0]);
        display_vector_t image_origin_secondary = display_coordinate_compensation(image_origin_x,
                                                  origin_center_y - 36, formats[1]);

        if(highlight)
        {
            display_rect_translate(&border_rect_primary, 1, 1);
            display_rect_translate(&border_rect_secondary, 1, 1);
            display_fill_rounded_rect(0, DISPLAY_ORIENTATION_HORIZONTAL, &border_rect_primary,
                              DISPLAY_COLOR_BLACK, 3);
            display_fill_rounded_rect(1, DISPLAY_ORIENTATION_HORIZONTAL, &border_rect_secondary,
                              DISPLAY_COLOR_BLACK, 3);
            display_rect_translate(&border_rect_primary, -1, -1);
            display_rect_translate(&border_rect_secondary, -1, -1);
            display_fill_rounded_rect(0, DISPLAY_ORIENTATION_HORIZONTAL, &border_rect_primary,
                              DISPLAY_COLOR_WHITE, 3);
            display_fill_rounded_rect(1, DISPLAY_ORIENTATION_HORIZONTAL, &border_rect_secondary,
                              DISPLAY_COLOR_WHITE, 3);
            display_draw_image(0, DISPLAY_ORIENTATION_HORIZONTAL, image_origin_primary.x,
                               image_origin_primary.y, image_path_primary, image_width_primary,
                               DISPLAY_COLOR_BLACK);
            display_draw_image(1, DISPLAY_ORIENTATION_HORIZONTAL, image_origin_secondary.x,
                               image_origin_secondary.y, image_path_secondary, image_width_secondary,
                               DISPLAY_COLOR_BLACK);
            display_draw_text(0, DISPLAY_ORIENTATION_HORIZONTAL, text_origin_x_primary,
                              text_origin_y_primary, descriptor_primary, text_length,
                              DISPLAY_COLOR_BLACK, formats[0]);
            display_draw_text(1, DISPLAY_ORIENTATION_HORIZONTAL, text_origin_x_secondary,
                              text_origin_y_secondary, descriptor_secondary, text_length,
                              DISPLAY_COLOR_BLACK, formats[1]);
        }
        else
        {
            display_rect_expand(&border_rect_primary, 1, 1);
            display_rect_expand(&border_rect_secondary, 1, 1);
            display_fill_rect(0, DISPLAY_ORIENTATION_HORIZONTAL, &border_rect_primary,
                              DISPLAY_COLOR_TRANSPARENT);
            display_fill_rect(1, DISPLAY_ORIENTATION_HORIZONTAL, &border_rect_secondary,
                              DISPLAY_COLOR_TRANSPARENT);
            display_rect_expand(&border_rect_primary, -1, -1);
            display_rect_expand(&border_rect_secondary, -1, -1);
            display_draw_image(0, DISPLAY_ORIENTATION_HORIZONTAL, image_origin_primary.x + 1,
                               image_origin_primary.y + 1, image_path_primary, image_width_primary,
                               DISPLAY_COLOR_BLACK);
            display_draw_image(0, DISPLAY_ORIENTATION_HORIZONTAL, image_origin_primary.x,
                               image_origin_primary.y, image_path_primary, image_width_primary,
                               DISPLAY_COLOR_WHITE);
            display_draw_image(1, DISPLAY_ORIENTATION_HORIZONTAL, image_origin_secondary.x + 1,
                               image_origin_secondary.y + 1, image_path_secondary,
                               image_width_secondary, DISPLAY_COLOR_BLACK);
            display_draw_image(1, DISPLAY_ORIENTATION_HORIZONTAL, image_origin_secondary.x,
                               image_origin_secondary.y, image_path_secondary,
                               image_width_secondary, DISPLAY_COLOR_WHITE);

            display_draw_text(0, DISPLAY_ORIENTATION_HORIZONTAL, text_origin_x_primary + 1,
                              text_origin_y_primary + 1, descriptor_primary, text_length,
                              DISPLAY_COLOR_BLACK, formats[0]);
            display_draw_text(0, DISPLAY_ORIENTATION_HORIZONTAL, text_origin_x_primary,
                              text_origin_y_primary, descriptor_primary, text_length,
                              DISPLAY_COLOR_WHITE, formats[0]);
            display_draw_text(1, DISPLAY_ORIENTATION_HORIZONTAL, text_origin_x_secondary + 1,
                              text_origin_y_secondary + 1, descriptor_secondary, text_length,
                              DISPLAY_COLOR_BLACK, formats[1]);
            display_draw_text(1, DISPLAY_ORIENTATION_HORIZONTAL, text_origin_x_secondary,
                              text_origin_y_secondary, descriptor_secondary, text_length,
                              DISPLAY_COLOR_WHITE, formats[1]);
        }
    }
    else
    {
        display_get_icon(image_name, formats[0], false,
                         image_path_primary, &image_width_primary);
        display_get_icon(image_name, formats[1], false,
                         image_path_secondary, &image_width_secondary);
        int item_height = 28;
        int origin_start_x = DISPLAY_HEIGHT_PAL / 2 - 90;
        int origin_start_y = DISPLAY_WIDTH_PAL / 2 + item_height * (item_index - 4);
        display_rect_t border_rect = {
            .x = origin_start_x, .y = origin_start_y, .width = 180, .height = item_height
        };
        if (highlight)
        {
            display_rect_expand(&border_rect, -2, -2);
            border_rect_primary = display_rect_compensation(
                &border_rect, formats[0]
            );
            border_rect_secondary = display_rect_compensation(
                &border_rect, formats[1]
            );
            display_rect_translate(&border_rect_primary, 1, 1);
            display_rect_translate(&border_rect_secondary, 1, 1);
            display_fill_rounded_rect(0, orientation, &border_rect_primary,
                                      DISPLAY_COLOR_BLACK, 2);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(1, orientation, &border_rect_secondary,
                                          DISPLAY_COLOR_BLACK, 2);
            display_rect_translate(&border_rect_primary, -1, -1);
            display_rect_translate(&border_rect_secondary, -1, -1);
            display_fill_rounded_rect(0, orientation, &border_rect_primary,
                                      DISPLAY_COLOR_WHITE, 2);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(1, orientation, &border_rect_secondary,
                                          DISPLAY_COLOR_WHITE, 2);
        }
        else
        {
            border_rect_primary = display_rect_compensation(
                &border_rect, formats[0]
            );
            border_rect_secondary = display_rect_compensation(
                &border_rect, formats[1]
            );
            display_fill_rect(0, orientation, &border_rect_primary, DISPLAY_COLOR_TRANSPARENT);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rect(1, orientation, &border_rect_secondary, DISPLAY_COLOR_TRANSPARENT);
        }
        origin_start_x += 2;
        origin_start_y += 2;
        display_vector_t origin_primary = display_coordinate_compensation(origin_start_x,
                                          origin_start_y, formats[0]);
        display_vector_t origin_secondary = display_coordinate_compensation(origin_start_x,
                                            origin_start_y, formats[1]);
        if (!highlight)
        {
            display_vector_translate(&origin_primary, 1, 1);
            display_vector_translate(&origin_secondary, 1, 1);
            display_draw_image(0, orientation, origin_primary.x, origin_primary.y,
                image_path_primary, image_width_primary, DISPLAY_COLOR_BLACK);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_draw_image(1, orientation, origin_secondary.x, origin_secondary.y,
                    image_path_secondary, image_width_secondary, DISPLAY_COLOR_BLACK);
            display_vector_translate(&origin_primary, -1, -1);
            display_vector_translate(&origin_secondary, -1, -1);
        }
        display_draw_image(0, orientation, origin_primary.x, origin_primary.y,
            image_path_primary, image_width_primary, highlight ? DISPLAY_COLOR_BLACK :
            DISPLAY_COLOR_WHITE);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_image(1, orientation, origin_secondary.x, origin_secondary.y,
                image_path_secondary, image_width_secondary, highlight ? DISPLAY_COLOR_BLACK :
                DISPLAY_COLOR_WHITE);
        origin_start_x += 28;
        origin_start_y += 2;
        origin_primary = display_coordinate_compensation(origin_start_x,
                         origin_start_y, formats[0]);
        origin_secondary = display_coordinate_compensation(origin_start_x,
                           origin_start_y, formats[1]);
        if (!highlight)
        {
            display_vector_translate(&origin_primary, 1, 1);
            display_vector_translate(&origin_secondary, 1, 1);
            display_draw_text(0, orientation, origin_primary.x, origin_primary.y,
                descriptor_primary, text_length, DISPLAY_COLOR_BLACK, formats[0]);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_draw_text(1, orientation, origin_secondary.x, origin_secondary.y,
                    descriptor_secondary, text_length, DISPLAY_COLOR_BLACK, formats[1]);
            display_vector_translate(&origin_primary, -1, -1);
            display_vector_translate(&origin_secondary, -1, -1);
        }
        display_draw_text(0, orientation, origin_primary.x, origin_primary.y,
            descriptor_primary, text_length, highlight ? DISPLAY_COLOR_BLACK :
            DISPLAY_COLOR_WHITE, formats[0]);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_text(1, orientation, origin_secondary.x, origin_secondary.y,
                descriptor_secondary, text_length, highlight ? DISPLAY_COLOR_BLACK :
                DISPLAY_COLOR_WHITE, formats[1]);
    }
    display_rect_expand(&border_rect_primary, 1, 1);
    display_rect_expand(&border_rect_secondary, 1, 1);
    display_update(0, orientation, &border_rect_primary);
    display_update(1, orientation, &border_rect_secondary);

    free(descriptor_primary);
    free(descriptor_secondary);
}

static void ui_menu_on_draw(ui_menu_t *menu, display_format_t *formats, display_orientation_t orientation)
{
    if(!menu->draw_request) return;
    if(menu->last_selected_index == -1) // Draw whole page
    {
        DISPLAY_CLEAR_SCREEN(0);
        DISPLAY_CLEAR_SCREEN(1);
        ui_shell_show_toast(menu->base.parent, NULL, 0);
        display_rect_t menu_border_rect;
        if (orientation == DISPLAY_ORIENTATION_HORIZONTAL)
            menu_border_rect = (display_rect_t) {
                .x = DISPLAY_WIDTH_PAL / 2 - 144, .width = 288,
                .y = DISPLAY_HEIGHT_PAL / 2 - 90, .height = 180
            };
        else
            menu_border_rect = (display_rect_t) {
                .x = DISPLAY_HEIGHT_PAL / 2 - 96, .width = 192,
                .y = DISPLAY_WIDTH_PAL / 2 - 118, .height = 236
            };
        display_rect_t menu_border_rect_primary = display_rect_compensation(&menu_border_rect,
                                                  formats[0]);
        display_rect_t menu_border_rect_secondary = display_rect_compensation(&menu_border_rect,
                                                    formats[1]);

        display_rect_translate(&menu_border_rect_primary, 1, 1);
        display_rect_translate(&menu_border_rect_secondary, 1, 1);
        display_draw_rounded_rect(0, orientation, &menu_border_rect_primary,
                                  DISPLAY_COLOR_BLACK, 8, 2);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_rounded_rect(1, orientation, &menu_border_rect_secondary,
                                      DISPLAY_COLOR_BLACK, 8, 2);

        display_rect_translate(&menu_border_rect_primary, -1, -1);
        display_rect_translate(&menu_border_rect_secondary, -1, -1);
        display_draw_rounded_rect(0, orientation, &menu_border_rect_primary,
                                  DISPLAY_COLOR_WHITE, 8, 2);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_rounded_rect(1, orientation, &menu_border_rect_secondary,
                                      DISPLAY_COLOR_WHITE, 8, 2);
        display_rect_expand(&menu_border_rect_primary, 2, 2);
        display_rect_expand(&menu_border_rect_secondary, 2, 2);
        display_update(0, orientation, &menu_border_rect_primary);
        display_update(1, orientation, &menu_border_rect_secondary);
        for(int i = 0; i < 8; i++)
        {
            ui_menu_draw_item(menu, i, i == menu->selected_index, formats, orientation);
        }
    }
    else
    {
        if(menu->last_selected_index != menu->selected_index)
        {
            ui_menu_draw_item(menu, menu->last_selected_index, false, formats, orientation);
        }
        ui_menu_draw_item(menu, menu->selected_index, true, formats, orientation);
    }
    menu->last_selected_index = menu->selected_index;
    if(menu->draw_request) menu->draw_request = false;
}

static void ui_menu_on_key_event(ui_menu_t *menu, int key_code)
{
    display_orientation_t orientation = ui_shell_get_orientation(menu->base.parent);
    if(menu->brightness_tweak) switch (key_code)
    {
        case UI_KEY_CODE_UP:
        case UI_KEY_CODE_RIGHT:
            gpio_write(GPIO_NUM_EXTEND | 17, 1);
            break;
        case UI_KEY_CODE_DOWN:
        case UI_KEY_CODE_LEFT:
            gpio_write(GPIO_NUM_EXTEND | 16, 1);
            break;
        case UI_KEY_CODE_EXIT:
            menu->brightness_tweak = false;
            menu->draw_request = true;
            break;
        case UI_KEY_CODE_MENU:
            if (++menu->horizontal_mirror_count == 10)
                gpio_write(GPIO_NUM_EXTEND | 20, 1);
            break;
    }
    else switch (key_code)
    {
        case UI_KEY_CODE_LEFT:
        {
            if (orientation == DISPLAY_ORIENTATION_HORIZONTAL)
            {
                menu->selected_index += 7;
                menu->selected_index %= 8;
                menu->draw_request = true;
            }
        }
        break;
        case UI_KEY_CODE_RIGHT:
        {
            if (orientation == DISPLAY_ORIENTATION_HORIZONTAL)
            {
                menu->selected_index += 1;
                menu->selected_index %= 8;
                menu->draw_request = true;
            }
        }
        break;
        case UI_KEY_CODE_DOWN:
        case UI_KEY_CODE_UP:
        {
            if (orientation == DISPLAY_ORIENTATION_HORIZONTAL)
            {
                menu->selected_index += 4;
                menu->selected_index %= 8;
                menu->draw_request = true;
            }
            else if (key_code == UI_KEY_CODE_UP)
            {
                menu->selected_index += 7;
                menu->selected_index %= 8;
                menu->draw_request = true;
            }
            else
            {
                menu->selected_index += 1;
                menu->selected_index %= 8;
                menu->draw_request = true;
            }
        }
        break;
        case UI_KEY_CODE_EXIT:
        {
            ui_page_t *home = ui_shell_find_page(menu->base.parent, UI_PAGE_TYPE_HOME);
            ui_shell_show_page(menu->base.parent, home);
        }
        break;
        case UI_KEY_CODE_OK:
        {
            if(menu->selected_index == 0)
            {
                ui_page_t *device_info = ui_shell_find_page(menu->base.parent, UI_PAGE_TYPE_DEVICE_INFO);
                if(device_info != NULL)
                    ui_shell_show_page(menu->base.parent, device_info);
            }
            else if (menu->selected_index == 1)
            {
                ui_page_t *settings = ui_shell_find_page(menu->base.parent, UI_PAGE_TYPE_SETTINGS);
                if (settings != NULL)
                    ui_shell_show_page(menu->base.parent, settings);
            }
            else if (menu->selected_index == 2)
            {
                ui_camera_show(menu->base.parent);
            }
            else if (menu->selected_index == 3)
            {
                ui_files_show(menu->base.parent, false);
            }
            else if (menu->selected_index == 4)
            {
                menu->brightness_tweak = true;
                menu->horizontal_mirror_count = 0;
                menu->draw_request = true;
            }
            else if (menu->selected_index == 5)
            {
                pwm_device_toggle_fan();
                menu->draw_request = true;
            }
            else if (menu->selected_index == 6)
            {
                pwm_device_toggle_eye();
                menu->draw_request = true;
            }
            else if(menu->selected_index == 7)
            {
                int lock_result = lock_set(!lock_get_state(), false);
                if (lock_result)
                    ui_shell_show_toast(menu->base.parent, lock_result_to_char(lock_result), 5);
                else
                    menu->draw_request = true;
            }
        }
        break;
        default:
            break;
    }
}

static void ui_menu_on_format_changed(ui_menu_t *menu)
{
    menu->last_selected_index= -1;
    menu->draw_request = true;
}

ui_page_t *ui_menu_create()
{
    ui_menu_t *menu = (ui_menu_t*)calloc(1, sizeof(ui_menu_t));
    menu->base.type = UI_PAGE_TYPE_MENU;
    menu->base.on_show = (ui_page_event_t)ui_menu_on_show;
    menu->base.on_draw = (ui_page_draw_event_t)ui_menu_on_draw;
    menu->base.on_key_event = (ui_page_key_event_t)ui_menu_on_key_event;
    menu->base.on_format_changed = (ui_page_event_t)ui_menu_on_format_changed;
    menu->base.on_mainloop = NULL;
    menu->selected_index = 0;
    menu->last_selected_index = -1;
    return (ui_page_t*)menu;
}

void ui_menu_update_from_shell(ui_shell_t *shell)
{
    if (!shell) return;
    ui_page_t *page = ui_shell_find_page(shell, UI_PAGE_TYPE_MENU);
    if (!page) return;
    ui_menu_t *menu = (ui_menu_t*)page;
    menu->draw_request = true;
}