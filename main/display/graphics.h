#pragma once

#include "font_management.h"
#include "display_common.h"

#define DISPLAY_CLEAR_SCREEN(index) do {                                               \
display_fill_rect(index, DISPLAY_ORIENTATION_HORIZONTAL, &(display_rect_t) {          \
    .x = 0, .y = 0, .width = DISPLAY_WIDTH_PAL, .height = DISPLAY_HEIGHT_PAL        \
}, DISPLAY_COLOR_TRANSPARENT);                                                      \
display_update(index, DISPLAY_ORIENTATION_HORIZONTAL, &(display_rect_t) {             \
    .x = 0, .y = 0, .width = DISPLAY_WIDTH_PAL, .height = DISPLAY_HEIGHT_PAL        \
});} while(0)

void display_rect_translate(display_rect_t *rect, int x, int y);
void display_rect_expand(display_rect_t *rect, int x, int y);
void display_rect_union(display_rect_t *result, display_rect_t *item);
void display_vector_translate(display_vector_t *vector, int x, int y);
void display_line_translate(display_line_t *line, int x, int y);
display_vector_t display_coordinate_compensation(int x, int y, display_format_t format);
display_vector_t display_vector_compensation(display_vector_t *vector, display_format_t format);
display_rect_t display_rect_compensation(display_rect_t *rect, display_format_t format);
display_line_t display_line_compensation(display_line_t *line, display_format_t format);
void display_set_pixel(int screen_index, display_orientation_t orientation, int x, int y,
                       display_color_t color);
void display_update(int screen_index, display_orientation_t orientation, display_rect_t *range);
void display_fill_rect(int screen_index, display_orientation_t orientation, display_rect_t *rect,
                       display_color_t color);
void display_fill_ellipse(int screen_index, display_orientation_t orientation, display_rect_t *rect,
                          display_color_t color);
void display_fill_rounded_rect(int screen_index, display_orientation_t orientation,
                               display_rect_t *rect, display_color_t color, int corner_radius);
void display_draw_line(int screen_index, display_orientation_t orientation, display_line_t *line,
                       display_color_t color, int stroke);
void display_draw_rect(int screen_index, display_orientation_t orientation, display_rect_t *rect,
                       display_color_t color, int stroke);
void display_draw_ellipse(int screen_index, display_orientation_t orientation, display_rect_t *rect,
                          display_color_t color, int stroke);
void display_draw_rounded_rect(int screen_index, display_orientation_t orientation,
                               display_rect_t *rect, display_color_t color, int corner_radius,
                               int stroke);
void display_draw_single_char(int screen_index, display_orientation_t orientation, int x, int y,
                              display_color_t color, display_format_t format, int code_point);
void display_draw_text(int screen_index, display_orientation_t orientation, int x, int y,
                       text_position_descriptor_t *descriptor, int length, display_color_t color,
                       display_format_t format);
void display_draw_image(int screen_index, display_orientation_t orientation, int x, int y,
                        char *path, int source_width, display_color_t color);
void display_get_icon(const char *name, display_format_t format,
                      bool prefer_large, char *icon, int *actual_width);
void display_get_icon_indexed(const char *name, display_format_t format,
                              bool prefer_large,
                              int index, char *icon, int *actual_width);
void display_record_operate_time();
void display_cancel_operate_time();