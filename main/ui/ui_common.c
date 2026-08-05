#include <stdio.h>
#include <math.h>
#include "display/display_common.h"
#include "display/graphics.h"
#include "ui_common.h"

void ui_common_draw_status_icon(const char *name, display_format_t formats[],
                                display_orientation_t orientation, display_vector_t *icon_draw_index)
{
    char icon[60] = { 0 };
    int icon_width;
    display_vector_t icon_coordinate_primary = display_coordinate_compensation(
                                              icon_draw_index->x, icon_draw_index->y - 2,
                                              formats[0]);
    display_get_icon(name, formats[0], false, icon, &icon_width);
    display_draw_image(0, orientation, icon_coordinate_primary.x + 1,
                       icon_coordinate_primary.y + 1, icon, icon_width, DISPLAY_COLOR_BLACK);
    display_draw_image(0, orientation, icon_coordinate_primary.x,
                       icon_coordinate_primary.y, icon, icon_width, DISPLAY_COLOR_WHITE);
    if(orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
    {
        display_vector_t icon_coordinate_secondary = display_coordinate_compensation(
                                              icon_draw_index->x, icon_draw_index->y - 2,
                                              formats[1]);
        display_get_icon(name, formats[1], false, icon, &icon_width);
        display_draw_image(1, orientation, icon_coordinate_secondary.x + 1,
                           icon_coordinate_secondary.y + 1, icon, icon_width, DISPLAY_COLOR_BLACK);
        display_draw_image(1, orientation, icon_coordinate_secondary.x,
                           icon_coordinate_secondary.y, icon, icon_width, DISPLAY_COLOR_WHITE);
    }
    icon_draw_index->x += 24;
}

int ui_common_menu_get_item_count(ui_menu_item_t *menu)
{
    int count = 0;
    while (menu[count].type != UI_MENU_ITEM_END)
        count += 1;
    return count;
}

display_rect_t ui_common_menu_get_border(ui_menu_item_t *items, display_vector_t *origin,
               ui_menu_alignment_t horizontal_alignment,
               ui_menu_alignment_t vertical_alignment, int max_items)
{
    int item_width = 240;
    int item_height = 24;
    int item_count = ui_common_menu_get_item_count(items);
    if (max_items <= 0) max_items = item_count;
    int inner_height = item_height * (max_items < item_count ? max_items : item_count);
    display_rect_t border_rect = {
        .width = item_width,
        .height = inner_height
    };
    display_rect_expand(&border_rect, 6, 6);
    border_rect.x = horizontal_alignment == UI_MENU_ALIGN_BEGIN ? origin->x :
                    horizontal_alignment == UI_MENU_ALIGN_CENTER ?
                    origin->x - border_rect.width / 2 : origin->x - border_rect.width;
    border_rect.y = vertical_alignment == UI_MENU_ALIGN_BEGIN ? origin->y :
                    vertical_alignment == UI_MENU_ALIGN_CENTER ?
                    origin->y - border_rect.height / 2 : origin->y - border_rect.height;
    return border_rect;
}

void ui_common_menu_draw_item(ui_menu_item_t *items, int item_index, bool active,
                       int prefer_side, display_vector_t *origin,
                       ui_menu_alignment_t horizontal_alignment,
                       ui_menu_alignment_t vertical_alignment,
                       display_format_t *formats, display_orientation_t orientation,
                       bool refresh, int max_items)
{
    if (!items) return;
    // Calculate total size
    int item_width = 240;
    int item_height = 24;
    int item_count = ui_common_menu_get_item_count(items);
    if (max_items <= 0) max_items = item_count;
    int display_count = (max_items < item_count ? max_items : item_count);
    int inner_height = item_height * display_count;
    display_rect_t border_rect = ui_common_menu_get_border(items, origin,
                                 horizontal_alignment, vertical_alignment, max_items);

    // Get center coordinate
    display_vector_t center = {
        .x = border_rect.x + border_rect.width / 2,
        .y = border_rect.y + border_rect.height / 2
    };

    display_vector_t draw_origin = {
        .x = center.x - item_width / 2,
        .y = center.y - inner_height / 2
    };
    int item_start = item_index / max_items * max_items;
    int actual_count = item_start + display_count > item_count ? item_count - item_start :
                       display_count;
    // Clear background and redraw when item_index is complement
    if (refresh)
    {
        // Draw border

        int corner_radius_primary = display_coordinate_compensation(6, 0, formats[0]).x;
        int corner_radius_secondary = display_coordinate_compensation(6, 0, formats[1]).x;
        display_rect_t border_rect_primary = display_rect_compensation(&border_rect,
                                             formats[0]);
        display_rect_t border_rect_secondary = display_rect_compensation(&border_rect,
                                               formats[1]);

        display_rect_translate(&border_rect_primary, 1, 1);
        display_rect_translate(&border_rect_secondary, 1, 1);
        if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_rounded_rect(prefer_side, orientation,
                                      prefer_side ? &border_rect_secondary : &border_rect_primary,
                                      DISPLAY_COLOR_BLACK,
                                      prefer_side ? corner_radius_secondary : corner_radius_primary,
                                      2);
            display_rect_translate(&border_rect_primary, -1, -1);
            display_rect_translate(&border_rect_secondary, -1, -1);
            display_draw_rounded_rect(prefer_side, orientation,
                                      prefer_side ? &border_rect_secondary : &border_rect_primary,
                                      DISPLAY_COLOR_WHITE,
                                      prefer_side ? corner_radius_secondary : corner_radius_primary,
                                      2);
        }
        else
        {
            display_draw_rounded_rect(0, orientation, &border_rect_primary, DISPLAY_COLOR_BLACK,
                                      corner_radius_primary, 2);
            display_draw_rounded_rect(1, orientation, &border_rect_secondary, DISPLAY_COLOR_BLACK,
                                      corner_radius_secondary, 2);
            display_rect_translate(&border_rect_primary, -1, -1);
            display_rect_translate(&border_rect_secondary, -1, -1);
            display_draw_rounded_rect(0, orientation, &border_rect_primary, DISPLAY_COLOR_WHITE,
                                      corner_radius_primary, 2);
            display_draw_rounded_rect(1, orientation, &border_rect_secondary, DISPLAY_COLOR_WHITE,
                                      corner_radius_secondary, 2);
        }
        display_rect_expand(&border_rect_primary, 2, 2);
        display_rect_expand(&border_rect_secondary, 2, 2);
        // Draw scroll bar
        if (item_count > max_items)
        {
            int scrollbar_segments = (int)ceil(item_count / (float)max_items);
            float scrollbar_height = inner_height / (float)scrollbar_segments;
            int scrollbar_offset = (int)(scrollbar_height *
                                   (int)(item_index / (float)max_items) + 0.5f);
            display_line_t scrollbar_line = {
                .x1 = border_rect.x + border_rect.width - 6,
                .y1 = border_rect.y + scrollbar_offset + 6,
                .x2 = border_rect.x + border_rect.width - 6,
                .y2 = border_rect.y + scrollbar_offset + 6 + (int)(scrollbar_height + 0.5f)
            };
            display_line_t scrollbar_line_primary = display_line_compensation(
                &scrollbar_line, formats[0]
            );
            display_line_t scrollbar_line_secondary = display_line_compensation(
                &scrollbar_line, formats[1]
            );
            if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
            {
                display_line_t *selected_line = prefer_side ?
                    &scrollbar_line_secondary : &scrollbar_line_primary;
                display_line_translate(selected_line, 1, 1);
                display_draw_line(prefer_side, orientation, selected_line,
                                  DISPLAY_COLOR_BLACK, 2);
                display_line_translate(selected_line, -1, -1);
                display_draw_line(prefer_side, orientation, selected_line,
                                  DISPLAY_COLOR_WHITE, 2);
            }
            else
            {
                display_line_translate(&scrollbar_line_primary, 1, 1);
                display_line_translate(&scrollbar_line_secondary, 1, 1);
                display_draw_line(0, orientation, &scrollbar_line_primary,
                                  DISPLAY_COLOR_BLACK, 2);
                display_draw_line(1, orientation, &scrollbar_line_secondary,
                                  DISPLAY_COLOR_BLACK, 2);
                display_line_translate(&scrollbar_line_primary, -1, -1);
                display_line_translate(&scrollbar_line_secondary, -1, -1);
                display_draw_line(0, orientation, &scrollbar_line_primary,
                                  DISPLAY_COLOR_WHITE, 2);
                display_draw_line(1, orientation, &scrollbar_line_secondary,
                                  DISPLAY_COLOR_WHITE, 2);
            }
        }
        display_update(0, orientation, &border_rect_primary);
        display_update(1, orientation, &border_rect_secondary);
        for (int i = 0; i < actual_count; i++)
        {
            ui_common_menu_draw_item(items, i + item_start,
                                    (i + item_start) == item_index, prefer_side,
                                     origin, horizontal_alignment, vertical_alignment,
                                     formats, orientation, false, max_items);
        }
        return;
    }

    // Calculate item position
    display_vector_t item_origin = {
        .x = draw_origin.x + 6,
        .y = draw_origin.y + (item_index - item_start) * item_height + 3
    };
    display_vector_t item_origin_primary = display_vector_compensation(&item_origin,
                                           formats[0]);
    display_vector_t item_origin_secondary = display_vector_compensation(&item_origin,
                                             formats[1]);

    // Draw highlight
    if (item_count > max_items) item_width -= 6;
    display_rect_t item_rect = {
        .x = item_origin.x - 6,
        .y = item_origin.y,
        .width = item_width,
        .height = item_height - 6
    };
    display_rect_t item_rect_primary = display_rect_compensation(&item_rect,
                                            formats[0]);
    display_rect_t item_rect_secondary = display_rect_compensation(&item_rect,
                                              formats[1]);
    if (active)
    {
        display_rect_translate(&item_rect_primary, 1, 1);
        display_rect_translate(&item_rect_secondary, 1, 1);
        if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_fill_rounded_rect(prefer_side, orientation, prefer_side ?
                                      &item_rect_secondary : &item_rect_primary,
                                      DISPLAY_COLOR_BLACK, 2);
            display_rect_translate(&item_rect_primary, -1, -1);
            display_rect_translate(&item_rect_secondary, -1, -1);
            display_fill_rounded_rect(prefer_side, orientation, prefer_side ?
                                      &item_rect_secondary : &item_rect_primary,
                                      DISPLAY_COLOR_WHITE, 2);
        }
        else
        {
            display_fill_rounded_rect(0, orientation, &item_rect_primary,
                DISPLAY_COLOR_BLACK, 2);
            display_fill_rounded_rect(1, orientation, &item_rect_secondary,
                DISPLAY_COLOR_BLACK, 2);
            display_rect_translate(&item_rect_primary, -1, -1);
            display_rect_translate(&item_rect_secondary, -1, -1);
            display_fill_rounded_rect(0, orientation, &item_rect_primary,
                DISPLAY_COLOR_WHITE, 2);
            display_fill_rounded_rect(1, orientation, &item_rect_secondary,
                DISPLAY_COLOR_WHITE, 2);
        }
    }
    else
    {
        display_rect_expand(&item_rect_primary, 1, 1);
        display_rect_expand(&item_rect_secondary, 1, 1);
        if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_fill_rect(prefer_side, orientation, prefer_side ?
                              &item_rect_secondary : &item_rect_primary,
                              DISPLAY_COLOR_TRANSPARENT);
        }
        else
        {
            display_fill_rect(0, orientation, &item_rect_primary,
                DISPLAY_COLOR_TRANSPARENT);
            display_fill_rect(1, orientation, &item_rect_secondary,
                DISPLAY_COLOR_TRANSPARENT);
        }
    }

    // Draw content
    display_vector_t measure_size_raw;
    int measure_length;
    text_position_descriptor_t *measure_result_raw = font_measure_text(items[item_index].name,
        DISPLAY_FORMAT_PAL, 0, &measure_length, &measure_size_raw);
    text_position_descriptor_t *measure_result_primary = font_measure_text(
        items[item_index].name, formats[0], 0, NULL, NULL
    );
    text_position_descriptor_t *measure_result_secondary = font_measure_text(
        items[item_index].name, formats[1], 0, NULL, NULL
    );
    if (!active)
    {
        display_vector_translate(&item_origin_primary, 1, 1);
        display_vector_translate(&item_origin_secondary, 1, 1);
        if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_text(prefer_side, orientation, prefer_side ? item_origin_secondary.x :
                              item_origin_primary.x, prefer_side ? item_origin_secondary.y :
                              item_origin_primary.y, prefer_side ? measure_result_secondary :
                              measure_result_primary, measure_length, DISPLAY_COLOR_BLACK,
                              formats[prefer_side]);
        }
        else
        {
            display_draw_text(0, orientation, item_origin_primary.x, item_origin_primary.y,
                              measure_result_primary, measure_length, DISPLAY_COLOR_BLACK,
                              formats[0]);
            display_draw_text(1, orientation, item_origin_secondary.x, item_origin_secondary.y,
                              measure_result_secondary, measure_length, DISPLAY_COLOR_BLACK,
                              formats[1]);
        }
        display_vector_translate(&item_origin_primary, -1, -1);
        display_vector_translate(&item_origin_secondary, -1, -1);
    }
    if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
    {
        display_draw_text(prefer_side, orientation, prefer_side ? item_origin_secondary.x :
                          item_origin_primary.x, prefer_side ? item_origin_secondary.y :
                          item_origin_primary.y, prefer_side ? measure_result_secondary :
                          measure_result_primary, measure_length, active ?
                          DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE, formats[prefer_side]);
    }
    else
    {
        display_draw_text(0, orientation, item_origin_primary.x, item_origin_primary.y,
                          measure_result_primary, measure_length, active ?
                          DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE, formats[0]);
        display_draw_text(1, orientation, item_origin_secondary.x, item_origin_secondary.y,
                          measure_result_secondary, measure_length, active ?
                          DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE, formats[1]);
    }
    free(measure_result_raw);
    free(measure_result_primary);
    free(measure_result_secondary);

    // Draw sub controls
    display_vector_t subcontrol_origin = {
        .x = draw_origin.x + item_width,
        .y = draw_origin.y + (item_index - item_start) * item_height
    }, subcontrol_origin_primary, subcontrol_origin_secondary;
    switch (items[item_index].type)
    {
        case UI_MENU_ITEM_PICKER:
        {
            // Get arrow icons
            char icon_left_primary[50], icon_left_secondary[50];
            char icon_right_primary[50], icon_right_secondary[50];
            int icon_size_raw, icon_size_primary, icon_size_secondary;
            display_get_icon("arrow_drop_left", DISPLAY_FORMAT_PAL, false, NULL, &icon_size_raw);
            display_get_icon("arrow_drop_left", formats[0], false, icon_left_primary,
                             &icon_size_primary);
            display_get_icon("arrow_drop_left", formats[1], false, icon_left_secondary,
                             &icon_size_secondary);
            display_get_icon("arrow_drop_right", formats[0], false, icon_right_primary, NULL);
            display_get_icon("arrow_drop_right", formats[1], false, icon_right_secondary, NULL);

            // Draw content
            subcontrol_origin.x -= icon_size_raw;
            subcontrol_origin_primary = display_vector_compensation(
                &subcontrol_origin, formats[0]
            );
            subcontrol_origin_secondary = display_vector_compensation(
                &subcontrol_origin, formats[1]
            );
            if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
            {
                if (!active)
                {
                    display_draw_image(prefer_side, orientation, (prefer_side ?
                        subcontrol_origin_secondary.x : subcontrol_origin_primary.x) + 1,
                        (prefer_side ? subcontrol_origin_secondary.y :
                        subcontrol_origin_primary.y) + 1, prefer_side ? icon_right_secondary :
                        icon_right_primary, prefer_side ? icon_size_secondary :
                        icon_size_primary, DISPLAY_COLOR_BLACK);
                }
                display_draw_image(prefer_side, orientation, prefer_side ?
                    subcontrol_origin_secondary.x : subcontrol_origin_primary.x,
                    prefer_side ? subcontrol_origin_secondary.y :
                    subcontrol_origin_primary.y, prefer_side ? icon_right_secondary :
                    icon_right_primary, prefer_side ? icon_size_secondary :
                    icon_size_primary, active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
            }
            else
            {
                if (!active)
                {
                    display_draw_image(0, orientation, subcontrol_origin_primary.x + 1,
                        subcontrol_origin_primary.y + 1, icon_right_primary, icon_size_primary,
                        DISPLAY_COLOR_BLACK);
                    display_draw_image(1, orientation, subcontrol_origin_secondary.x + 1,
                        subcontrol_origin_secondary.y + 1, icon_right_secondary,
                        icon_size_secondary, DISPLAY_COLOR_BLACK);
                }
                display_draw_image(0, orientation, subcontrol_origin_primary.x,
                    subcontrol_origin_primary.y, icon_right_primary, icon_size_primary,
                    active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
                display_draw_image(1, orientation, subcontrol_origin_secondary.x,
                    subcontrol_origin_secondary.y, icon_right_secondary, icon_size_secondary,
                    active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
            }

            int item_text_length;
            display_vector_t item_text_size;
            text_position_descriptor_t *content_measure_result = font_measure_text(items[
                item_index].options[items[item_index].current_value], DISPLAY_FORMAT_PAL, 0,
                &item_text_length, &item_text_size);
            text_position_descriptor_t *content_measure_primary = font_measure_text(items[
                item_index].options[items[item_index].current_value], formats[0], 0,
                NULL, NULL);
            text_position_descriptor_t *content_measure_secondary = font_measure_text(items[
                item_index].options[items[item_index].current_value], formats[1], 0,
                NULL, NULL);
            subcontrol_origin.x -= item_text_size.x;
            subcontrol_origin.y += 3;
            subcontrol_origin_primary = display_vector_compensation(
                &subcontrol_origin, formats[0]
            );
            subcontrol_origin_secondary = display_vector_compensation(
                &subcontrol_origin, formats[1]
            );
            if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
            {
                if (!active)
                {
                    display_draw_text(prefer_side, orientation, (prefer_side ?
                        subcontrol_origin_secondary.x : subcontrol_origin_primary.x) + 1,
                        (prefer_side ? subcontrol_origin_secondary.y :
                        subcontrol_origin_primary.y) + 1, prefer_side ?
                        content_measure_secondary : content_measure_primary, item_text_length,
                        DISPLAY_COLOR_BLACK, formats[prefer_side]);
                }
                display_draw_text(prefer_side, orientation, prefer_side ?
                    subcontrol_origin_secondary.x : subcontrol_origin_primary.x,
                    prefer_side ? subcontrol_origin_secondary.y :
                    subcontrol_origin_primary.y, prefer_side ?
                    content_measure_secondary : content_measure_primary, item_text_length,
                    active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE, formats[prefer_side]);

            }
            else
            {
                if (!active)
                {
                    display_draw_text(0, orientation, subcontrol_origin_primary.x + 1,
                        subcontrol_origin_primary.y + 1, content_measure_primary,
                        item_text_length, DISPLAY_COLOR_BLACK, formats[0]);
                    display_draw_text(1, orientation, subcontrol_origin_secondary.x + 1,
                        subcontrol_origin_secondary.y + 1, content_measure_secondary,
                        item_text_length, DISPLAY_COLOR_BLACK, formats[1]);
                }
                display_draw_text(0, orientation, subcontrol_origin_primary.x,
                    subcontrol_origin_primary.y, content_measure_primary,
                    item_text_length, active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE,
                    formats[0]);
                display_draw_text(1, orientation, subcontrol_origin_secondary.x,
                    subcontrol_origin_secondary.y, content_measure_secondary,
                    item_text_length, active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE,
                    formats[1]);
            }
            free(content_measure_result);
            free(content_measure_primary);
            free(content_measure_secondary);

            subcontrol_origin.x -= icon_size_raw;
            subcontrol_origin.y -= 3;
            subcontrol_origin_primary = display_vector_compensation(
                &subcontrol_origin, formats[0]
            );
            subcontrol_origin_secondary = display_vector_compensation(
                &subcontrol_origin, formats[1]
            );
            if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
            {
                if (!active)
                {
                    display_draw_image(prefer_side, orientation, (prefer_side ?
                        subcontrol_origin_secondary.x : subcontrol_origin_primary.x) + 1,
                        (prefer_side ? subcontrol_origin_secondary.y :
                        subcontrol_origin_primary.y) + 1, prefer_side ? icon_left_secondary :
                        icon_left_primary, prefer_side ? icon_size_secondary :
                        icon_size_primary, DISPLAY_COLOR_BLACK);
                }
                display_draw_image(prefer_side, orientation, prefer_side ?
                    subcontrol_origin_secondary.x : subcontrol_origin_primary.x,
                    prefer_side ? subcontrol_origin_secondary.y :
                    subcontrol_origin_primary.y, prefer_side ? icon_left_secondary :
                    icon_left_primary, prefer_side ? icon_size_secondary :
                    icon_size_primary, active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
            }
            else
            {
                if (!active)
                {
                    display_draw_image(0, orientation, subcontrol_origin_primary.x + 1,
                        subcontrol_origin_primary.y + 1, icon_left_primary, icon_size_primary,
                        DISPLAY_COLOR_BLACK);
                    display_draw_image(1, orientation, subcontrol_origin_secondary.x + 1,
                        subcontrol_origin_secondary.y + 1, icon_left_secondary,
                        icon_size_secondary, DISPLAY_COLOR_BLACK);
                }
                display_draw_image(0, orientation, subcontrol_origin_primary.x,
                    subcontrol_origin_primary.y, icon_left_primary, icon_size_primary,
                    active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
                display_draw_image(1, orientation, subcontrol_origin_secondary.x,
                    subcontrol_origin_secondary.y, icon_left_secondary, icon_size_secondary,
                    active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
            }
        }
        break;
        case UI_MENU_ITEM_SWITCH:
        {
            char icon_primary[60], icon_secondary[60];
            char selected_icon[30];
            sprintf(selected_icon, items[item_index].current_value ?
                    "check_box" : "check_box_unchecked");
            int icon_size_raw, icon_size_primary, icon_size_secondary;
            display_get_icon(selected_icon, DISPLAY_FORMAT_PAL, false, NULL, &icon_size_raw);
            display_get_icon(selected_icon, formats[0], false, icon_primary,
                             &icon_size_primary);
            display_get_icon(selected_icon, formats[1], false, icon_secondary,
                             &icon_size_secondary);

            // Draw content
            subcontrol_origin.x -= icon_size_raw;
            subcontrol_origin_primary = display_vector_compensation(
                &subcontrol_origin, formats[0]
            );
            subcontrol_origin_secondary = display_vector_compensation(
                &subcontrol_origin, formats[1]
            );
            if (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
            {
                if (!active)
                {
                    display_draw_image(prefer_side, orientation, (prefer_side ?
                        subcontrol_origin_secondary.x : subcontrol_origin_primary.x) + 1,
                        (prefer_side ? subcontrol_origin_secondary.y :
                        subcontrol_origin_primary.y) + 1, prefer_side ? icon_secondary :
                        icon_primary, prefer_side ? icon_size_secondary :
                        icon_size_primary, DISPLAY_COLOR_BLACK);
                }
                display_draw_image(prefer_side, orientation, prefer_side ?
                    subcontrol_origin_secondary.x : subcontrol_origin_primary.x,
                    prefer_side ? subcontrol_origin_secondary.y :
                    subcontrol_origin_primary.y, prefer_side ? icon_secondary :
                    icon_primary, prefer_side ? icon_size_secondary :
                    icon_size_primary, active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
            }
            else
            {
                if (!active)
                {
                    display_draw_image(0, orientation, subcontrol_origin_primary.x + 1,
                        subcontrol_origin_primary.y + 1, icon_primary, icon_size_primary,
                        DISPLAY_COLOR_BLACK);
                    display_draw_image(1, orientation, subcontrol_origin_secondary.x + 1,
                        subcontrol_origin_secondary.y + 1, icon_secondary,
                        icon_size_secondary, DISPLAY_COLOR_BLACK);
                }
                display_draw_image(0, orientation, subcontrol_origin_primary.x,
                    subcontrol_origin_primary.y, icon_primary, icon_size_primary,
                    active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
                display_draw_image(1, orientation, subcontrol_origin_secondary.x,
                    subcontrol_origin_secondary.y, icon_secondary, icon_size_secondary,
                    active ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
            }
        }
        break;
        default:
            break;
    }
    display_rect_expand(&item_rect_primary, 1, 1);
    display_rect_expand(&item_rect_secondary, 1, 1);
    display_update(0, orientation, &item_rect_primary);
    display_update(1, orientation, &item_rect_secondary);
}