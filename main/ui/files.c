#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <sys/dir.h>
#include <sys/dirent.h>
#include <sys/stat.h>
#include <sys/time.h>
#include "esp_vfs_fat.h"
#include "esp_timer.h"
#include "io/filesystem.h"
#include "profile/translations.h"
#include "display/graphics.h"
#include "display/display_control.h"
#include "ui_common.h"
#include "page.h"
#include "shell.h"

typedef enum
{
    UI_FILES_MAIN,
    UI_FILES_MENU,
    UI_FILES_DELETE
} ui_files_state_t;

typedef struct
{
    int size;
    display_vector_t resolution;
    struct tm last_modified;

} file_info_t;


typedef struct
{
    ui_page_t base;
    int selected_index;
    bool show;
    bool draw_request;
    int last_selected_index;
    int file_count;
    int file_index_start;
    int file_index_end;
    bool delete_confirm;
    char **file_list;
    ui_files_state_t state;
    file_info_t current_file_info;
} ui_files_t;

static void ui_files_calculate_item_range(ui_files_t *files, bool inverse)
{
    display_orientation_t orientation = ui_shell_get_orientation(files->base.parent);
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_HEIGHT_PAL :
                                      DISPLAY_WIDTH_PAL;
    display_vector_t border_size = {
        .x = 240, .y = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? logical_height - 24 :
                                                                   logical_height - 48
    };
    border_size.y -= (orientation == DISPLAY_ORIENTATION_VERTICAL_TILED ? 0 : 60) + 16;
    border_size.x -= 12;

    int index;
    if (!inverse)
    {
        files->file_index_end = files->file_index_start;
        index = files->file_index_start;
    }
    else
    {
        files->file_index_start = files->file_index_end;
        index = files->file_index_end;
    }

    int total_height = 0;
    while (index < files->file_count && !inverse ||
           index >= 0 && inverse)
    {
        display_vector_t measure_size;
        free(font_measure_text(files->file_list[index], DISPLAY_FORMAT_PAL, border_size.x,
             NULL, &measure_size));
        int tmp_height = total_height + measure_size.y + 4;
        if (tmp_height > border_size.y)
        {
            index -= inverse ? -1 : 1;
            break;
        }
        total_height = tmp_height;
        if (index == files->file_count - 1 && !inverse || index == 0 && inverse) break;
        index += inverse ? -1 : 1;
    }
    if (index < 0)
        index = 0;
    else if (index >= files->file_count)
        index = files->file_count - 1;

    if (!inverse)
        files->file_index_end = index;
    else
    {
        files->file_index_start = index;
        ui_files_calculate_item_range(files, false);
    }
}

static int ui_files_jpeg_parse_head(const char *path, display_vector_t *resolution)
{
    int buffer_length = 4096;
    uint8_t *read_buffer = calloc(buffer_length, 1);
    int ret = 0;
    size_t size;
    FILE *file = fopen(path, "rb");
    if (!file)
        goto read_fail;
    if(wkc_get_file_size(path, &size))
        goto read_fail;
    bool start = true;
    int64_t current_time = esp_timer_get_time();
    while (ftell(file) < size)
    {
        if (esp_timer_get_time() - current_time > 1000000) break;
        long pos = ftell(file);
        fread(read_buffer, buffer_length, 1, file);
        fseek(file, pos, SEEK_SET);
        // Check head
        if (start)
        {
            bool valid = memcmp(read_buffer, (uint8_t[]) { 0xFF, 0xD8 }, 2) == 0 &&
                         memcmp(read_buffer + 6, "JFIF", 5) == 0 ||
                         memcmp(read_buffer + 6, "Exif", 5) == 0;
            if (!valid) break;
            start = false;
        }
        bool reseek = true;
        for (int i = 0; i < buffer_length; i++)
        {
            if (read_buffer[i] == 0xFF)
            {
                if (i != 0)
                {
                    fseek(file, i, SEEK_CUR);
                    reseek = false;
                    break;
                }
                else if (read_buffer[1] == 0xC0)
                {
                    resolution->y = (int)read_buffer[5] * 256 + (int)read_buffer[6];
                    resolution->x = (int)read_buffer[7] * 256 + (int)read_buffer[8];
                    goto read_exit;
                }
            }
            if (ftell(file) + i >= size)
                goto read_fail;
        }
        if (reseek)
            fseek(file, buffer_length, SEEK_CUR);
    }

    read_fail:
    ret = 1;
    *resolution = (display_vector_t) { .x = -1, .y = -1 };

    read_exit:
    if (file)
        fclose(file);
    free(read_buffer);
    return ret;
}

static void ui_files_get_current_file_info(ui_files_t *files)
{
    if (files->selected_index >= files->file_count ||
        files->selected_index < 0) return;
    files->current_file_info.resolution = (display_vector_t){ .x = -1, .y = -1 };
    memcpy(&files->current_file_info.last_modified, &(struct tm) { 0 }, sizeof(struct tm));
    char *file_name = calloc(strlen(CAPTURE_DIR) +
                      strlen(files->file_list[files->selected_index]) + 2, 1);
    sprintf(file_name, "%s/%s", CAPTURE_DIR, files->file_list[files->selected_index]);
    struct stat file_stat;
    if (stat(file_name, &file_stat) == 0)
    {
        localtime_r(&file_stat.st_mtim.tv_sec, &files->current_file_info.last_modified);
        files->current_file_info.size = (int)file_stat.st_size;
    }
    else
    {
        files->current_file_info.size = -1;
        goto file_info_exit;
    }

    ui_files_jpeg_parse_head(file_name, &files->current_file_info.resolution);

    file_info_exit:
    free(file_name);
}

static int ui_files_reload(ui_files_t *files)
{
    DIR *capture_dir = opendir(CAPTURE_DIR);
    if (!capture_dir)
    {
        if(mkdir(CAPTURE_DIR, 0755) == 0)
        {
            ui_shell_show_toast(files->base.parent,
                wkc_translations_get_string("files_empty_directory"), 5);
        }
        else
        {
            ui_shell_show_toast(files->base.parent,
                wkc_translations_get_string("files_access_failed"), 5);
            wkc_storage_remove_sdcard();
        }
        return 1;
    }
    else
    {
        // Read directory
        if (files->file_list)
        {
            for (int i = 0; i < files->file_count; i++)
            {
                free(files->file_list[i]);
            }
            free(files->file_list);
            files->file_list = NULL;
        }
        files->file_count = 0;

        struct dirent *capture_dirent;
        while (capture_dirent = readdir(capture_dir))
        {
            if (capture_dirent->d_type == DT_REG)
                files->file_count++;
        }
        if (files->file_count == 0)
        {
            closedir(capture_dir);
            ui_shell_show_toast(files->base.parent,
                wkc_translations_get_string("files_empty_directory"), 5);
            return 1;
        }
        // Clean
        if (files->file_list)
        {
            free(files->file_list);
            for(int i = 0; i < files->file_count; i++)
            {
                free(files->file_list[i]);
            }
        }
        files->file_list = calloc(files->file_count, sizeof(char*));
        rewinddir(capture_dir);
        int current_index = 0;
        while (capture_dirent = readdir(capture_dir))
        {
            if (capture_dirent->d_type != DT_REG) continue;
            files->file_list[current_index] = calloc(strlen(capture_dirent->d_name) + 1, 1);
            strcpy(files->file_list[current_index], capture_dirent->d_name);
            current_index += 1;
        }
        ui_files_calculate_item_range(files, false);
        ui_files_get_current_file_info(files);
        closedir(capture_dir);
    }
    return 0;
}

static void ui_files_on_show(ui_files_t *files)
{
    files->show = true;
    files->draw_request = true;
    files->last_selected_index = -1;
    files->selected_index = 0;
    files->file_count = 0;
    files->file_index_start = 0;
    files->file_index_end = -1;
    files->state = UI_FILES_MAIN;

    // Try mount
    if (!wkc_storage_is_sdcard_active())
    {
        if(wkc_storage_init_sdcard())
        {
            ui_shell_show_toast(files->base.parent,
                wkc_translations_get_string("files_insert_sd_card"), 5);
            ui_shell_show_page(files->base.parent,
                ui_shell_find_page(files->base.parent, UI_PAGE_TYPE_MENU));
            return;
        }
    }
    // Read files
    if (ui_files_reload(files))
        ui_shell_show_page(files->base.parent,
            ui_shell_find_page(files->base.parent, UI_PAGE_TYPE_MENU));
}

static void ui_files_draw_item(ui_files_t *files, display_format_t *formats,
                                  display_orientation_t orientation, int item_index, bool highlight)
{
    if (item_index < files->file_index_start || item_index > files->file_index_end) return;

    int logical_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_WIDTH_PAL:
                                     DISPLAY_HEIGHT_PAL;
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_HEIGHT_PAL :
                                      DISPLAY_WIDTH_PAL;
    display_vector_t border_size = { .x = 240 - 18,
        .y = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? logical_height - 24 :
                                                         logical_height - 48 };
    display_rect_t border_rect = {
        .x = (logical_width - border_size.x) / 2, .y = (logical_height - border_size.y) / 2 + 6,
        .width = border_size.x, .height = border_size.y - 12 - (orientation ==
            DISPLAY_ORIENTATION_VERTICAL_TILED ? 0 : 60)
    };

    int draw_index = border_rect.y;
    for (int i = files->file_index_start; i < item_index; i++)
    {
        display_vector_t measure_size;
        free(font_measure_text(files->file_list[i], DISPLAY_FORMAT_PAL, border_size.x,
             NULL, &measure_size));
        draw_index += measure_size.y + 4;
    }
    display_vector_t measure_size, measure_size_primary, measure_size_secondary;
    int measure_length;
    free(font_measure_text(
        files->file_list[item_index], DISPLAY_FORMAT_PAL, border_rect.width - 6, &measure_length,
        &measure_size
    ));
    text_position_descriptor_t *measure_result_primary = font_measure_text(
        files->file_list[item_index], formats[0], border_rect.width - 6, NULL,
        &measure_size_primary
    );
    text_position_descriptor_t *measure_result_secondary = font_measure_text(
        files->file_list[item_index], formats[1], border_rect.width - 6, NULL,
        &measure_size_secondary
    );
    display_rect_t measure_rect = {
        .x = border_rect.x, .y = draw_index, .width = border_rect.width,
        .height = measure_size.y
    };
    display_rect_t measure_rect_primary = display_rect_compensation(&measure_rect, formats[0]);
    display_rect_t measure_rect_secondary = display_rect_compensation(&measure_rect, formats[1]);
    if (highlight)
    {
        display_rect_translate(&measure_rect_primary, 1, 1);
        display_rect_translate(&measure_rect_secondary, 1, 1);
        display_fill_rounded_rect(0, orientation, &measure_rect_primary, DISPLAY_COLOR_BLACK, 2);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rounded_rect(1, orientation, &measure_rect_secondary, DISPLAY_COLOR_BLACK, 2);
        display_rect_translate(&measure_rect_primary, -1, -1);
        display_rect_translate(&measure_rect_secondary, -1, -1);
        display_fill_rounded_rect(0, orientation, &measure_rect_primary, DISPLAY_COLOR_WHITE, 2);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rounded_rect(1, orientation, &measure_rect_secondary, DISPLAY_COLOR_WHITE, 2);
    }
    else
    {
        display_rect_expand(&measure_rect_primary, 1, 1);
        display_rect_expand(&measure_rect_secondary, 1, 1);
        display_fill_rect(0, orientation, &measure_rect_primary, DISPLAY_COLOR_TRANSPARENT);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rect(1, orientation, &measure_rect_secondary, DISPLAY_COLOR_TRANSPARENT);
        display_rect_expand(&measure_rect_primary, -1, -1);
        display_rect_expand(&measure_rect_secondary, -1, -1);

    }
    measure_rect.y -= 1;
    measure_rect_primary = display_rect_compensation(&measure_rect, formats[0]);
    measure_rect_secondary = display_rect_compensation(&measure_rect, formats[1]);
    if (!highlight)
    {
        display_draw_text(0, orientation, measure_rect_primary.x + 4, measure_rect_primary.y + 1,
            measure_result_primary, measure_length, DISPLAY_COLOR_BLACK, formats[0]);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_text(1, orientation, measure_rect_secondary.x + 4,
                measure_rect_secondary.y + 1, measure_result_secondary, measure_length,
                DISPLAY_COLOR_BLACK, formats[1]);
    }
    display_draw_text(0, orientation, measure_rect_primary.x + 3, measure_rect_primary.y,
        measure_result_primary, measure_length, highlight ? DISPLAY_COLOR_BLACK :
        DISPLAY_COLOR_WHITE, formats[0]);
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_draw_text(1, orientation, measure_rect_secondary.x + 3, measure_rect_secondary.y,
            measure_result_secondary, measure_length, highlight ? DISPLAY_COLOR_BLACK :
            DISPLAY_COLOR_WHITE, formats[1]);

    measure_rect.y += 2;
    measure_rect_primary = display_rect_compensation(&measure_rect, formats[0]);
    measure_rect_secondary = display_rect_compensation(&measure_rect, formats[1]);
    display_rect_expand(&measure_rect_primary, 1, 1);
    display_rect_expand(&measure_rect_secondary, 1, 1);
    display_update(0, orientation, &measure_rect_primary);
    display_update(1, orientation, &measure_rect_secondary);

    free(measure_result_primary);
    free(measure_result_secondary);
}

// 18px height per item
static void ui_files_draw_info_item(char *content, display_format_t *formats,
                                    display_orientation_t orientation, display_vector_t *draw_origin)
{
    int info_length;
    display_vector_t info_size;
    free(font_measure_text(content, DISPLAY_FORMAT_PAL, 0, &info_length,
         &info_size));
    text_position_descriptor_t *info_result_primary = font_measure_text(
        content, formats[0], 0, NULL, NULL
    );
    text_position_descriptor_t *info_result_secondary = font_measure_text(
        content, formats[1], 0, NULL, NULL
    );
    display_vector_t draw_origin_primary = display_coordinate_compensation(
        draw_origin->x, draw_origin->y - info_size.y / 2 - 2, formats[0]
    );
    display_vector_t draw_origin_secondary = display_coordinate_compensation(
        draw_origin->x, draw_origin->y - info_size.y / 2 - 2, formats[1]
    );
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
    {
        display_draw_text(0, orientation, draw_origin_primary.x + 1,
                          draw_origin_primary.y + 1, info_result_primary,
                          info_length, DISPLAY_COLOR_BLACK, formats[0]);
        display_draw_text(0, orientation, draw_origin_primary.x,
                          draw_origin_primary.y, info_result_primary,
                          info_length, DISPLAY_COLOR_WHITE, formats[0]);
    }
    display_draw_text(1, orientation, draw_origin_secondary.x + 1,
                      draw_origin_secondary.y + 1, info_result_secondary,
                      info_length, DISPLAY_COLOR_BLACK, formats[1]);
    display_draw_text(1, orientation, draw_origin_secondary.x,
                      draw_origin_secondary.y, info_result_secondary,
                      info_length, DISPLAY_COLOR_WHITE, formats[1]);
    free(info_result_primary);
    free(info_result_secondary);
    draw_origin->y += 18;
}

static void ui_files_on_draw(ui_files_t *files, display_format_t *formats,
                             display_orientation_t orientation)
{
    int logical_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_WIDTH_PAL:
                                     DISPLAY_HEIGHT_PAL;
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? DISPLAY_HEIGHT_PAL :
                                      DISPLAY_WIDTH_PAL;
    if (!files->draw_request) return;

    // Draw border, horizontal 240x264, others 240x336
    display_vector_t border_size = {
        .x = 240, .y = orientation == DISPLAY_ORIENTATION_HORIZONTAL ? logical_height - 24 :
                                                                   logical_height - 48
    };
    display_rect_t border_rect = {
        .x = (logical_width - border_size.x) / 2, .y = (logical_height - border_size.y) / 2,
        .width = border_size.x, .height = border_size.y
    };
    display_line_t border_separator = {
        .x1 = border_rect.x, .y1 = border_rect.y + border_rect.height - 60,
        .x2 = border_rect.x + border_rect.width, .y2 = border_separator.y1
    };

    if (files->show)
    {
        DISPLAY_CLEAR_SCREEN(0);
        DISPLAY_CLEAR_SCREEN(1);
        display_rect_t border_rect_primary = display_rect_compensation(&border_rect, formats[0]);
        display_rect_t border_rect_secondary;
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            border_rect_secondary = display_rect_compensation(&border_rect, formats[1]);
        else
        {
            border_rect_secondary = display_rect_compensation(&(display_rect_t) {
                .x = border_rect.x, .y = (logical_height - 60) / 2,
                .width = border_rect.width, .height = 60
            }, formats[1]);
        }
        display_line_t border_separator_primary = display_line_compensation(&border_separator,
                                                  formats[0]);
        display_line_t border_separator_secondary = display_line_compensation(&border_separator,
                                                    formats[1]);
        display_rect_translate(&border_rect_primary, 1, 1);
        display_rect_translate(&border_rect_secondary, 1, 1);
        display_line_translate(&border_separator_primary, 1, 1);
        display_line_translate(&border_separator_secondary, 1, 1);
        display_draw_rounded_rect(0, orientation, &border_rect_primary, DISPLAY_COLOR_BLACK, 6, 2);
        display_draw_rounded_rect(1, orientation, &border_rect_secondary, DISPLAY_COLOR_BLACK, 6, 2);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_line(0, orientation, &border_separator_primary, DISPLAY_COLOR_BLACK, 2);
            display_draw_line(1, orientation, &border_separator_secondary, DISPLAY_COLOR_BLACK, 2);
        }
        display_rect_translate(&border_rect_primary, -1, -1);
        display_rect_translate(&border_rect_secondary, -1, -1);
        display_line_translate(&border_separator_primary, -1, -1);
        display_line_translate(&border_separator_secondary, -1, -1);
        display_draw_rounded_rect(0, orientation, &border_rect_primary, DISPLAY_COLOR_WHITE, 6, 2);
        display_draw_rounded_rect(1, orientation, &border_rect_secondary, DISPLAY_COLOR_WHITE, 6, 2);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_line(0, orientation, &border_separator_primary, DISPLAY_COLOR_WHITE, 2);
            display_draw_line(1, orientation, &border_separator_secondary, DISPLAY_COLOR_WHITE, 2);
        }

        display_rect_expand(&border_rect_primary, 2, 2);
        display_rect_expand(&border_rect_secondary, 2, 2);
        display_update(0, orientation, &border_rect_primary);
        display_update(1, orientation, &border_rect_secondary);

        for (int i = files->file_index_start; i <= files->file_index_end; i++)
        {
            ui_files_draw_item(files, formats, orientation, i, i == files->selected_index);
        }
    }
    else if (files->state == UI_FILES_MAIN &&
             files->last_selected_index != files->selected_index)
    {
        ui_files_draw_item(files, formats, orientation, files->last_selected_index, false);
        ui_files_draw_item(files, formats, orientation, files->selected_index, true);
    }

    // Draw info
    display_vector_t draw_center;
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
    {
        draw_center = (display_vector_t) {
            .x = border_rect.x + border_rect.width / 2,
            .y = border_rect.y + border_rect.height - 30
        };
    }
    else
    {
        draw_center = (display_vector_t) {
            .x = border_rect.x + border_rect.width / 2,
            .y = border_rect.y + border_rect.height / 2
        };
    }

    display_rect_t info_update_rect = {
        .x = draw_center.x - 120, .y = draw_center.y - 30,
        .width = 240, .height = 60
    };
    display_rect_expand(&info_update_rect, -4, -4);
    display_rect_t info_update_rect_primary = display_rect_compensation(
        &info_update_rect, formats[0]
    );
    display_rect_t info_update_rect_secondary = display_rect_compensation(
        &info_update_rect, formats[1]
    );
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_fill_rect(0, orientation, &info_update_rect_primary,
                          DISPLAY_COLOR_TRANSPARENT);
    display_fill_rect(1, orientation, &info_update_rect_secondary,
                      DISPLAY_COLOR_TRANSPARENT);
    display_rect_expand(&info_update_rect, 4, 4);

    if (files->state != UI_FILES_DELETE)
    {
        // Draw last modified
        display_vector_t draw_origin = {
            .x = border_rect.x + 6, .y = draw_center.y - 18
        };
        char *last_modified_name = wkc_translations_get_string("files_last_modified");
        char time_str[72] = { 0 };
        if (memcmp(&files->current_file_info.last_modified,
            &(struct tm) { 0 }, sizeof(struct tm)) == 0)
            sprintf(time_str, wkc_translations_get_string("files_unknown"));
        else
            sprintf(time_str, "%d/%d/%d %d:%02d:%02d",
                              files->current_file_info.last_modified.tm_year + 1900,
                              files->current_file_info.last_modified.tm_mon + 1,
                              files->current_file_info.last_modified.tm_mday,
                              files->current_file_info.last_modified.tm_hour,
                              files->current_file_info.last_modified.tm_min,
                              files->current_file_info.last_modified.tm_sec);
        char *last_modified_result = calloc(strlen(last_modified_name) +
                                            strlen(time_str) + 1, 1);
        sprintf(last_modified_result, "%s%s", last_modified_name, time_str);
        ui_files_draw_info_item(last_modified_result, formats, orientation, &draw_origin);
        free(last_modified_result);

        // Draw file size
        char *file_size_name = wkc_translations_get_string("files_file_size");
        char file_size_result[10] = { 0 };
        if (files->current_file_info.size < 0)
            sprintf(file_size_result, wkc_translations_get_string("files_unknown"));
        else
            wkc_size_to_char((size_t)files->current_file_info.size, file_size_result);
        char *file_size_char = calloc(strlen(file_size_name) +
                                      strlen(file_size_result) + 1, 1);
        sprintf(file_size_char, "%s%s", file_size_name, file_size_result);
        ui_files_draw_info_item(file_size_char, formats, orientation, &draw_origin);
        free(file_size_char);

        // Draw resolution
        if (files->current_file_info.resolution.x > 0 &&
            files->current_file_info.resolution.y > 0)
        {
            char *resolution_name = wkc_translations_get_string("files_resolution");
            char resolution_str[25] = { 0 };
            sprintf(resolution_str, "%dx%d", files->current_file_info.resolution.x,
                                             files->current_file_info.resolution.y);
            char *resolution_result = calloc(strlen(resolution_name) +
                                             strlen(resolution_str) + 1, 1);
            sprintf(resolution_result, "%s%s", resolution_name, resolution_str);
            ui_files_draw_info_item(resolution_result, formats, orientation, &draw_origin);
            free(resolution_result);
        }
        else
            ui_files_draw_info_item("", formats, orientation, &draw_origin);

        // Draw delete
        char *delete_char = wkc_translations_get_string("files_delete"),
             delete_icon_primary[50] = { 0 },
             delete_icon_secondary[50] = { 0 };
        int delete_width, delete_width_primary, delete_width_secondary, delete_char_length;
        display_vector_t delete_char_size;
        display_get_icon("delete", DISPLAY_FORMAT_PAL, false, NULL, &delete_width);
        display_get_icon("delete", formats[0], false, delete_icon_primary,
                         &delete_width_primary);
        display_get_icon("delete", formats[1], false, delete_icon_secondary,
                         &delete_width_secondary);
        free(font_measure_text(delete_char, DISPLAY_FORMAT_PAL, 0, &delete_char_length,
                               &delete_char_size));
        text_position_descriptor_t *delete_text_primary = font_measure_text(
            delete_char, formats[0], 0, NULL, NULL
        );
        text_position_descriptor_t *delete_text_secondary = font_measure_text(
            delete_char, formats[1], 0, NULL, NULL
        );
        display_rect_t delete_rect = {
            .x = border_rect.x + border_rect.width - 18 - delete_width - delete_char_size.x,
            .y = draw_center.y - 3, .width = delete_char_size.x + delete_width + 8,
            .height = 24
        };
        display_rect_t delete_rect_primary = display_rect_compensation(
            &delete_rect, formats[0]
        );
        display_rect_t delete_rect_secondary = display_rect_compensation(
            &delete_rect, formats[1]
        );
        display_vector_t delete_text_position = {
            .x = delete_rect.x + delete_width + 3,
            .y = delete_rect.y + 3,
        };
        display_vector_t delete_text_position_primary = display_vector_compensation(
            &delete_text_position, formats[0]
        );
        display_vector_t delete_text_position_secondary = display_vector_compensation(
            &delete_text_position, formats[1]
        );
        display_rect_expand(&delete_rect_primary, 1, 1);
        display_rect_expand(&delete_rect_secondary, 1, 1);
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_fill_rect(0, orientation, &delete_rect_primary, DISPLAY_COLOR_TRANSPARENT);
        display_fill_rect(1, orientation, &delete_rect_secondary, DISPLAY_COLOR_TRANSPARENT);
        display_rect_expand(&delete_rect_primary, -1, -1);
        display_rect_expand(&delete_rect_secondary, -1, -1);
        if (files->state == UI_FILES_MENU)
        {
            display_rect_translate(&delete_rect_primary, 1, 1);
            display_rect_translate(&delete_rect_secondary, 1, 1);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(0, orientation, &delete_rect_primary,
                                          DISPLAY_COLOR_BLACK, 2);
            display_fill_rounded_rect(1, orientation, &delete_rect_secondary,
                                      DISPLAY_COLOR_BLACK, 2);
            display_rect_translate(&delete_rect_primary, -1, -1);
            display_rect_translate(&delete_rect_secondary, -1, -1);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(0, orientation, &delete_rect_primary,
                                          DISPLAY_COLOR_WHITE, 2);
            display_fill_rounded_rect(1, orientation, &delete_rect_secondary,
                                      DISPLAY_COLOR_WHITE, 2);
        }
        else
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            {
                display_draw_image(0, orientation, delete_rect_primary.x + 1,
                    delete_rect_primary.y + 1, delete_icon_primary, delete_width_primary,
                    DISPLAY_COLOR_BLACK);
                display_draw_text(0, orientation, delete_text_position_primary.x + 1,
                    delete_text_position_primary.y + 1, delete_text_primary,
                    delete_char_length, DISPLAY_COLOR_BLACK, formats[0]);
            }
            display_draw_image(1, orientation, delete_rect_secondary.x + 1,
                delete_rect_secondary.y + 1, delete_icon_secondary, delete_width_secondary,
                DISPLAY_COLOR_BLACK);
            display_draw_text(1, orientation, delete_text_position_secondary.x + 1,
                delete_text_position_secondary.y + 1, delete_text_secondary,
                delete_char_length, DISPLAY_COLOR_BLACK, formats[1]);
        }
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_image(0, orientation, delete_rect_primary.x,
                delete_rect_primary.y, delete_icon_primary, delete_width_primary,
                files->state == UI_FILES_MENU ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
            display_draw_text(0, orientation, delete_text_position_primary.x,
                delete_text_position_primary.y, delete_text_primary, delete_char_length,
                files->state == UI_FILES_MENU ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE,
                formats[0]);
        }
        display_draw_image(1, orientation, delete_rect_secondary.x,
            delete_rect_secondary.y, delete_icon_secondary, delete_width_secondary,
            files->state == UI_FILES_MENU ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE);
        display_draw_text(1, orientation, delete_text_position_secondary.x,
            delete_text_position_secondary.y, delete_text_secondary, delete_char_length,
            files->state == UI_FILES_MENU ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE,
            formats[1]);

        info_update_rect_primary = display_rect_compensation(
            &info_update_rect, formats[0]
        );
        info_update_rect_secondary = display_rect_compensation(
            &info_update_rect, formats[1]
        );
        free(delete_text_primary);
        free(delete_text_secondary);
    }
    else
    {
        char *delete_confirm_char = wkc_translations_get_string("files_delete_confirm");
        char *delete_ok_char = wkc_translations_get_string("files_delete_ok");
        char *delete_cancel_char = wkc_translations_get_string("files_delete_cancel");
        int delete_confirm_length, delete_ok_length, delete_cancel_length;
        display_vector_t delete_confirm_size, delete_ok_size, delete_cancel_size;
        free(font_measure_text(delete_confirm_char, DISPLAY_FORMAT_PAL, 0,
                               &delete_confirm_length, &delete_confirm_size));
        free(font_measure_text(delete_ok_char, DISPLAY_FORMAT_PAL, 0,
                               &delete_ok_length, &delete_ok_size));
        free(font_measure_text(delete_cancel_char, DISPLAY_FORMAT_PAL, 0,
                               &delete_cancel_length, &delete_cancel_size));

        text_position_descriptor_t *delete_confirm_primary = font_measure_text(
            delete_confirm_char, formats[0], 0, NULL, NULL
        );
        text_position_descriptor_t *delete_confirm_secondary = font_measure_text(
            delete_confirm_char, formats[1], 0, NULL, NULL
        );
        text_position_descriptor_t *delete_ok_primary = font_measure_text(
            delete_ok_char, formats[0], 0, NULL, NULL
        );
        text_position_descriptor_t *delete_ok_secondary = font_measure_text(
            delete_ok_char, formats[1], 0, NULL, NULL
        );
        text_position_descriptor_t *delete_cancel_primary = font_measure_text(
            delete_cancel_char, formats[0], 0, NULL, NULL
        );
        text_position_descriptor_t *delete_cancel_secondary = font_measure_text(
            delete_cancel_char, formats[1], 0, NULL, NULL
        );

        display_vector_t delete_origin = {
            .x = draw_center.x - delete_confirm_size.x / 2,
            .y = draw_center.y - 12 - delete_confirm_size.y / 2 - 2
        };
        display_vector_t delete_origin_primary = display_vector_compensation(
            &delete_origin, formats[0]
        );
        display_vector_t delete_origin_secondary = display_vector_compensation(
            &delete_origin, formats[1]
        );
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_draw_text(0, orientation, delete_origin_primary.x + 1,
                delete_origin_primary.y + 1, delete_confirm_primary,
                delete_confirm_length, DISPLAY_COLOR_BLACK, formats[0]);
            display_draw_text(0, orientation, delete_origin_primary.x,  delete_origin_primary.y,
                delete_confirm_primary, delete_confirm_length, DISPLAY_COLOR_WHITE, formats[0]);
        }
        display_draw_text(1, orientation, delete_origin_secondary.x + 1,
            delete_origin_secondary.y + 1, delete_confirm_secondary,
            delete_confirm_length, DISPLAY_COLOR_BLACK, formats[1]);
        display_draw_text(1, orientation, delete_origin_secondary.x,  delete_origin_secondary.y,
            delete_confirm_secondary, delete_confirm_length, DISPLAY_COLOR_WHITE, formats[1]);

        delete_origin = (display_vector_t) {
            .x = draw_center.x - (delete_ok_size.x + delete_cancel_size.x + 24) / 2,
            .y = draw_center.y + 12 - delete_confirm_size.y / 2 - 2
        };
        delete_origin_primary = display_vector_compensation(
            &delete_origin, formats[0]
        );
        delete_origin_secondary = display_vector_compensation(
            &delete_origin, formats[1]
        );

        display_rect_t confirm_rect, confirm_rect_primary, confirm_rect_secondary;
        if (!files->delete_confirm)
        {
            confirm_rect = (display_rect_t) {
                .x = delete_origin.x - 6, .y = delete_origin.y,
                .width = delete_cancel_size.x + 12, .height = 18
            };
            confirm_rect_primary = display_rect_compensation(
                &confirm_rect, formats[0]
            );
            confirm_rect_secondary = display_rect_compensation(
                &confirm_rect, formats[1]
            );
            display_rect_translate(&confirm_rect_primary, 1, 1);
            display_rect_translate(&confirm_rect_secondary, 1, 1);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(0, orientation, &confirm_rect_primary,
                    DISPLAY_COLOR_BLACK, 2);
            display_fill_rounded_rect(1, orientation, &confirm_rect_secondary,
            DISPLAY_COLOR_BLACK, 2);
            display_rect_translate(&confirm_rect_primary, -1, -1);
            display_rect_translate(&confirm_rect_secondary, -1, -1);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(0, orientation, &confirm_rect_primary,
                    DISPLAY_COLOR_WHITE, 2);
            display_fill_rounded_rect(1, orientation, &confirm_rect_secondary,
            DISPLAY_COLOR_WHITE, 2);
        }
        else
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_draw_text(0, orientation, delete_origin_primary.x + 1,
                    delete_origin_primary.y + 1, delete_cancel_primary, delete_cancel_length,
                    DISPLAY_COLOR_BLACK, formats[0]);
            display_draw_text(1, orientation, delete_origin_secondary.x + 1,
                delete_origin_secondary.y + 1, delete_cancel_secondary, delete_cancel_length,
                DISPLAY_COLOR_BLACK, formats[1]);
        }
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_text(0, orientation, delete_origin_primary.x,
                delete_origin_primary.y, delete_cancel_primary, delete_cancel_length,
                files->delete_confirm ? DISPLAY_COLOR_WHITE : DISPLAY_COLOR_BLACK, formats[0]);
        display_draw_text(1, orientation, delete_origin_secondary.x,
            delete_origin_secondary.y, delete_cancel_secondary, delete_cancel_length,
            files->delete_confirm ? DISPLAY_COLOR_WHITE : DISPLAY_COLOR_BLACK, formats[1]);

        delete_origin.x += delete_cancel_size.x + 24;
        delete_origin_primary = display_vector_compensation(
            &delete_origin, formats[0]
        );
        delete_origin_secondary = display_vector_compensation(
            &delete_origin, formats[1]
        );
        if (files->delete_confirm)
        {
            confirm_rect = (display_rect_t) {
                .x = delete_origin.x - 6, .y = delete_origin.y,
                .width = delete_ok_size.x + 12, .height = 18
            };
            confirm_rect_primary = display_rect_compensation(
                &confirm_rect, formats[0]
            );
            confirm_rect_secondary = display_rect_compensation(
                &confirm_rect, formats[1]
            );
            display_rect_translate(&confirm_rect_primary, 1, 1);
            display_rect_translate(&confirm_rect_secondary, 1, 1);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(0, orientation, &confirm_rect_primary,
                DISPLAY_COLOR_BLACK, 2);
            display_fill_rounded_rect(1, orientation, &confirm_rect_secondary,
            DISPLAY_COLOR_BLACK, 2);
            display_rect_translate(&confirm_rect_primary, -1, -1);
            display_rect_translate(&confirm_rect_secondary, -1, -1);
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_fill_rounded_rect(0, orientation, &confirm_rect_primary,
                DISPLAY_COLOR_WHITE, 2);
            display_fill_rounded_rect(1, orientation, &confirm_rect_secondary,
            DISPLAY_COLOR_WHITE, 2);
        }
        else
        {
            if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
                display_draw_text(0, orientation, delete_origin_primary.x + 1,
                    delete_origin_primary.y + 1, delete_ok_primary, delete_ok_length,
                    DISPLAY_COLOR_BLACK, formats[0]);
            display_draw_text(1, orientation, delete_origin_secondary.x + 1,
                delete_origin_secondary.y + 1, delete_ok_secondary, delete_ok_length,
                DISPLAY_COLOR_BLACK, formats[1]);
        }
        if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_text(0, orientation, delete_origin_primary.x,
                delete_origin_primary.y, delete_ok_primary, delete_ok_length,
                files->delete_confirm ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE, formats[0]);
        display_draw_text(1, orientation, delete_origin_secondary.x,
            delete_origin_secondary.y, delete_ok_secondary, delete_ok_length,
            files->delete_confirm ? DISPLAY_COLOR_BLACK : DISPLAY_COLOR_WHITE, formats[1]);

        free(delete_confirm_primary);
        free(delete_confirm_secondary);
        free(delete_ok_primary);
        free(delete_ok_secondary);
        free(delete_cancel_primary);
        free(delete_cancel_secondary);
    }
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        display_update(0, orientation, &info_update_rect_primary);
    display_update(1, orientation, &info_update_rect_secondary);

    files->show = false;
    files->draw_request = false;
    files->last_selected_index = files->selected_index;
}

static void ui_files_on_key_event(ui_files_t *files, int key_code)
{
    switch (files->state)
    {
        case UI_FILES_MAIN:
        {
            if (key_code == UI_KEY_CODE_EXIT)
            {
                ui_shell_show_page(files->base.parent,
                    ui_shell_find_page(files->base.parent, UI_PAGE_TYPE_HOME));
            }
            else if (key_code == UI_KEY_CODE_UP)
            {
                if (files->selected_index > 0)
                {
                    files->selected_index -= 1;
                    if (files->selected_index < files->file_index_start)
                    {
                        files->file_index_end = files->selected_index;
                        ui_files_calculate_item_range(files, true);
                        files->show = true;
                    }
                    ui_files_get_current_file_info(files);
                    files->draw_request = true;
                }
            }
            else if (key_code == UI_KEY_CODE_DOWN)
            {
                if (files->selected_index < files->file_count - 1)
                {
                    files->selected_index += 1;
                    if (files->selected_index > files->file_index_end)
                    {
                        files->file_index_start = files->selected_index;
                        ui_files_calculate_item_range(files, false);
                        files->show = true;
                    }
                    ui_files_get_current_file_info(files);
                    files->draw_request = true;
                }
            }
            else if (key_code == UI_KEY_CODE_MENU)
            {
                files->state = UI_FILES_MENU;
                files->draw_request = true;
            }
        }
        break;
        case UI_FILES_MENU:
        {
            if (key_code == UI_KEY_CODE_EXIT)
            {
                files->state = UI_FILES_MAIN;
                files->draw_request = true;
            }
            else if (key_code == UI_KEY_CODE_OK)
            {
                files->delete_confirm = false;
                files->state = UI_FILES_DELETE;
                files->draw_request = true;
            }
        }
        break;
        case UI_FILES_DELETE:
        {
            if (key_code == UI_KEY_CODE_RIGHT || key_code == UI_KEY_CODE_LEFT)
            {
                files->delete_confirm = !files->delete_confirm;
                files->draw_request = true;
            }
            else if (key_code == UI_KEY_CODE_EXIT ||
                key_code == UI_KEY_CODE_OK && !files->delete_confirm)
            {
                files->state = UI_FILES_MAIN;
                files->draw_request = true;
            }
            else if (key_code == UI_KEY_CODE_OK)
            {
                char *remove_file = calloc(strlen(CAPTURE_DIR) +
                                     strlen(files->file_list[files->selected_index]) + 1, 1);
                sprintf(remove_file, "%s/%s", CAPTURE_DIR,
                        files->file_list[files->selected_index]);
                remove(remove_file);
                int last_index = files->selected_index;
                int last_start = files->file_index_start;
                ui_files_reload(files);
                if (files->file_count == 0)
                {
                    ui_shell_show_toast(files->base.parent,
                        wkc_translations_get_string("files_empty_directory"), 5);
                    ui_shell_show_page(files->base.parent,
                        ui_shell_find_page(files->base.parent, UI_PAGE_TYPE_HOME));
                }
                else
                {
                    files->selected_index = last_index >= files->file_count ?
                                            files->file_count - 1 : last_index;
                    if (last_index >= files->file_count && last_index == last_start)
                    {
                        files->file_index_end = files->selected_index;
                        ui_files_calculate_item_range(files, true);
                    }
                    else
                    {
                        ui_files_calculate_item_range(files, false);
                    }
                    files->show = true;
                    files->draw_request = true;
                    files->state = UI_FILES_MAIN;
                }
            }
        }
        break;

        default:
        break;
    }
}

static void ui_files_on_format_changed(ui_files_t *files)
{
    files->show = true;
    files->draw_request = true;
}

ui_page_t *ui_files_create()
{
    ui_files_t *files = (ui_files_t*)calloc(1, sizeof(ui_files_t));
    files->base.type = UI_PAGE_TYPE_FILES;
    files->base.on_show = (ui_page_event_t)ui_files_on_show;
    files->base.on_draw = (ui_page_draw_event_t)ui_files_on_draw;
    files->base.on_key_event = (ui_page_key_event_t)ui_files_on_key_event;
    files->base.on_format_changed = (ui_page_event_t)ui_files_on_format_changed;
    return (ui_page_t*)files;
}