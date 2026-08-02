#pragma once

#include <stdint.h>
#include "graphics.h"
#include "display_common.h"

void font_preload();
uint16_t *font_char_to_utf_16(char *text, int *output_length);
char *font_crop_text(char *text, int max_length);
void font_get_glyph_width(int code_point, int *width, int *start_position,
                          display_format_t format);
text_position_descriptor_t* font_measure_text(char *text, display_format_t format,
                                              int max_width,
                                              int *text_length, display_vector_t *size);
uint8_t* font_get_page(uint8_t code_point_msb, display_format_t format,
                       size_t *page_size, bool *preloaded);