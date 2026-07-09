#include <stdio.h>
#include <stdlib.h>
#include <iconv.h>
#include <locale.h>
#include <string.h>
#include <errno.h>
#include "esp_log.h"
#include "graphics.h"
#include "font_management.h"
#include "io/filesystem.h"
#include "esp_heap_caps.h"

#define FONT_PATH "/data_fonts/"
#define SUFFIX_NTSC "ntsc.bin"
#define SUFFIX_PAL "pal.bin"
#define SUFFIX_SIZE_PAL "pal.size"
#define SUFFIX_SIZE_NTSC "ntsc.size"

#define TAG "FONT_MANAGEMENT"

static uint8_t *pal_page_buffer[256], *ntsc_page_buffer[256];
static uint8_t *pal_size_buffer[256], *ntsc_size_buffer[256];
static int pal_page_size[256], ntsc_page_size[256];

static void font_preload_format(display_format_t format)
{
    uint8_t **selected_page, **selected_size;
    int *selected_page_size;

    if(format == DISPLAY_FORMAT_NTSC)
    {
        selected_page = ntsc_page_buffer;
        selected_size = ntsc_size_buffer;
        selected_page_size = ntsc_page_size;
    }
    else
    {
        selected_page = pal_page_buffer;
        selected_size = pal_size_buffer;
        selected_page_size = pal_page_size;
    }

    // Clean loaded font
    bool page_freed = false, size_freed = false;
    for(int i = 0; i < 256; i++)
    {
        if(selected_page[i] != NULL)
        {
            if (!page_freed)
            {
                free(selected_page[i]);
                page_freed = true;
            }
            selected_page[i] = NULL;
        }
        if(selected_size[i] != NULL)
        {
            if (!size_freed)
            {
                free(selected_size[i]);
                size_freed = true;
            }
            selected_size[i] = NULL;
        }
        selected_page_size[i] = 0;
    }

    char size_chars[strlen(FONT_PATH) + 20];
    char page_chars[strlen(FONT_PATH) + 20];

    char selected_suffix_size[20], selected_suffix[20];

    if(format == DISPLAY_FORMAT_NTSC)
    {
        strcpy(selected_suffix_size, SUFFIX_SIZE_NTSC);
        strcpy(selected_suffix, SUFFIX_NTSC);
    }
    else
    {
        strcpy(selected_suffix_size, SUFFIX_SIZE_PAL);
        strcpy(selected_suffix, SUFFIX_PAL);
    }
    sprintf(size_chars, "%s%s", FONT_PATH, selected_suffix_size);
    sprintf(page_chars, "%s%s", FONT_PATH, selected_suffix);

    size_t size_length, page_length;
    if (wkc_get_file_size(size_chars, &size_length) ||
        size_length < 65536 ||
        wkc_get_file_size(page_chars, &page_length))
        return;

    uint8_t *sizes = (uint8_t*)heap_caps_calloc(65536, 1, MALLOC_CAP_SPIRAM);
    uint8_t *pages = (uint8_t*)heap_caps_calloc(page_length, 1, MALLOC_CAP_SPIRAM);
    wkc_open(size_chars, (char*)sizes, size_length);
    wkc_open(page_chars, (char*)pages, page_length);

    int read_pos = 0;
    for (int p = 0; p < 256; p++)
    {
        selected_page_size[p] = 0;
        int g = 0, page_length = 0;
        while (g < 256)
            page_length += sizes[p * 256 + (g++)];
        if (page_length == 0) continue;
        selected_size[p] = &sizes[p * 256];
        selected_page[p] = &pages[read_pos];
        selected_page_size[p] = (int)ceilf(page_length * FONT_FILE_HEIGHT / 8.f);
        read_pos += selected_page_size[p];
    }
}

void font_preload()
{
    font_preload_format(DISPLAY_FORMAT_PAL);
    font_preload_format(DISPLAY_FORMAT_NTSC);
}

static uint16_t *string_to_utf_16(char *text, int *output_length)
{
    if (text == NULL || output_length == NULL)
    {
        return NULL;
    }

    int utf8_len = strlen(text);
    int utf16_len = 0;
    int i = 0;

    while (i < utf8_len)
    {
        unsigned char c = (unsigned char)text[i];
        if ((c & 0x80) == 0)
        {
            utf16_len++;
            i++;
        }
        else if ((c & 0xE0) == 0xC0)
        {
            utf16_len++;
            i += 2;
        }
        else if ((c & 0xF0) == 0xE0)
        {
            utf16_len++;
            i += 3;
        }
        else if ((c & 0xF8) == 0xF0)
        {
            utf16_len += 2;
            i += 4;
        }
        else
        {
            *output_length = 0;
            return NULL;
        }

        if (i > utf8_len)
        {
            *output_length = 0;
            return NULL;
        }
    }

    uint16_t *utf16_str = (uint16_t *)malloc(utf16_len * sizeof(uint16_t));
    if (utf16_str == NULL)
    {
        *output_length = 0;
        return NULL;
    }

    i = 0;
    int j = 0;
    while (i < utf8_len && j < utf16_len)
    {
        unsigned char c = (unsigned char)text[i];
        uint32_t codepoint = 0;

        if ((c & 0x80) == 0)
        {
            codepoint = c;
            utf16_str[j++] = (uint16_t)codepoint;
            i++;
        }
        else if ((c & 0xE0) == 0xC0)
        {
            codepoint = ((c & 0x1F) << 6) | ((unsigned char)text[i+1] & 0x3F);
            utf16_str[j++] = (uint16_t)codepoint;
            i += 2;
        }
        else if ((c & 0xF0) == 0xE0)
        {
            codepoint = ((c & 0x0F) << 12) | (((unsigned char)text[i+1] & 0x3F) << 6) | ((unsigned char)text[i+2] & 0x3F);
            utf16_str[j++] = (uint16_t)codepoint;
            i += 3;
        }
        else if ((c & 0xF8) == 0xF0)
        {
            codepoint = ((c & 0x07) << 18) | (((unsigned char)text[i+1] & 0x3F) << 12) |
                        (((unsigned char)text[i+2] & 0x3F) << 6) | ((unsigned char)text[i+3] & 0x3F);

            codepoint -= 0x10000;
            utf16_str[j++] = 0xD800 | ((codepoint >> 10) & 0x03FF);
            utf16_str[j++] = 0xDC00 | (codepoint & 0x03FF);
            i += 4;
        }
        else
        {
            free(utf16_str);
            *output_length = 0;
            return NULL;
        }
    }
    *output_length = utf16_len;
    return utf16_str;
}

static bool font_get_glyph_width_preloaded(int code_point, int *width, int *start_position,
                                    display_format_t format)
{
    if(width == NULL) return true;
    uint8_t **selected_size;
    if(format == DISPLAY_FORMAT_NTSC)
        selected_size = ntsc_size_buffer;
    else
        selected_size = pal_size_buffer;

    int code_point_msb = (code_point >> 8) % 256;
    if(selected_size[code_point_msb] == NULL) return true;
    *width = selected_size[code_point_msb][code_point % 256];
    if(start_position != NULL)
    {
        *start_position = 0;
        for(int i = 0; i < code_point % 256; i++)
        {
            *start_position += selected_size[code_point_msb][i];
        }
    }
    return true;
}

void font_get_glyph_width(int code_point, int *width, int *start_position,
                          display_format_t format)
{
    if(width == NULL)return;

    if(font_get_glyph_width_preloaded(code_point, width, start_position, format))
        return;
    int code_point_msb = (code_point >> 8) % 256;
    char file_name_chars[strlen(FONT_PATH) + 20];

    uint8_t *size_buffer = NULL;
    *width = 0;
    if(start_position != NULL) *start_position = 0;
    uint8_t *selected_buffer;
    char suffix[20] = { 0 };

    if(format == DISPLAY_FORMAT_NTSC)
        strcpy(suffix, SUFFIX_SIZE_NTSC);
    else
        strcpy(suffix, SUFFIX_SIZE_PAL);

    sprintf(file_name_chars, "%s%02X%s", FONT_PATH, code_point_msb, suffix);

    size_buffer = (uint8_t*)malloc(256);
    if(size_buffer == NULL) return;
    if(wkc_open(file_name_chars, (char*)size_buffer, 256))
    {
        free(size_buffer);
        return;
    }
    selected_buffer = size_buffer;


    *width = selected_buffer[code_point % 256];
    if (start_position != NULL)
    {
        *start_position = 0;
        for(int i = 0; i < code_point % 256; i++)
            *start_position += selected_buffer[i];
    }
    if(size_buffer != NULL)
        free(size_buffer);
}

static bool font_get_page_preloaded(uint8_t **page, uint8_t code_point_msb, display_format_t format,
                             size_t *page_size)
{
    *page = NULL;
    *page_size = 0;
    if(format == DISPLAY_FORMAT_NTSC)
    {
        *page = ntsc_page_buffer[code_point_msb];
        *page_size = ntsc_page_size[code_point_msb];
    }
    else
    {
        *page = pal_page_buffer[code_point_msb];
        *page_size = pal_page_size[code_point_msb];
    }
    *page_size = *page_size * 8 / FONT_FILE_HEIGHT * FONT_FILE_HEIGHT;
    return true;
}

uint8_t* font_get_page(uint8_t code_point_msb, display_format_t format,
                       size_t *page_size, bool *preloaded)
{
    // Load the first page
    uint8_t *page_preloaded = NULL;
    if(format == DISPLAY_FORMAT_UNDEFINDED)
    {
        *preloaded = true;
        *page_size = -1;
        return NULL;
    }
    if(font_get_page_preloaded(&page_preloaded, code_point_msb, format, page_size))
    {
        *preloaded = true;
        return page_preloaded;
    }
    *preloaded = false;

    char file_name_chars[strlen(FONT_PATH) + 20];
    sprintf(file_name_chars, "%s%02X%s", FONT_PATH, code_point_msb,
           (format == DISPLAY_FORMAT_NTSC ? SUFFIX_NTSC : SUFFIX_PAL));
    size_t size = 0;
    if(wkc_get_file_size(file_name_chars, &size)) return NULL;
    uint8_t *page = (uint8_t*)heap_caps_malloc(size, MALLOC_CAP_SPIRAM);
    if(page == NULL) return NULL;
    wkc_open(file_name_chars, (char*)page, size);
    if(page_size != NULL)
        *page_size = size * 8 / FONT_FILE_HEIGHT * FONT_FILE_HEIGHT;
    return page;

}

static inline bool is_number_or_digit(uint16_t utf16_char)
{
    return (utf16_char >= '0' && utf16_char <= '9') ||
           (utf16_char >= 'A' && utf16_char <= 'Z') ||
           (utf16_char >= 'a' && utf16_char <= 'z');
}

static void process_alnum_block(uint16_t *utf16_text, text_position_descriptor_t *pos_desc,
            int block_start, int block_end, int block_width, int *curr_x, int *curr_y,
            int max_width, int font_height, int *max_line_width);
static void process_non_alnum_char(uint16_t c, int char_width, int *curr_x, int *curr_y,
            int max_width, int font_height, int *max_line_width,
            text_position_descriptor_t *pos_desc, int idx);

text_position_descriptor_t* font_measure_text(char *text, display_format_t format,
                                              int max_width,
                                              int *text_length, display_vector_t *size)
{
    if (text_length) *text_length = 0;
    if (size)
    {
        size->x = 0;
        size->y = 0;
    }
    if (text == NULL || *text == '\0') return NULL;

    int font_height = 16;

    // UTF8 to UTF16
    int utf16_len = 0;
    uint16_t *utf16_text = string_to_utf_16(text, &utf16_len);
    if (utf16_text == NULL || utf16_len == 0) return NULL;
    if (text_length) *text_length = utf16_len;

    text_position_descriptor_t *pos_desc = (text_position_descriptor_t*)malloc(sizeof(text_position_descriptor_t) * utf16_len);
    if (pos_desc == NULL)
    {
        free(utf16_text);
        return NULL;
    }
    memset(pos_desc, 0, sizeof(text_position_descriptor_t) * utf16_len);

    int curr_x = 0;
    int curr_y = 0;
    int max_line_width = 0;
    int block_start = 0;
    int block_width = 0;
    bool in_alnum_block = false;
    int i = 0;

    while (i < utf16_len)
    {
        uint16_t c = utf16_text[i];
        int char_width = 0;

        if (c == '\r' || c == '\n')
        {
            if (in_alnum_block)
            {
                process_alnum_block(utf16_text, pos_desc, block_start, i-1, block_width,
                                   &curr_x, &curr_y, max_width, font_height, &max_line_width);
                in_alnum_block = false;
                block_start = i;
                block_width = 0;
            }

            if (c == '\r')
            {
                if (i + 1 < utf16_len && utf16_text[i+1] == '\n')
                {
                    i++;
                }
            }

            curr_x = 0;
            curr_y += font_height;
            i++;
            continue;
        }

        font_get_glyph_width(c, &char_width, NULL, DISPLAY_FORMAT_UNDEFINDED);
        if (char_width <= 0) char_width = 0;

        bool is_alnum = is_number_or_digit(c);
        if (is_alnum)
        {
            if (!in_alnum_block)
            {
                block_start = i;
                block_width = 0;
                in_alnum_block = true;
            }
            block_width += char_width;
        }
        else
        {
            if (in_alnum_block)
            {
                process_alnum_block(utf16_text, pos_desc, block_start, i-1, block_width,
                                   &curr_x, &curr_y, max_width, font_height, &max_line_width);
                in_alnum_block = false;
                block_start = i;
                block_width = 0;
            }
            process_non_alnum_char(c, char_width, &curr_x, &curr_y, max_width, font_height,
                                  &max_line_width, pos_desc, i);
        }
        i++;
    }

    if (in_alnum_block && block_start < utf16_len)
    {
        process_alnum_block(utf16_text, pos_desc, block_start, utf16_len-1, block_width,
                           &curr_x, &curr_y, max_width, font_height, &max_line_width);
    }

    if (size)
    {
        size->x = (max_width > 0 && max_line_width > max_width) ? max_width : max_line_width;
        size->y = curr_y + font_height;
    }

    free(utf16_text);

    if(format != DISPLAY_FORMAT_UNDEFINDED)
    {
        if (size)
            *size = display_vector_compensation(size, format);
        for(int i = 0; i < utf16_len; i++)
        {
            display_vector_t actual_desc_pos = display_coordinate_compensation(pos_desc[i].x,
                                               pos_desc[i].y, format);
            pos_desc[i].x = actual_desc_pos.x;
            pos_desc[i].y = actual_desc_pos.y;
        }
    }
    return pos_desc;
}

static void process_alnum_block(uint16_t *utf16_text, text_position_descriptor_t *pos_desc,
            int block_start, int block_end, int block_width, int *curr_x, int *curr_y,
            int max_width, int font_height, int *max_line_width)
{
    int block_len = block_end - block_start + 1;
    if (block_len <= 0 || block_width <= 0) return;

    if (max_width <= 0)
    {
        int x = *curr_x;
        for (int j = block_start; j <= block_end; j++)
        {
            int char_w = 0;
            font_get_glyph_width(utf16_text[j], &char_w, NULL, DISPLAY_FORMAT_UNDEFINDED);
            if (char_w <= 0) char_w = 0;
            pos_desc[j].x = x;
            pos_desc[j].y = *curr_y;
            pos_desc[j].utf16_char = utf16_text[j];
            x += char_w;
        }
        *curr_x = x;
        if (*curr_x > *max_line_width) *max_line_width = *curr_x;
        return;
    }

    if (block_width <= max_width)
    {
        int remain_width = max_width - *curr_x;
        if (remain_width < block_width)
        {
            *curr_y += font_height;
            *curr_x = 0;
        }
        int x = *curr_x;
        for (int j = block_start; j <= block_end; j++)
        {
            int char_w = 0;
            font_get_glyph_width(utf16_text[j], &char_w, NULL, DISPLAY_FORMAT_UNDEFINDED);
            if (char_w <= 0) char_w = 0;
            pos_desc[j].x = x;
            pos_desc[j].y = *curr_y;
            pos_desc[j].utf16_char = utf16_text[j];
            x += char_w;
        }
        *curr_x = x;
        int line_w = (*curr_x > max_width) ? max_width : *curr_x;
        if (line_w > *max_line_width) *max_line_width = line_w;
        return;
    }

    int line_x = *curr_x;
    for (int j = block_start; j <= block_end; j++)
    {
        int char_w = 0;
        font_get_glyph_width(utf16_text[j], &char_w, NULL, DISPLAY_FORMAT_UNDEFINDED);
        if (char_w <= 0) char_w = 0;

        if (char_w > max_width)
        {
            pos_desc[j].x = 0;
            pos_desc[j].y = *curr_y;
            pos_desc[j].utf16_char = utf16_text[j];
            if (max_width > *max_line_width) *max_line_width = max_width;
            *curr_y += font_height;
            line_x = 0;
            continue;
        }

        if (line_x + char_w > max_width)
        {
            *curr_y += font_height;
            line_x = 0;
        }

        pos_desc[j].x = line_x;
        pos_desc[j].y = *curr_y;
        pos_desc[j].utf16_char = utf16_text[j];
        line_x += char_w;
    }

    *curr_x = line_x;
    int line_w = (line_x > max_width) ? max_width : line_x;
    if (line_w > *max_line_width) *max_line_width = line_w;
}

static void process_non_alnum_char(uint16_t c, int char_width, int *curr_x, int *curr_y,
            int max_width, int font_height, int *max_line_width,
            text_position_descriptor_t *pos_desc, int idx)
{
    if (max_width <= 0)
    {
        pos_desc[idx].x = *curr_x;
        pos_desc[idx].y = *curr_y;
        pos_desc[idx].utf16_char = c;
        *curr_x += char_width;
        if (*curr_x > *max_line_width) *max_line_width = *curr_x;
        return;
    }

    if (char_width > max_width)
    {
        pos_desc[idx].x = 0;
        pos_desc[idx].y = *curr_y;
        pos_desc[idx].utf16_char = c;
        if (max_width > *max_line_width) *max_line_width = max_width;
        *curr_y += font_height;
        *curr_x = 0;
        return;
    }

    if (*curr_x + char_width > max_width)
    {
        *curr_y += font_height;
        *curr_x = 0;
    }

    if (c == 0x20)
    {
        pos_desc[idx].x = *curr_x;
        pos_desc[idx].y = *curr_y;
        pos_desc[idx].utf16_char = c;
        if (*curr_x + char_width <= max_width)
        {
            *curr_x += char_width;
        }
    }
    else
    {
        pos_desc[idx].x = *curr_x;
        pos_desc[idx].y = *curr_y;
        pos_desc[idx].utf16_char = c;
        *curr_x += char_width;
    }

    int line_w = (*curr_x > max_width) ? max_width : *curr_x;
    if (line_w > *max_line_width) *max_line_width = line_w;
}