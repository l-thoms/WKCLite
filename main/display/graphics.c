#include <stdint.h>
#include <stddef.h>
#include <math.h>
#include "esp_heap_caps.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "graphics.h"
#include "display_control.h"
#include "string.h"
#include "font_management.h"
#include "io/filesystem.h"

#define DISPLAY_RANGE_CHECK(end)                                                \
if(orientation == DISPLAY_ORIENTATION_HORIZONTAL)                                   \
{                                                                               \
    if(x < 0 || x >= DISPLAY_WIDTH_PAL || y < 0 || y >= DISPLAY_HEIGHT_PAL)     \
        end;                                                                    \
}                                                                               \
else                                                                            \
{                                                                               \
    if(x < 0 || x >= DISPLAY_HEIGHT_PAL || y < 0 || y >= DISPLAY_WIDTH_PAL)     \
        end;                                                                    \
}

void display_rect_translate(display_rect_t *rect, int x, int y)
{
    rect->x += x;
    rect->y += y;
}

void display_rect_expand(display_rect_t *rect, int x, int y)
{
    rect->x -= x;
    rect->y -= y;
    rect->width += x * 2;
    rect->height += y * 2;
}

void display_rect_union(display_rect_t *result, display_rect_t *item)
{
    int result_right = result->x + result->width;
    int item_right = item->x + item->width;
    int result_bottom = result->y + result->height;
    int item_bottom = item->y + item->height;
    if (item->x < result->x) result->x = item->x;
    if (item->y < result->y) result->y = item->y;
    if (item_right < result_right) result->width = result_right - result->x;
    else result->width = item_right - result->x;
    if (item_bottom < result_bottom) result->height = result_bottom - result->y;
    else result->height = item_bottom - result->y;
}

void display_vector_translate(display_vector_t *vector, int x, int y)
{
    vector->x += x;
    vector->y += y;
}
void display_line_translate(display_line_t *line, int x, int y)
{
    display_vector_translate((display_vector_t*)line, x, y);
    display_vector_translate((display_vector_t*)&line->x2, x, y);
}

display_vector_t display_coordinate_compensation(int x, int y, display_format_t format)
{
    if(format == DISPLAY_FORMAT_NTSC)
    {
        x = (int)roundf(x / 12.0f * 10);
        y = (int)roundf(y / 12.0f * 10);
    }
    return (display_vector_t) {.x = x, .y = y };
}

display_vector_t display_vector_compensation(display_vector_t *vector, display_format_t format)
{
    return display_coordinate_compensation(vector->x, vector->y, format);
}

display_rect_t display_rect_compensation(display_rect_t *rect, display_format_t format)
{
    display_vector_t position = display_coordinate_compensation(rect->x, rect->y,
                                                                format);
    display_vector_t size = display_coordinate_compensation(rect->width, rect->height,
                                                            format);
    return (display_rect_t) {
        .x = position.x, .y = position.y,
        .width = size.x, .height = size.y
    };
}

display_line_t display_line_compensation(display_line_t *line, display_format_t format)
{
    display_vector_t v1 = display_coordinate_compensation(line->x1, line->y1, format);
    display_vector_t v2 = display_coordinate_compensation(line->x2, line->y2, format);
    return (display_line_t) {
        .x1 = v1.x, .y1 = v1.y, .x2 = v2.x, .y2 = v2.y
    };
}

static bool ntsc_vert(int screen_index, display_orientation_t orientation)
{
    display_format_t current_format[2];
    display_control_get_formats(current_format);
    if (orientation != DISPLAY_ORIENTATION_HORIZONTAL &&
        current_format[screen_index % 2] == DISPLAY_FORMAT_NTSC)
        return true;
    else return false;
}

// NTSC format will be cropped
void display_set_pixel(int screen_index, display_orientation_t orientation, int x, int y,
                       display_color_t color)
{
    DISPLAY_RANGE_CHECK(return);
    switch (color)
    {
    case DISPLAY_COLOR_BLACK:
    case DISPLAY_COLOR_WHITE:
    case DISPLAY_COLOR_TRANSPARENT:
        if (orientation == DISPLAY_ORIENTATION_HORIZONTAL &&
           (x < 0 || x >= DISPLAY_WIDTH_PAL || y < 0 || y >= DISPLAY_HEIGHT_PAL) ||
           (orientation != DISPLAY_ORIENTATION_HORIZONTAL) &&
           (y < 0 || y >= DISPLAY_WIDTH_PAL || x < 0 || x >= DISPLAY_HEIGHT_PAL)) return;

        int pixel_index;
        if(orientation == DISPLAY_ORIENTATION_HORIZONTAL)
            pixel_index = y * DISPLAY_WIDTH_PAL + x;
        else pixel_index = x * DISPLAY_WIDTH_PAL + (ntsc_vert(screen_index, orientation) ?
                           DISPLAY_WIDTH_NISC : DISPLAY_WIDTH_PAL) - 1 - y;
        if (pixel_index < 0 || pixel_index >= DISPLAY_WIDTH_PAL * DISPLAY_HEIGHT_PAL) return;

        uint16_t *buffer_uint16 = screen_index == 0 ?
                                  (uint16_t*)display_control_get_primary_main_buffer() :
                                  screen_index == 1 ?
                                  (uint16_t*)display_control_get_secondary_main_buffer() :
                                  screen_index == 2 ?
                                  (uint16_t*)display_control_get_primary_overlay_buffer() :
                                  screen_index == 3 ?
                                  (uint16_t*)display_control_get_secondary_overlay_buffer() :
                                  NULL;
        if (!buffer_uint16)
            return;
        buffer_uint16[pixel_index / 8] &= ~(3 << ((7 - pixel_index % 8) * 2));
        buffer_uint16[pixel_index / 8] |= color << (7 - pixel_index % 8) * 2;
        break;

    default:
        return;
    }
}

void display_update(int screen_index, display_orientation_t orientation, display_rect_t *range)
{
    display_control_record_operate_time();
    uint16_t *buffer_main, *buffer_overlay, *buffer;
    if (screen_index == 0)
    {
        buffer_main = (uint16_t*)display_control_get_primary_main_buffer();
        buffer_overlay = (uint16_t*)display_control_get_primary_overlay_buffer();
        buffer = (uint16_t*)display_control_get_primary_frame_buffer();
    }
    else
    {
        buffer_main = (uint16_t*)display_control_get_secondary_main_buffer();
        buffer_overlay = (uint16_t*)display_control_get_secondary_overlay_buffer();
        buffer = (uint16_t*)display_control_get_secondary_frame_buffer();
    }
    int internal_mask, data_index;
    uint16_t extract;
    for (int y = range->y; y < range->y + range->height; y++)
    {
        for (int x = range->x; x < range->x + range->width; x++)
        {
            DISPLAY_RANGE_CHECK(continue);
            int pixel_index;
            if(orientation == DISPLAY_ORIENTATION_HORIZONTAL)
                pixel_index = y * DISPLAY_WIDTH_PAL + x;
            else pixel_index = x * DISPLAY_WIDTH_PAL + (ntsc_vert(screen_index, orientation) ?
                               DISPLAY_WIDTH_NISC : DISPLAY_WIDTH_PAL) - 1 - y;
            internal_mask = 3 << (7 - pixel_index % 8) * 2;
            data_index = pixel_index / 8;
            extract = buffer[data_index] & ~internal_mask;
            if ((buffer_overlay[data_index] >> (7 - pixel_index % 8) * 2) & 2)
                extract |= buffer_overlay[data_index] & internal_mask;
            else
                extract |= buffer_main[data_index] & internal_mask;
            buffer[data_index] = extract;
        }
    }
}

void display_fill_rect(int screen_index, display_orientation_t orientation, display_rect_t *rect,
                       display_color_t color)
{
    display_control_record_operate_time();
    for(int y = rect->y; y < rect->y + rect->height; y++)
        for(int x = rect->x; x < rect->x + rect->width; x++)
            display_set_pixel(screen_index, orientation, x, y, color);
}

void display_fill_ellipse(int screen_index, display_orientation_t orientation,
                          display_rect_t *rect, display_color_t color)
{
    display_control_record_operate_time();
    if(rect->width <= 2 || rect->height <= 2)
    {
        display_fill_rect(screen_index, orientation, rect, color);
        return;
    }
    float ox = rect->x + rect->width / 2.0f - 0.5f,
          oy = rect->y + rect->height / 2.0f - 0.5f;
    for(int y = rect->y; y < rect->y + rect->height; y++)
        for(int x = rect->x; x < rect->x + rect->width; x++)
        {
            float func = powf(x - ox, 2) / powf(rect->width / 2.0f, 2) +
                         powf(y - oy, 2) / powf(rect->height / 2.0f, 2);
            if(func <= 1)
                display_set_pixel(screen_index, orientation, x, y, color);
        }
}

void display_fill_rounded_rect(int screen_index, display_orientation_t orientation,
                               display_rect_t *rect, display_color_t color, int corner_radius)
{
    display_rect_t c1 = { .x = rect->x, .y = rect->y,
        .width = corner_radius * 2, .height = corner_radius * 2 },
    c2 = { .x = c1.x, .y = rect->y + rect->height - corner_radius * 2,
        .width = c1.width, .height = c1.height },
    c3 = { .x = rect->x + rect->width - corner_radius * 2, .y = c1.y,
        .width = c1.width, .height = c1.height },
    c4 = { .x = c3.x, .y = c2.y, .width = c1.width, .height = c1.height },
    r1 = { .x = c1.x, .y = rect->y + corner_radius, .width = corner_radius,
        .height = rect->height - corner_radius * 2 },
    r2 = { .x = rect->x + corner_radius, .y = c1.y,
        .width = rect->width - corner_radius * 2, .height = rect->height},
    r3 = { .x = c1.x + r1.width + r2.width, .y = r1.y, .width = corner_radius,
        .height = r1.height };

    display_fill_ellipse(screen_index, orientation, &c1, color);
    display_fill_rect(screen_index, orientation, &r1, color);
    display_fill_ellipse(screen_index, orientation, &c3, color);
    display_fill_rect(screen_index, orientation, &r2, color);
    display_fill_ellipse(screen_index, orientation, &c2, color);
    display_fill_rect(screen_index, orientation, &r3, color);
    display_fill_ellipse(screen_index, orientation, &c4, color);
}

void display_draw_line(int screen_index, display_orientation_t orientation, display_line_t *line,
                       display_color_t color, int stroke)
{
    display_control_record_operate_time();
    display_rect_t bound = {
        .x = line->x1 < line->x2 ? line->x1 : line->x2,
        .y = line->y1 < line->y2 ? line->y1 : line->y2,
        .width = abs(line->x1 - line->x2),
        .height = abs(line->y1 - line->y2)
    };
    if(bound.width == 0)
        display_fill_rect(screen_index, orientation, &(display_rect_t) { .x = bound.x - stroke / 2, .y = bound.y,
            .width = stroke, .height = bound.height }, color);
    else if(bound.height == 0)
        display_fill_rect(screen_index, orientation, &(display_rect_t) { .x = bound.x, .y = bound.y - stroke / 2,
            .width = bound.width, .height = stroke }, color);
    else
    {
        float deg = atan2f(line->y2 - line->y1, line->x2 - line->x1);
        float k = tanf(deg);
        float b = line->y1 - k * line->x1;
        float comp = fminf(1 / fabsf(sinf(deg)), 1 / fabsf(cosf(deg))) * stroke;
        float length = sqrtf(powf(line->x2 - line->x1, 2) + powf(line->y2 - line->y1, 2));
        for(int y = bound.y - comp; y < bound.y + bound.height + comp; y++)
            for(int x = bound.x - comp; x < bound.x + bound.width + comp; x++)
            {
                float d = fabsf((k * x - y + b)) / sqrtf(powf(k, 2) + 1);
                float inc_ang = ((x - line->x1) * (line->x2 - line->x1) +
                                 (y - line->y1) * (line->y2 - line->y1)) /
                                 sqrtf(powf(x - line->x1, 2) + powf(y - line->y1, 2)) /
                                 length;
                if(inc_ang < 0 ||
                   sqrtf(powf(x - line->x1, 2) + powf(y - line->y1, 2)) * inc_ang > length)
                   continue;

                if(d <= stroke / 2.0f) display_set_pixel(screen_index, orientation, x, y, color);
            }
    }
}

void display_draw_rect(int screen_index, display_orientation_t orientation, display_rect_t *rect,
                       display_color_t color, int stroke)
{
    display_line_t l1 = { .x1 = rect->x - stroke / 2, .y1 = rect->y,
        .x2 = rect->x + rect->width + stroke / 2, .y2 = rect->y },
    l2 = { .x1 = l1.x1, .y1 = rect->y + rect->height, .x2 = l1.x2, .y2 = rect->y + rect->height },
    l3 = { .x1 = rect->x, .y1 = rect->y - stroke / 2, .x2 = rect->x,
        .y2 = rect->y + rect->height + stroke / 2},
    l4 = { .x1 = rect->x + rect->width, .y1 = l3.y1, .x2 = rect->x + rect->width, .y2 = l3.y2 };
    if(stroke % 2 == 1) l2.x2 += 1;
    display_draw_line(screen_index, orientation, &l1, color, stroke);
    display_draw_line(screen_index, orientation, &l2, color, stroke);
    display_draw_line(screen_index, orientation, &l3, color, stroke);
    display_draw_line(screen_index, orientation, &l4, color, stroke);
}

void display_draw_ellipse(int screen_index, display_orientation_t orientation,
                          display_rect_t *rect, display_color_t color, int stroke)
{
    display_control_record_operate_time();
    float a = rect->width / 2.0f;
    float b = rect->height / 2.0f;
    float ox = rect->x + a - 0.5f;
    float oy = rect->y + b - 0.5f;
    float a2 = a * a;
    float b2 = b * b;
    float half_stroke = stroke / 2.0f;

    int start_x = (int)roundf(ox - a - half_stroke);
    int end_x = (int)roundf(ox + a + half_stroke);
    int start_y = (int)roundf(oy - b - half_stroke);
    int end_y = (int)roundf(oy + b + half_stroke);

    for (int y = start_y; y <= end_y; y++)
    {
        for (int x = start_x; x <= end_x; x++)
        {
            float dx = x - ox;
            float dy = y - oy;
            float F = (dx*dx)/a2 + (dy*dy)/b2 - 1.0f;
            float grad_x = 2 * dx / a2;
            float grad_y = 2 * dy / b2;
            float grad_len = sqrtf(grad_x*grad_x + grad_y*grad_y);

            if (grad_len < 1e-6) continue;

            float normal_dist = fabsf(F) / grad_len;
            if (normal_dist <= half_stroke)
            {
                display_set_pixel(screen_index, orientation, x, y, color);
            }
        }
    }
}

void display_draw_rounded_rect(int screen_index, display_orientation_t orientation,
                               display_rect_t *rect, display_color_t color, int corner_radius,
                               int stroke)
{
    display_control_record_operate_time();
    // Draw corners
    for(int i = 0; i < 4; i++)
    {
        float ox, oy;
        display_rect_t bound = {
            .width = corner_radius + stroke / 2 + 1,
            .height = corner_radius + stroke / 2 + 1
        };
        if (i == 0)
        {
            ox = rect->x + corner_radius;
            oy = rect->y + corner_radius;
            bound.x = rect->x - stroke / 2;
            bound.y = rect->y - stroke / 2;
        }
        else if (i == 1)
        {
            ox = rect->x + rect->width - corner_radius - (stroke % 2 == 0);
            oy = rect->y + corner_radius;
            bound.x = ox;
            bound.y = rect->y - stroke / 2;
        }
        else if (i == 2)
        {
            ox = rect->x + corner_radius;
            oy = rect->y + rect->height - corner_radius - (stroke % 2 == 0);
            bound.x = rect->x - stroke / 2;
            bound.y = oy;
        }
        else
        {
            ox = rect->x + rect->width - corner_radius - (stroke % 2 == 0);
            oy = rect->y + rect->height - corner_radius - (stroke % 2 == 0);
            bound.x = ox;
            bound.y = oy;
        }
        for(int y = bound.y; y < bound.y + bound.height; y++)
            for(int x = bound.x; x < bound.x + bound.width; x++)
            {
                float r = sqrtf(powf(x - ox, 2) + powf(y - oy, 2));
                if(fabsf(r - corner_radius) <= stroke / 2.0f) display_set_pixel(screen_index, orientation, x, y, color);
            }
    }
    // Draw remains
    display_line_t l1 = { .x1 = rect->x + corner_radius, .y1 = rect->y,
        .x2 = rect->x + rect->width - corner_radius, .y2 = rect->y },
    l2 = { .x1 = l1.x1, .y1 = rect->y + rect->height, .x2 = l1.x2, .y2 = rect->y + rect->height },
    l3 = { .x1 = rect->x, .y1 = rect->y + corner_radius, .x2 = rect->x,
        .y2 = rect->y + rect->height - corner_radius},
    l4 = { .x1 = rect->x + rect->width, .y1 = l3.y1, .x2 = rect->x + rect->width, .y2 = l3.y2 };
    display_draw_line(screen_index, orientation, &l1, color, stroke);
    display_draw_line(screen_index, orientation, &l2, color, stroke);
    display_draw_line(screen_index, orientation, &l3, color, stroke);
    display_draw_line(screen_index, orientation, &l4, color, stroke);
}

static int get_bit_from_buffer(uint8_t *buffer, int index)
{
    int byte_index = index / 8;
    return (buffer[byte_index] >> (index % 8)) & 1;
}

void display_draw_single_char(int screen_index, display_orientation_t orientation, int x, int y,
                              display_color_t color, display_format_t format, int code_point)
{
    display_control_record_operate_time();
    int y_offset = format == DISPLAY_FORMAT_NTSC ? -2 : 0;
    int width, start_position, page_width;
    size_t page_size;
    font_get_glyph_width(code_point, &width, &start_position, format);
    if(width <= 0) return;
    bool preloaded;
    uint8_t *page = font_get_page((uint8_t)(code_point >> 8), format, &page_size,
                                  &preloaded);
    if(page == NULL) return;
    page_width = page_size / FONT_FILE_HEIGHT;
    for(int by = 0; by < FONT_FILE_HEIGHT; by++)
        for (int bx = start_position; bx < start_position + width; bx++)
        {
            int bindex = by * page_width + bx;
            if(get_bit_from_buffer(page, bindex))
                display_set_pixel(screen_index, orientation, x + bx - start_position, y + by + y_offset, color);
        }
    if(!preloaded)
        free(page);
}

void display_draw_text(int screen_index, display_orientation_t orientation, int x, int y,
                       text_position_descriptor_t *descriptor, int length,
                       display_color_t color, display_format_t format)
{
    for(int i = 0; i < length; i++)
        display_draw_single_char(screen_index, orientation, descriptor[i].x + x, descriptor[i].y + y,
            color, format, descriptor[i].utf16_char);
}

void display_draw_image(int screen_index, display_orientation_t orientation, int x, int y,
                        char *path, int source_width, display_color_t color)
{
    display_control_record_operate_time();
    size_t image_size;
    if (wkc_get_file_size(path, &image_size)) return;
    uint8_t *image = (uint8_t*)heap_caps_malloc(image_size, MALLOC_CAP_SPIRAM);
    if (image == NULL) return;
    wkc_open(path, (char*)image, image_size);
    int source_height = image_size * 8 / source_width;
    for(int iy = 0; iy < source_height; iy++)
        for(int ix = 0; ix < source_width; ix++)
        {
            int index = iy * source_width + ix;
            if(image[index / 8] & (1 << (index % 8)))
            display_set_pixel(screen_index, orientation, ix + x, iy + y, color);
        }
    free(image);
}

void display_get_icon(const char *name, display_format_t format,
                      bool prefer_large, char *icon, int *actual_width)
{
    if (name == NULL) return;
    if (format == DISPLAY_FORMAT_UNDEFINDED) format = DISPLAY_FORMAT_PAL;
    if (icon)
        sprintf(icon, "/data_static/images/%s_%s_%s.bin",
                name,
                prefer_large ? "large" : "small",
                format == DISPLAY_FORMAT_NTSC ? "ntsc" : "pal");
    if (actual_width != NULL)
    {
        if (format == DISPLAY_FORMAT_NTSC)
            *actual_width = prefer_large ? 40 : 20;
        else
            *actual_width = prefer_large ? 48 : 24;
    }
}

void display_get_icon_indexed(const char *name, display_format_t format,bool prefer_large,
                              int index, char *icon, int *actual_width)
{
    if(name == NULL) return;
    int name_length = strlen(name);
    int num_length = (int)ceil(log10(index + 1));
    char name_indexed[name_length + num_length + 1];
    sprintf(name_indexed, "%s_%d", name, index);
    display_get_icon(name_indexed, format, prefer_large, icon, actual_width);
}