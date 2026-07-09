#pragma once

#include <stdint.h>
#include <math.h>

#define DISPLAY_WIDTH_PAL 384
#define DISPLAY_WIDTH_NISC 320
#define DISPLAY_HEIGHT_PAL 288
#define DISPLAY_HEIGHT_NTSC 240
#define DISPLAY_PIXELS_PER_BYTE 4
#define DISPLAY_SUB_COLUMN_PER_CHAR 3
#define DISPLAY_SUB_ROW_PER_CHAR 18
#define DISPLAY_BYTES_UNIT 54

typedef enum
{
    DISPLAY_FORMAT_NTSC,
    DISPLAY_FORMAT_PAL,
    DISPLAY_FORMAT_UNDEFINDED
} display_format_t;

typedef enum
{
    DISPLAY_ORIENTATION_HORIZONTAL,
    DISPLAY_ORIENTATION_VERTICAL,
    DISPLAY_ORIENTATION_VERTICAL_TILED
} display_orientation_t;

typedef enum
{
    DISPLAY_COLOR_BLANKING = 0x00,
    DISPLAY_COLOR_TRANSPARENT = 0x01,
    DISPLAY_COLOR_BLACK = 0x02,
    DISPLAY_COLOR_WHITE = 0x03,
} display_color_t;

typedef struct
{
    int x;
    int y;
    int width;
    int height;
} display_rect_t;

typedef struct
{
    int x1;
    int y1;
    int x2;
    int y2;
} display_line_t;

typedef struct
{
    int x;
    int y;
} display_vector_t;

#define FONT_FILE_HEIGHT 18

typedef struct
{
    int x;
    int y;
    uint16_t utf16_char;
} text_position_descriptor_t;
