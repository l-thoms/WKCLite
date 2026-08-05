#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include "esp_system.h"
#include "protocol/ble.h"
#include "display/graphics.h"
#include "display/display_control.h"
#include "ui_common.h"
#include "camera/camera_control.h"
#include "shell.h"
#include "math.h"
#include "profile/translations.h"
#include "profile/settings.h"
#include "profile/userprofile.h"

typedef enum
{
    UI_SETTINGS_MAIN,
    UI_SETTINGS_DISPLAY,
    UI_SETTINGS_DISPLAY_POSITION,
    UI_SETTINGS_MISC,
    UI_SETTINGS_ADVANCED,
    UI_SETTINGS_ADVANCED_CONFIRM
} ui_settings_menu_state_t;

// For render only, events are implemented in key_event

typedef struct
{
    ui_page_t base;
    bool show;
    bool draw_request;
    ui_settings_menu_state_t menu_state;
    int selected_index[10];
    int last_selected_index;
    int hirerachy_index;
} ui_settings_t;


static void ui_settings_on_show(ui_settings_t *settings)
{
    settings->show = true;
    settings->draw_request = true;
    settings->hirerachy_index = 0;
    settings->last_selected_index = 0;
    settings->selected_index[0] = 0;
    settings->menu_state = UI_SETTINGS_MAIN;
}

static void ui_settings_draw_display_position(int index, display_format_t formats[],
                                              display_orientation_t orientation, int output_timing)
{
    char tip_message_upper[100];
    char tip_message_lower[100];
    int logical_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_WIDTH_PAL :
                        DISPLAY_HEIGHT_PAL;
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_HEIGHT_PAL :
                         DISPLAY_WIDTH_PAL;
    switch (index)
    {
        case 0:
        {
            strcpy(tip_message_upper,
                wkc_translations_get_string("settings_adjusting_screen1_position"));
            strcpy(tip_message_lower,
                wkc_translations_get_string("settings_adjusting_screen1_position_next"));
        }
        break;
        case 1:
        {
            strcpy(tip_message_upper,
                wkc_translations_get_string("settings_adjusting_screen1_timing"));
            strcpy(tip_message_lower,
                wkc_translations_get_string("settings_adjusting_screen1_timing_next"));
        }
        break;
        case 2:
        {
            strcpy(tip_message_upper,
                wkc_translations_get_string("settings_adjusting_screen2_position"));
            strcpy(tip_message_lower,
                wkc_translations_get_string("settings_adjusting_screen2_position_next"));
        }
        break;
        default:
        {
            strcpy(tip_message_upper,
                wkc_translations_get_string("settings_adjusting_screen2_timing"));
            strcpy(tip_message_lower,
                wkc_translations_get_string("settings_save_and_exit"));
        }
        break;
    }

    if (index == 0)
    {
        DISPLAY_CLEAR_SCREEN(0);
        DISPLAY_CLEAR_SCREEN(1);

        // Draw border
        display_rect_t frame_rect = {
            .x = 16, .y = 16, .width = logical_width - 32, .height = logical_height - 32
        };
        display_rect_t frame_rect_primary = display_rect_compensation(&frame_rect, formats[0]);
        display_rect_t frame_rect_secondary = display_rect_compensation(&frame_rect, formats[1]);
        display_rect_translate(&frame_rect_primary, 1, 1);
        display_rect_translate(&frame_rect_secondary, 1, 1);
        display_draw_rect(0, orientation, &frame_rect_primary, DISPLAY_COLOR_BLACK, 1);
        display_draw_rect(1, orientation, &frame_rect_secondary, DISPLAY_COLOR_BLACK, 1);
        display_rect_translate(&frame_rect_primary, -1, -1);
        display_rect_translate(&frame_rect_secondary, -1, -1);
        display_draw_rect(0, orientation, &frame_rect_primary, DISPLAY_COLOR_WHITE, 1);
        display_draw_rect(1, orientation, &frame_rect_secondary, DISPLAY_COLOR_WHITE, 1);

        // Draw four arrows
        int arrow_size;
        display_get_icon("arrow_drop_up", DISPLAY_FORMAT_PAL, false, NULL, &arrow_size);
        for (int i = 0; i < 4; i++)
        {
            int arrow_size_primary, arrow_size_secondary;
            char arrow_name[20] = { 0 };
            char arrow_primary[50] = { 0 }, arrow_secondary[50] = { 0 };
            sprintf(arrow_name, "arrow_drop_%s", i == 0 ? "up" : i == 1 ? "right" :
                    i == 2 ? "down": "left");
            display_get_icon(arrow_name, DISPLAY_FORMAT_PAL, false, NULL, NULL);
            display_get_icon(arrow_name, formats[0], false, arrow_primary, &arrow_size_primary);
            display_get_icon(arrow_name, formats[1], false, arrow_secondary, &arrow_size_secondary);
            display_vector_t icon_position = {
                .x = i % 2 == 0 ? (logical_width - arrow_size) / 2 : i == 1 ?
                logical_width - 16 - arrow_size : 16,
                .y = i % 2 == 1 ? (logical_height - arrow_size) / 2 : i == 0 ?
                16 : logical_height - 16 - arrow_size
            };
            display_vector_t icon_position_primary = display_vector_compensation(
                &icon_position, formats[0]
            );
            display_vector_t icon_position_secondary = display_vector_compensation(
                &icon_position, formats[1]
            );
            display_vector_translate(&icon_position_primary, 1, 1);
            display_vector_translate(&icon_position_secondary, 1, 1);
            display_draw_image(0, orientation, icon_position_primary.x, icon_position_primary.y,
                               arrow_primary, arrow_size_primary, DISPLAY_COLOR_BLACK);
            display_draw_image(1, orientation, icon_position_secondary.x, icon_position_secondary.y,
                               arrow_secondary, arrow_size_secondary, DISPLAY_COLOR_BLACK);
            display_vector_translate(&icon_position_primary, -1, -1);
            display_vector_translate(&icon_position_secondary, -1, -1);
            display_draw_image(0, orientation, icon_position_primary.x, icon_position_primary.y,
                               arrow_primary, arrow_size_primary, DISPLAY_COLOR_WHITE);
            display_draw_image(1, orientation, icon_position_secondary.x, icon_position_secondary.y,
                               arrow_secondary, arrow_size_secondary, DISPLAY_COLOR_WHITE);
        }

        // Draw crosshair
        int cross_size, cross_size_primary, cross_size_secondary;
        char cross_primary[50] = { 0 }, cross_secondary[50] = { 0 };
        display_get_icon("cross", DISPLAY_FORMAT_PAL, false, NULL, &cross_size);
        display_get_icon("cross", formats[0], false, cross_primary, &cross_size_primary);
        display_get_icon("cross", formats[1], false, cross_secondary, &cross_size_secondary);
        display_vector_t cross_position = {
            .x = (logical_width - cross_size) / 2, .y = (logical_height - cross_size) / 2
        };
        display_vector_t cross_position_primary = display_vector_compensation(
            &cross_position, formats[0]
        );
        display_vector_t cross_position_secondary = display_vector_compensation(
            &cross_position, formats[1]
        );
        display_vector_translate(&cross_position_primary, 1, 1);
        display_vector_translate(&cross_position_secondary, 1, 1);
        display_draw_image(0, orientation, cross_position_primary.x, cross_position_primary.y,
                           cross_primary, cross_size_primary, DISPLAY_COLOR_BLACK);
        display_draw_image(1, orientation, cross_position_secondary.x, cross_position_secondary.y,
                           cross_secondary, cross_size_secondary, DISPLAY_COLOR_BLACK);
        display_vector_translate(&cross_position_primary, -1, -1);
        display_vector_translate(&cross_position_secondary, -1, -1);
        display_draw_image(0, orientation, cross_position_primary.x, cross_position_primary.y,
                           cross_primary, cross_size_primary, DISPLAY_COLOR_WHITE);
        display_draw_image(1, orientation, cross_position_secondary.x, cross_position_secondary.y,
                           cross_secondary, cross_size_secondary, DISPLAY_COLOR_WHITE);

        display_rect_expand(&frame_rect_primary, 2, 2);
        display_rect_expand(&frame_rect_secondary, 2, 2);
        display_update(0, orientation, &frame_rect_primary);
        display_update(1, orientation, &frame_rect_secondary);
    }

    // Clear bottom
    display_rect_t bottom_rect = {
        .x = 40, .y = logical_height / 2 + 12,
        .width = logical_width - 80, .height = logical_height / 2 - 12 - 40
    };
    display_rect_t bottom_rect_primary = display_rect_compensation(&bottom_rect, formats[0]);
    display_rect_t bottom_rect_secondary = display_rect_compensation(&bottom_rect, formats[1]);
    display_fill_rect(0, orientation, &bottom_rect_primary, DISPLAY_COLOR_TRANSPARENT);
    display_fill_rect(1, orientation, &bottom_rect_secondary, DISPLAY_COLOR_TRANSPARENT);
    // Draw text
    int item_position_y = logical_height / 2 + 24, text_length;
    display_vector_t text_size;
    for (int i = 0; i < 2; i++)
    {
        char *selected_text = i == 0 ? tip_message_upper : tip_message_lower;
        free(font_measure_text(selected_text, DISPLAY_FORMAT_PAL, 0, &text_length,
                               &text_size));
        text_position_descriptor_t *measure_result_primary = font_measure_text(selected_text,
                                                             formats[0], 0, NULL, NULL);
        text_position_descriptor_t *measure_result_secondary = font_measure_text(selected_text,
                                                               formats[1], 0, NULL, NULL);
        display_vector_t text_position_raw = { .x = (logical_width - text_size.x) / 2,
                                               .y = item_position_y };
        display_vector_t text_position_primary = display_vector_compensation(
            &text_position_raw, formats[0]
        );
        display_vector_t text_position_secondary = display_vector_compensation(
            &text_position_raw, formats[1]
        );
        display_vector_translate(&text_position_primary, 1, 1);
        display_vector_translate(&text_position_secondary, 1, 1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index < 2)
            display_draw_text(0, orientation, text_position_primary.x, text_position_primary.y,
                measure_result_primary, text_length, DISPLAY_COLOR_BLACK, formats[0]);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index >= 2)
            display_draw_text(1, orientation, text_position_secondary.x, text_position_secondary.y,
                measure_result_secondary, text_length, DISPLAY_COLOR_BLACK, formats[1]);
        display_vector_translate(&text_position_primary, -1, -1);
        display_vector_translate(&text_position_secondary, -1, -1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index < 2)
            display_draw_text(0, orientation, text_position_primary.x, text_position_primary.y,
                measure_result_primary, text_length, DISPLAY_COLOR_WHITE, formats[0]);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index >= 2)
            display_draw_text(1, orientation, text_position_secondary.x, text_position_secondary.y,
                measure_result_secondary, text_length, DISPLAY_COLOR_WHITE, formats[1]);
        item_position_y += text_size.y;
        free(measure_result_primary);
        free(measure_result_secondary);
    }

    // Draw output timing indicator
    if (index % 2 == 1)
    {
        display_vector_t indicator_position = {
            .x = (logical_width - 150) / 2, .y = item_position_y
        };
        display_rect_t indicator_rect = {
            .x = indicator_position.x, .y = indicator_position.y + 6,
            .width = 150, .height = 6
        };
        display_rect_t indicator_rect_primary = display_rect_compensation(&indicator_rect,
                                                formats[0]);
        display_rect_t indicator_rect_secondary = display_rect_compensation(&indicator_rect,
                                                  formats[1]);
        display_rect_t indicator_value_primary = indicator_rect_primary;
        display_rect_t indicator_value_secondary = indicator_rect_secondary;
        indicator_value_primary.width = (int)((float)indicator_value_primary.width *
                                        (output_timing + 15) / 30 + 0.5f);
        indicator_value_secondary.width = (int)((float)indicator_value_secondary.width *
                                          (output_timing + 15) / 30 + 0.5f);

        display_rect_translate(&indicator_rect_primary, 1, 1);
        display_rect_translate(&indicator_rect_secondary, 1, 1);
        display_rect_translate(&indicator_value_primary, 1, 1);
        display_rect_translate(&indicator_value_secondary, 1, 1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index < 2)
        {
            display_draw_rect(0, orientation, &indicator_rect_primary, DISPLAY_COLOR_BLACK, 1);
            display_fill_rect(0, orientation, &indicator_value_primary, DISPLAY_COLOR_BLACK);
        }
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index >= 2)
        {
            display_draw_rect(1, orientation, &indicator_rect_secondary, DISPLAY_COLOR_BLACK, 1);
            display_fill_rect(1, orientation, &indicator_value_secondary, DISPLAY_COLOR_BLACK);
        }
        display_rect_translate(&indicator_rect_primary, -1, -1);
        display_rect_translate(&indicator_rect_secondary, -1, -1);
        display_rect_translate(&indicator_value_primary, -1, -1);
        display_rect_translate(&indicator_value_secondary, -1, -1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index < 2)
        {
            display_draw_rect(0, orientation, &indicator_rect_primary, DISPLAY_COLOR_WHITE, 1);
            display_fill_rect(0, orientation, &indicator_value_primary, DISPLAY_COLOR_WHITE);
        }
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index >= 2)
        {
            display_draw_rect(1, orientation, &indicator_rect_secondary, DISPLAY_COLOR_WHITE, 1);
            display_fill_rect(1, orientation, &indicator_value_secondary, DISPLAY_COLOR_WHITE);
        }

        indicator_position.x += 156;
        char indicator_text[10];
        sprintf(indicator_text, "%d", output_timing);
        display_vector_t indicator_position_primary = display_vector_compensation(
            &indicator_position, formats[0]
        );
        display_vector_t indicator_position_secondary = display_vector_compensation(
            &indicator_position, formats[1]
        );
        int text_length;
        text_position_descriptor_t *measure_result_primary = font_measure_text(
            indicator_text, formats[0], 0, &text_length, NULL
        );
        text_position_descriptor_t *measure_result_secondary = font_measure_text(
            indicator_text, formats[1], 0, NULL, NULL
        );
        display_vector_translate(&indicator_position_primary, 1, 1);
        display_vector_translate(&indicator_position_secondary, 1, 1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index < 2)
            display_draw_text(0, orientation, indicator_position_primary.x,
                indicator_position_primary.y, measure_result_primary, text_length,
                DISPLAY_COLOR_BLACK, formats[0]);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index >= 2)
            display_draw_text(1, orientation, indicator_position_secondary.x,
                indicator_position_secondary.y, measure_result_secondary, text_length,
                DISPLAY_COLOR_BLACK, formats[1]);
        display_vector_translate(&indicator_position_primary, -1, -1);
        display_vector_translate(&indicator_position_secondary, -1, -1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index < 2)
            display_draw_text(0, orientation, indicator_position_primary.x,
                indicator_position_primary.y, measure_result_primary, text_length,
                DISPLAY_COLOR_WHITE, formats[0]);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED || index >= 2)
            display_draw_text(1, orientation, indicator_position_secondary.x,
                indicator_position_secondary.y, measure_result_secondary, text_length,
                DISPLAY_COLOR_WHITE, formats[1]);
        free(measure_result_primary);
        free(measure_result_secondary);
    }
    display_update(0, orientation, &bottom_rect_primary);
    display_update(1, orientation, &bottom_rect_secondary);
}

static void ui_settings_draw_confirm(char *title, display_format_t formats[],
                                     display_orientation_t orientation, bool confirm)
{
    char *ok_text = wkc_translations_get_string("settings_ok");
    char *cancel_text = wkc_translations_get_string("settings_cancel");
    int padding = 6, spacing = 12;
    int logical_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_WIDTH_PAL :
                        DISPLAY_HEIGHT_PAL;
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_HEIGHT_PAL :
                         DISPLAY_WIDTH_PAL;
    display_vector_t title_size, ok_size, cancel_size;
    int title_length, ok_length, cancel_length;
    free(font_measure_text(title, DISPLAY_FORMAT_PAL, 0, &title_length, &title_size));
    free(font_measure_text(ok_text, DISPLAY_FORMAT_PAL, 0, &ok_length, &ok_size));
    free(font_measure_text(cancel_text, DISPLAY_FORMAT_PAL, 0, &cancel_length, &cancel_size));
    text_position_descriptor_t *title_result_primary = font_measure_text(
        title, formats[0], 0, NULL, NULL
    );
    text_position_descriptor_t *title_result_secondary = font_measure_text(
        title, formats[1], 0, NULL, NULL
    );
    text_position_descriptor_t *ok_result_primary = font_measure_text(
        ok_text, formats[0], 0, NULL, NULL
    );
    text_position_descriptor_t *ok_result_secondary = font_measure_text(
        ok_text, formats[1], 0, NULL, NULL
    );
    text_position_descriptor_t *cancel_result_primary = font_measure_text(
        cancel_text, formats[0], 0, NULL, NULL
    );
    text_position_descriptor_t *cancel_result_secondary = font_measure_text(
        cancel_text, formats[1], 0, NULL, NULL
    );

    display_vector_t messagebox_size;
    if (orientation == DISPLAY_ORIENTATION_HORIZONTAL)
    {
        messagebox_size = (display_vector_t) {
            .x = (int)fmaxf(title_size.x, ok_size.x + cancel_size.x + spacing + padding * 2),
            .y = padding + title_size.y + ok_size.y
        };

    }
    else
    {
        messagebox_size = (display_vector_t) {
            .x = (int)fmaxf(fmaxf(title_size.x, ok_size.x + padding * 2), cancel_size.x + padding * 2),
            .y = padding * 2 + title_size.y + ok_size.y + cancel_size.y
        };
    }
    display_rect_t messagebox_border_rect = {
        .x = (logical_width - messagebox_size.x) / 2 - padding,
        .y = (logical_height - messagebox_size.y) / 2 - padding,
        .width = messagebox_size.x + padding * 2,
        .height = messagebox_size.y + padding * 2
    };
    display_rect_t messagebox_border_primary = display_rect_compensation(
        &messagebox_border_rect, formats[0]
    );
    display_rect_t messagebox_border_secondary = display_rect_compensation(
        &messagebox_border_rect, formats[1]
    );
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_fill_rounded_rect(0, orientation, &messagebox_border_primary,
                                  DISPLAY_COLOR_TRANSPARENT, 6);
    display_fill_rounded_rect(1, orientation, &messagebox_border_secondary,
                              DISPLAY_COLOR_TRANSPARENT, 6);
    display_rect_translate(&messagebox_border_primary, 1, 1);
    display_rect_translate(&messagebox_border_secondary, 1, 1);
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_draw_rounded_rect(0, orientation, &messagebox_border_primary,
            DISPLAY_COLOR_BLACK, 6, 2);
    display_draw_rounded_rect(1, orientation, &messagebox_border_secondary,
        DISPLAY_COLOR_BLACK, 6, 2);
    display_rect_translate(&messagebox_border_primary, -1, -1);
    display_rect_translate(&messagebox_border_secondary, -1, -1);
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_draw_rounded_rect(0, orientation, &messagebox_border_primary,
            DISPLAY_COLOR_WHITE, 6, 2);
    display_draw_rounded_rect(1, orientation, &messagebox_border_secondary,
        DISPLAY_COLOR_WHITE, 6, 2);

    // Draw title
    display_vector_t draw_origin = {
        .x = (logical_width - title_size.x) / 2,
        .y = messagebox_border_rect.y + padding
    };
    display_vector_t draw_origin_primary = display_vector_compensation(
        &draw_origin, formats[0]
    );
    display_vector_t draw_origin_secondary = display_vector_compensation(
        &draw_origin, formats[1]
    );
    display_vector_translate(&draw_origin_primary, 1, 1);
    display_vector_translate(&draw_origin_secondary, 1, 1);
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_draw_text(0, orientation, draw_origin_primary.x, draw_origin_primary.y,
            title_result_primary, title_length, DISPLAY_COLOR_BLACK, formats[0]);
    display_draw_text(1, orientation, draw_origin_secondary.x, draw_origin_secondary.y,
        title_result_secondary, title_length, DISPLAY_COLOR_BLACK, formats[1]);
    display_vector_translate(&draw_origin_primary, -1, -1);
    display_vector_translate(&draw_origin_secondary, -1, -1);
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_draw_text(0, orientation, draw_origin_primary.x, draw_origin_primary.y,
            title_result_primary, title_length, DISPLAY_COLOR_WHITE, formats[0]);
    display_draw_text(1, orientation, draw_origin_secondary.x, draw_origin_secondary.y,
        title_result_secondary, title_length, DISPLAY_COLOR_WHITE, formats[1]);

    // Draw buttons
    if (orientation == DISPLAY_ORIENTATION_HORIZONTAL)
    {
        draw_origin.y += title_size.y + padding;
        draw_origin.x = (logical_width - (ok_size.x + cancel_size.x + padding * 4 + spacing)) / 2;
    }
    else
    {
        draw_origin.y += title_size.y + padding;
        draw_origin.x = (logical_width - (cancel_size.x + padding * 2)) / 2;
    }
    if (!confirm)
    {
        display_rect_t button_rect = {
            .x = draw_origin.x,
            .y = draw_origin.y,
            .width = cancel_size.x + padding * 2,
            .height = 18
        };
        display_rect_t button_rect_primary = display_rect_compensation(
            &button_rect, formats[0]
        );
        display_rect_t button_rect_secondary = display_rect_compensation(
            &button_rect, formats[1]
        );
        display_rect_translate(&button_rect_primary, 1, 1);
        display_rect_translate(&button_rect_secondary, 1, 1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rounded_rect(0, orientation, &button_rect_primary,
                                      DISPLAY_COLOR_BLACK, 2);
        display_fill_rounded_rect(1, orientation, &button_rect_secondary,
                                  DISPLAY_COLOR_BLACK, 2);
        display_rect_translate(&button_rect_primary, -1, -1);
        display_rect_translate(&button_rect_secondary, -1, -1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rounded_rect(0, orientation, &button_rect_primary,
                                      DISPLAY_COLOR_WHITE, 2);
        display_fill_rounded_rect(1, orientation, &button_rect_secondary,
                                  DISPLAY_COLOR_WHITE, 2);
    }
    draw_origin.x += padding;
    draw_origin_primary = display_vector_compensation(
        &draw_origin, formats[0]
    );
    draw_origin_secondary = display_vector_compensation(
        &draw_origin, formats[1]
    );
    if (confirm)
    {
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_text(0, orientation, draw_origin_primary.x + 1, draw_origin_primary.y + 1,
                cancel_result_primary, cancel_length, DISPLAY_COLOR_BLACK, formats[0]);
        display_draw_text(1, orientation, draw_origin_secondary.x + 1, draw_origin_secondary.y + 1,
            cancel_result_primary, cancel_length, DISPLAY_COLOR_BLACK, formats[1]);
    }
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_draw_text(0, orientation, draw_origin_primary.x, draw_origin_primary.y,
            cancel_result_primary, cancel_length, confirm ? DISPLAY_COLOR_WHITE : DISPLAY_COLOR_BLACK,
            formats[0]);
    display_draw_text(1, orientation, draw_origin_secondary.x, draw_origin_secondary.y,
        cancel_result_secondary, cancel_length, confirm ? DISPLAY_COLOR_WHITE : DISPLAY_COLOR_BLACK,
        formats[1]);

    if (orientation == DISPLAY_ORIENTATION_HORIZONTAL)
    {
        draw_origin.x += cancel_size.x + padding + spacing;
    }
    else
    {
        draw_origin.y += cancel_size.y + padding;
        draw_origin.x = (logical_width - (ok_size.x + padding * 2)) / 2;
    }
    if (confirm)
    {
        display_rect_t button_rect = {
            .x = draw_origin.x,
            .y = draw_origin.y,
            .width = ok_size.x + padding * 2,
            .height = 18
        };
        display_rect_t button_rect_primary = display_rect_compensation(
            &button_rect, formats[0]
        );
        display_rect_t button_rect_secondary = display_rect_compensation(
            &button_rect, formats[1]
        );
        display_rect_translate(&button_rect_primary, 1, 1);
        display_rect_translate(&button_rect_secondary, 1, 1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rounded_rect(0, orientation, &button_rect_primary,
                                      DISPLAY_COLOR_BLACK, 2);
        display_fill_rounded_rect(1, orientation, &button_rect_secondary,
                                  DISPLAY_COLOR_BLACK, 2);
        display_rect_translate(&button_rect_primary, -1, -1);
        display_rect_translate(&button_rect_secondary, -1, -1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rounded_rect(0, orientation, &button_rect_primary,
                                      DISPLAY_COLOR_WHITE, 2);
        display_fill_rounded_rect(1, orientation, &button_rect_secondary,
                                  DISPLAY_COLOR_WHITE, 2);
    }
    draw_origin.x += padding;
    draw_origin_primary = display_vector_compensation(
        &draw_origin, formats[0]
    );
    draw_origin_secondary = display_vector_compensation(
        &draw_origin, formats[1]
    );
    if (!confirm)
    {
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_text(0, orientation, draw_origin_primary.x + 1, draw_origin_primary.y + 1,
                ok_result_primary, ok_length, DISPLAY_COLOR_BLACK, formats[0]);
        display_draw_text(1, orientation, draw_origin_secondary.x + 1, draw_origin_secondary.y + 1,
            ok_result_primary, ok_length, DISPLAY_COLOR_BLACK, formats[1]);
    }
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_draw_text(0, orientation, draw_origin_primary.x, draw_origin_primary.y,
            ok_result_primary, ok_length, confirm ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE,
            formats[0]);
    display_draw_text(1, orientation, draw_origin_secondary.x, draw_origin_secondary.y,
        ok_result_secondary, ok_length, confirm ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE,
        formats[1]);

    display_rect_expand(&messagebox_border_primary, 2, 2);
    display_rect_expand(&messagebox_border_secondary, 2, 2);
    display_update(0, orientation, &messagebox_border_primary);
    display_update(1, orientation, &messagebox_border_secondary);

    free(title_result_primary);
    free(title_result_secondary);
    free(ok_result_primary);
    free(ok_result_secondary);
    free(cancel_result_primary);
    free(cancel_result_secondary);
}

static void ui_settings_on_draw(ui_settings_t *settings, display_format_t *formats,
                         display_orientation_t orientation)
{
    wkc_settings_t *current_settings = wkc_settings_get_current();
    int logical_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                        DISPLAY_WIDTH_PAL : DISPLAY_HEIGHT_PAL;
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                         DISPLAY_HEIGHT_PAL : DISPLAY_WIDTH_PAL;
    display_vector_t center = {
        .x = logical_width / 2, .y = logical_height / 2
    };
    if (!settings->show && !settings->draw_request)
        return;

    if (settings->menu_state != UI_SETTINGS_DISPLAY_POSITION &&
        (settings->show && orientation == DISPLAY_ORIENTATION_VERTICAL_TILED ||
        settings->draw_request && settings->hirerachy_index == 0))
    {
        int language_count = wkc_translations_get_languages_count();
        char **language_options = calloc(language_count, sizeof(char*));
        for (int i = 0; i < language_count; i++)
        {
            language_options[i] = wkc_translations_get_language_name_from_index(i);
        }
        ui_menu_item_t main_items[] = {
            { .type = UI_MENU_ITEM_LABEL, .name = wkc_translations_get_string("settings_display_settings") },
            { .type = UI_MENU_ITEM_LABEL, .name = wkc_translations_get_string("settings_misc_settings") },
            { .type = UI_MENU_ITEM_LABEL, .name = wkc_translations_get_string("settings_advanced_settings") },
            {
                .type = UI_MENU_ITEM_PICKER,
                .count = language_count,
                .name = wkc_translations_get_string("settings_language"),
                .options = language_options,
                .current_value = current_settings->language
            },
            {
                .type = UI_MENU_ITEM_END
            }
        };
        if (settings->show || settings->hirerachy_index == 0 &&
            settings->last_selected_index == settings->selected_index[0]) // Refresh settings menu
        {
            if (settings->menu_state != UI_SETTINGS_ADVANCED_CONFIRM)
            {
                DISPLAY_CLEAR_SCREEN(0);
                DISPLAY_CLEAR_SCREEN(1);
            }
            ui_common_menu_draw_item(main_items, settings->selected_index[0], true,
                                     0, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, true, 0);
        }
        else
        {
            ui_common_menu_draw_item(main_items, settings->last_selected_index, false,
                                     0, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, false, 0);
            ui_common_menu_draw_item(main_items, settings->selected_index[0], true,
                                     0, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, false, 0);
        }
        free(language_options);
    }

    // Normal menu
    if (settings->menu_state == UI_SETTINGS_DISPLAY)
    {
        char *orientation_options[] = {
            wkc_translations_get_string("settings_horizontal"),
            wkc_translations_get_string("settings_vertical"),
            wkc_translations_get_string("settings_vertical_tiled")
        };
        char *output_mode_options[] = {
            wkc_translations_get_string("settings_rising_edge"),
            wkc_translations_get_string("settings_falling_edge"),
            wkc_translations_get_string("settings_debug_mode")
        };
        char *capture_index_options[] = {
            wkc_translations_get_string("settings_screen_id_1"),
            wkc_translations_get_string("settings_screen_id_2"),
        };
        ui_menu_item_t items[] = {
            {
                .type = UI_MENU_ITEM_PICKER,
                .name = wkc_translations_get_string("settings_screen_orientation"),
                .count = 3,
                .options = orientation_options,
                .current_value = wkc_settings_get_current()->display.orientation
            },
            {
                .type = UI_MENU_ITEM_PICKER,
                .name = wkc_translations_get_string("settings_output_mode"),
                .count = 3,
                .options = output_mode_options,
                .current_value = wkc_settings_get_current()->display.output_mode
            },
            {
                .type = UI_MENU_ITEM_LABEL,
                .name = wkc_translations_get_string("settings_adjust_position")
            },
            {
                .type = UI_MENU_ITEM_PICKER,
                .name = wkc_translations_get_string("settings_capture_output"),
                .count = 2,
                .options = capture_index_options,
                .current_value = wkc_settings_get_current()->display.capture_index
            },
            {
                .type = UI_MENU_ITEM_SWITCH,
                .name = wkc_translations_get_string("settings_capture_osd"),
                .count = 2,
                .current_value = wkc_settings_get_current()->display.capture_osd
            },
            {
                .type = UI_MENU_ITEM_END
            }
        };
        if (settings->show || settings->last_selected_index < 0)
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                DISPLAY_CLEAR_SCREEN(0);
            DISPLAY_CLEAR_SCREEN(1);
            ui_common_menu_draw_item(items, settings->selected_index
                                     [settings->hirerachy_index], true,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, true, 0);
        }
        else
        {
            ui_common_menu_draw_item(items, settings->last_selected_index, false,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, false, 0);
            ui_common_menu_draw_item(items, settings->selected_index
                                     [settings->hirerachy_index], true,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, false, 0);
        }
    }
    else if (settings->menu_state == UI_SETTINGS_MISC)
    {
        char *power_save_options[] = {
            wkc_translations_get_string("settings_never"),
            wkc_translations_get_string("settings_1min"),
            wkc_translations_get_string("settings_5min"),
            wkc_translations_get_string("settings_10min"),
        };
        char *homepage_status_bar_position_options[] = {
            wkc_translations_get_string("settings_top"),
            wkc_translations_get_string("settings_bottom")
        };
        ui_menu_item_t items[] = {
            {
                .type = UI_MENU_ITEM_PICKER,
                .name = wkc_translations_get_string("settings_power_save"),
                .count = 4,
                .options = power_save_options,
                .current_value = wkc_settings_get_current()->power_save
            },
            {
                .type = UI_MENU_ITEM_SWITCH,
                .name = wkc_translations_get_string("settings_keep_advertise"),
                .current_value = wkc_settings_get_current()->keep_advertise
            },
            {
                .type = UI_MENU_ITEM_SWITCH,
                .name = wkc_translations_get_string("settings_remember_peripherals"),
                .current_value = wkc_settings_get_current()->peripherals.remember_state
            },
            {
                .type = UI_MENU_ITEM_PICKER,
                .name = wkc_translations_get_string("settings_homepage_status_bar_position"),
                .count = 2,
                .options = homepage_status_bar_position_options,
                .current_value = wkc_settings_get_current()->homepage_status_bar_position
            },
            {
                .type = UI_MENU_ITEM_END
            }
        };
        if (settings->show || settings->last_selected_index < 0)
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                DISPLAY_CLEAR_SCREEN(0);
            DISPLAY_CLEAR_SCREEN(1);
            ui_common_menu_draw_item(items, settings->selected_index
                                     [settings->hirerachy_index], true,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, true, 0);
        }
        else
        {
            ui_common_menu_draw_item(items, settings->last_selected_index, false,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, false, 0);
            ui_common_menu_draw_item(items, settings->selected_index
                                     [settings->hirerachy_index], true,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, false, 0);
        }
    }
    else if (settings->menu_state == UI_SETTINGS_ADVANCED)
    {
        ui_menu_item_t items[] = {
            {
                .type = UI_MENU_ITEM_LABEL,
                .name = wkc_translations_get_string("settings_clear_paired_devices")
            },
            {
                .type = UI_MENU_ITEM_LABEL,
                .name = wkc_translations_get_string("settings_factory_reset")
            },
            {
                .type = UI_MENU_ITEM_END
            }
        };
        if (settings->show || settings->last_selected_index < 0)
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                DISPLAY_CLEAR_SCREEN(0);
            DISPLAY_CLEAR_SCREEN(1);
            ui_common_menu_draw_item(items, settings->selected_index
                                     [settings->hirerachy_index], true,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, true, 0);
        }
        else
        {
            ui_common_menu_draw_item(items, settings->last_selected_index, false,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, false, 0);
            ui_common_menu_draw_item(items, settings->selected_index
                                     [settings->hirerachy_index], true,
                                     1, &center, UI_MENU_ALIGN_CENTER,
                                     UI_MENU_ALIGN_CENTER, formats, orientation, false, 0);
        }
    }
    else if (settings->menu_state == UI_SETTINGS_DISPLAY_POSITION)
    {
        ui_settings_draw_display_position(settings->selected_index[settings->hirerachy_index],
            formats, orientation, current_settings->display.position[
                settings->selected_index[settings->hirerachy_index] / 2].output_timing);
    }
    else if (settings->menu_state == UI_SETTINGS_ADVANCED_CONFIRM)
    {
        char title[50];
        if (settings->hirerachy_index > 0)
        {
            if(settings->selected_index[settings->hirerachy_index - 1] == 0)
                strcpy(title, wkc_translations_get_string("settings_confirm_clear_devices"));
            else
                strcpy(title, wkc_translations_get_string("settings_confirm_factory_reset"));
        }
        ui_settings_draw_confirm(title, formats, orientation,
            settings->selected_index[settings->hirerachy_index]);
    }

    settings->show = false;
    settings->draw_request = false;
    settings->last_selected_index = settings->selected_index[settings->hirerachy_index];
}

static void ui_settings_on_key_event(ui_settings_t *settings, int key_code)
{
    wkc_settings_t *current_settings = wkc_settings_get_current();
    if (key_code == UI_KEY_CODE_EXIT)
    {
        if (settings->hirerachy_index == 0)
        {
            ui_page_t *home = ui_shell_find_page(settings->base.parent, UI_PAGE_TYPE_HOME);
            ui_shell_show_page(settings->base.parent, home);
        }
        else
        {
            settings->hirerachy_index -= 1;
            settings->show = true;
            settings->draw_request = true;
            settings->last_selected_index = settings->selected_index[settings->hirerachy_index];
        }
        settings->menu_state = settings->menu_state == UI_SETTINGS_DISPLAY_POSITION ?
        UI_SETTINGS_DISPLAY  : settings->menu_state == UI_SETTINGS_ADVANCED_CONFIRM ?
        UI_SETTINGS_ADVANCED : UI_SETTINGS_MAIN;
    }
    else
    {
        bool refresh = false;
        int *current_index = &settings->selected_index[settings->hirerachy_index];
        int *next_index = &settings->selected_index[settings->hirerachy_index + 1];
        switch (settings->menu_state)
        {
            case UI_SETTINGS_MAIN:
            {
                if (key_code == UI_KEY_CODE_DOWN)
                {
                    *current_index += 1;
                    refresh = true;
                }
                else if (key_code == UI_KEY_CODE_UP)
                {
                    *current_index += 3;
                    refresh = true;
                }
                else if (key_code == UI_KEY_CODE_OK)
                {
                    if (*current_index == 0)
                        settings->menu_state = UI_SETTINGS_DISPLAY;
                    else if (*current_index == 1)
                        settings->menu_state = UI_SETTINGS_MISC;
                    else if (*current_index == 2)
                        settings->menu_state = UI_SETTINGS_ADVANCED;
                    if (*current_index <= 2)
                    {
                        settings->hirerachy_index += 1;
                        *next_index = 0;
                        settings->last_selected_index = ~0;
                        refresh = true;
                    }
                }
                else if (key_code == UI_KEY_CODE_LEFT || key_code == UI_KEY_CODE_RIGHT)
                {
                    if (*current_index == 3)
                    {
                        int language_count = wkc_translations_get_languages_count();
                        current_settings->language += key_code == UI_KEY_CODE_LEFT ?
                                          language_count - 1 : 1;
                        current_settings->language %= language_count;
                        refresh = true;
                        wkc_settings_save();
                    }
                }
                *current_index %= 4;
            }
            break;
            case UI_SETTINGS_DISPLAY:
            {
                if (key_code == UI_KEY_CODE_DOWN)
                {
                    *current_index += 1;
                    refresh = true;
                }
                else if (key_code == UI_KEY_CODE_UP)
                {
                    *current_index += 4;
                    refresh = true;
                }
                else if (*current_index == 0 &&
                        (key_code == UI_KEY_CODE_LEFT || key_code == UI_KEY_CODE_RIGHT))
                {
                    current_settings->display.orientation += key_code == UI_KEY_CODE_LEFT ? 2 :
                                                           key_code == UI_KEY_CODE_RIGHT ? 1 :
                                                           0;
                    current_settings->display.orientation %= 3;
                    refresh = true;
                    wkc_settings_save();
                    protocol_ble_notify_update_command("screen_orientation");
                }
                else if (*current_index == 1 &&
                        (key_code == UI_KEY_CODE_LEFT || key_code == UI_KEY_CODE_RIGHT))
                {
                    current_settings->display.output_mode +=
                                      key_code == UI_KEY_CODE_LEFT ? 2 :
                                      key_code == UI_KEY_CODE_RIGHT ? 1 :
                                      0;
                    current_settings->display.output_mode %= 3;
                    refresh = true;
                    display_settings_update();
                    wkc_settings_save();
                    protocol_ble_notify_update_command("output_mode");
                }
                else if (*current_index == 2 && key_code == UI_KEY_CODE_OK)
                {
                    settings->hirerachy_index += 1;
                    settings->menu_state = UI_SETTINGS_DISPLAY_POSITION;
                    *next_index = 0;
                    settings->last_selected_index = ~0;
                    refresh = true;
                }
                else if (*current_index == 3 &&
                        (key_code == UI_KEY_CODE_LEFT || key_code == UI_KEY_CODE_RIGHT))
                {
                    current_settings->display.capture_index =
                        !current_settings->display.capture_index;
                    refresh = true;
                    display_settings_update();
                    wkc_settings_save();
                    protocol_ble_notify_update_command("capture_card_output");
                }
                else if (*current_index == 4 && key_code == UI_KEY_CODE_OK)
                {
                    current_settings->display.capture_osd =
                        !current_settings->display.capture_osd;
                    refresh = true;
                    display_settings_update();
                    wkc_settings_save();
                    protocol_ble_notify_update_command("capture_with_osd");
                }
                *current_index %= 5;
            }
            break;
            case UI_SETTINGS_DISPLAY_POSITION:
            {
                if (key_code == UI_KEY_CODE_OK)
                {
                    if (*current_index == 3)
                    {
                        ui_settings_on_key_event(settings, UI_KEY_CODE_EXIT);
                        return;
                    }
                    else
                        *current_index += 1;
                    refresh = true;
                }
                else if (*current_index < 4)
                {
                    if (*current_index % 2 == 0)
                    {
                        int *x_offset = &current_settings->display.position[
                                *current_index / 2].x_offset;
                        int *y_offset = &current_settings->display.position[
                                *current_index / 2].y_offset;
                        if (ui_shell_get_orientation(settings->base.parent) ==
                             DISPLAY_ORIENTATION_HORIZONTAL)
                        {
                            if (key_code == UI_KEY_CODE_UP)
                                *y_offset -= 1;
                            if (key_code == UI_KEY_CODE_DOWN)
                                *y_offset += 1;
                            if (key_code == UI_KEY_CODE_LEFT)
                                *x_offset -= 1;
                            if (key_code == UI_KEY_CODE_RIGHT)
                                *x_offset += 1;
                        }
                        else
                        {
                            if (key_code == UI_KEY_CODE_UP)
                                *x_offset += 1;
                            if (key_code == UI_KEY_CODE_DOWN)
                                *x_offset -= 1;
                            if (key_code == UI_KEY_CODE_LEFT)
                                *y_offset -= 1;
                            if (key_code == UI_KEY_CODE_RIGHT)
                                *y_offset += 1;
                        }
                        *y_offset = clamp(*y_offset, -16, 16);
                        *x_offset = clamp(*x_offset, 0, 255);
                        display_settings_update();
                        wkc_settings_save();
                    }
                    else
                    {
                        int *output_timing = &current_settings->display.position[
                                *current_index / 2].output_timing;
                        if (key_code == UI_KEY_CODE_LEFT)
                            *output_timing -= 1;
                        if (key_code == UI_KEY_CODE_RIGHT)
                            *output_timing += 1;
                        *output_timing = clamp(*output_timing, -15, 15);
                        refresh = true;
                        wkc_settings_save();
                    }
                }
            }
            break;
            case UI_SETTINGS_MISC:
            {
                if (key_code == UI_KEY_CODE_DOWN)
                {
                    *current_index += 1;
                    refresh = true;
                }
                else if (key_code == UI_KEY_CODE_UP)
                {
                    *current_index += 3;
                    refresh = true;
                }
                else if (*current_index == 0 &&
                        (key_code == UI_KEY_CODE_LEFT || key_code == UI_KEY_CODE_RIGHT))
                {
                    current_settings->power_save += key_code == UI_KEY_CODE_LEFT ? 3 :
                                                           key_code == UI_KEY_CODE_RIGHT ? 1 :
                                                           0;
                    current_settings->power_save %= 4;
                    refresh = true;
                    wkc_settings_save();
                    protocol_ble_notify_update_command("power_save");
                }
                else if (*current_index == 1 && key_code == UI_KEY_CODE_OK)
                {
                    current_settings->keep_advertise = !current_settings->keep_advertise;
                    refresh = true;
                    wkc_settings_save();
                    protocol_ble_notify_update_command("keep_advertise");
                }
                else if (*current_index == 2 && key_code == UI_KEY_CODE_OK)
                {
                    current_settings->peripherals.remember_state =
                    !current_settings->peripherals.remember_state;
                    refresh = true;
                    wkc_settings_save();
                    protocol_ble_notify_update_command("remember_peripherals");
                }
                else if (*current_index == 3 &&
                        (key_code == UI_KEY_CODE_LEFT) || key_code == UI_KEY_CODE_RIGHT)
                {
                    current_settings->homepage_status_bar_position =
                        !current_settings->homepage_status_bar_position;
                    refresh = true;
                    wkc_settings_save();
                    protocol_ble_notify_update_command("homepage_status_bar_position");
                }
                *current_index %= 4;
            }
            break;
            case UI_SETTINGS_ADVANCED:
            {
                if (key_code == UI_KEY_CODE_UP || key_code == UI_KEY_CODE_DOWN)
                {
                    *current_index += 1;
                    *current_index %= 2;
                    refresh = true;
                }
                else if (key_code == UI_KEY_CODE_OK)
                {
                    settings->hirerachy_index += 1;
                    settings->menu_state = UI_SETTINGS_ADVANCED_CONFIRM;
                    settings->show = true;
                    *next_index = 0;
                    settings->last_selected_index = 0;
                    refresh = true;
                }
            }
            break;
            case UI_SETTINGS_ADVANCED_CONFIRM:
            {
                if (key_code == UI_KEY_CODE_OK)
                {
                    if (*current_index == 0)
                    {
                        ui_settings_on_key_event(settings, UI_KEY_CODE_EXIT);
                        return;
                    }
                    else if (settings->selected_index[settings->hirerachy_index - 1] == 0)
                    {
                        wkc_security_load_default();
                        esp_restart();
                    }
                    else
                    {
                        wkc_userprofile_load_default();
                        wkc_settings_load_default();
                        wkc_security_load_default();
                        camera_control_reset();
                        esp_restart();
                    }
                }
                else if ((ui_shell_get_orientation(settings->base.parent) ==
                         DISPLAY_ORIENTATION_HORIZONTAL && (key_code == UI_KEY_CODE_LEFT ||
                         key_code == UI_KEY_CODE_RIGHT)) ||
                         (ui_shell_get_orientation(settings->base.parent) !=
                         DISPLAY_ORIENTATION_HORIZONTAL && (key_code == UI_KEY_CODE_UP ||
                         key_code == UI_KEY_CODE_DOWN)))
                {
                    *current_index = !*current_index;
                    refresh = true;
                }
            }
            break;
            default:
                break;
        }
        if (refresh)
        {
            settings->draw_request = true;
        }
    }
}

static void ui_settings_on_format_changed(ui_settings_t *settings)
{
    settings->show = true;
    settings->draw_request = true;
    settings->last_selected_index = ~settings->selected_index[settings->hirerachy_index];
}

ui_page_t *ui_settings_create()
{
    ui_settings_t *settings = (ui_settings_t*)calloc(1, sizeof(ui_settings_t));
    settings->base.type = UI_PAGE_TYPE_SETTINGS;
    settings->base.on_show = (ui_page_event_t)ui_settings_on_show;
    settings->base.on_draw = (ui_page_draw_event_t)ui_settings_on_draw;
    settings->base.on_key_event = (ui_page_key_event_t)ui_settings_on_key_event;
    settings->base.on_mainloop = NULL;
    settings->base.on_format_changed = (ui_page_event_t)ui_settings_on_format_changed;
    return (ui_page_t*)settings;
}