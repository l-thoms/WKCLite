#include "shell.h"
#include "string.h"
#include "profile/settings.h"
#include "profile/userprofile.h"
#include "profile/translations.h"
#include "esp_mac.h"
#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"
#include "protocol/ble.h"

#define LOGO_PREFIX "/data_static/priv_images/wkclite_logo_"
#define LOGO_WIDTH_PAL 120
#define LOGO_WIDTH_NTSC 100

typedef struct
{
    ui_page_t base;
    bool draw_request;
} ui_device_info_t;


void ui_device_info_on_show(ui_device_info_t *device_info)
{
    device_info->draw_request = true;
}

void ui_device_info_text_size_append(char *text, int *total_width, int *total_height)
{
    display_vector_t size;
    text_position_descriptor_t *descriptor = font_measure_text(text, DISPLAY_FORMAT_UNDEFINDED,
                                             0, NULL, &size);
    *total_width = size.x > *total_width ? size.x : *total_width;
    *total_height += size.y;
    free(descriptor);
}

void ui_device_info_text_write_line(char *text, int draw_x, int *draw_y,
                                    display_format_t formats[], display_orientation_t orientation)
{
    display_vector_t size_raw, size_primary, size_secondary;
    int text_length;
    text_position_descriptor_t *descriptor_raw = font_measure_text(text,
                               DISPLAY_FORMAT_UNDEFINDED, 0,
                               &text_length, &size_raw);
    text_position_descriptor_t *descriptor_primary = font_measure_text(text, formats[0],
                               0, NULL, &size_primary);
    text_position_descriptor_t *descriptor_secondary = font_measure_text(text, formats[1],
                               0, NULL, &size_secondary);
    display_vector_t draw_coordinate_primary = display_coordinate_compensation(draw_x, *draw_y,
                                               formats[0]);
    display_vector_t draw_coordinate_secondary = display_coordinate_compensation(draw_x, *draw_y,
                                                 formats[1]);
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
    {
        display_draw_text(0, orientation, draw_coordinate_primary.x + 1, draw_coordinate_primary.y + 1,
                        descriptor_primary, text_length, DISPLAY_COLOR_BLACK, formats[0]);
        display_draw_text(0, orientation, draw_coordinate_primary.x, draw_coordinate_primary.y,
                        descriptor_primary, text_length, DISPLAY_COLOR_WHITE, formats[0]);
    }
    display_draw_text(1, orientation, draw_coordinate_secondary.x + 1, draw_coordinate_secondary.y + 1,
                      descriptor_secondary, text_length, DISPLAY_COLOR_BLACK, formats[1]);
    display_draw_text(1, orientation, draw_coordinate_secondary.x, draw_coordinate_secondary.y,
                      descriptor_secondary, text_length, DISPLAY_COLOR_WHITE, formats[1]);
    *draw_y += size_raw.y;
    free(descriptor_raw);
    free(descriptor_primary);
    free(descriptor_secondary);
}

void ui_device_info_on_draw(ui_device_info_t *device_info, display_format_t* formats,
                            display_orientation_t orientation)
{
    wkc_userprofile_acquire_semaphore();
    wkc_userprofile_t *profile = wkc_userprofile_get_current();
    int logical_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                        DISPLAY_WIDTH_PAL : DISPLAY_HEIGHT_PAL;
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                         DISPLAY_HEIGHT_PAL : DISPLAY_WIDTH_PAL;
    if(!device_info->draw_request)
    {
        wkc_userprofile_release_semaphore();
        return;
    }
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        DISPLAY_CLEAR_SCREEN(0);
    DISPLAY_CLEAR_SCREEN(1);

    char device_name[strlen(profile->device_name) + 1];
    strcpy(device_name, profile->device_name);
    char owner[strlen(profile->owner) + 1];
    strcpy(owner, profile->owner);
    char character[strlen(profile->character) + 1];
    strcpy(character, profile->character);
    char manufacturer[strlen(profile->manufacturer) + 1];
    strcpy(manufacturer, profile->manufacturer);
    char model[] = "WKC Lite (ESP32-S3)";
    char mac_address[18];
    uint8_t mac_raw[6];
    esp_read_mac(mac_raw, ESP_MAC_BT);
    sprintf(mac_address, "%02X:%02X:%02X:%02X:%02X:%02X",
        mac_raw[0], mac_raw[1], mac_raw[2], mac_raw[3], mac_raw[4], mac_raw[5]);
    char protocol_version[17];
    uint8_t *protocol_version_block = protocol_get_version();
    sprintf(protocol_version, "v%d.%d.%d.%d",
            (int)protocol_version_block[0],
            (int)protocol_version_block[1],
            (int)protocol_version_block[2],
            (int)protocol_version_block[3]);

    char *device_name_title = wkc_translations_get_string("device_info_device_name");
    char *owner_title = wkc_translations_get_string("device_info_owner");
    char *character_title = wkc_translations_get_string("device_info_character");
    char *manufacturer_title = wkc_translations_get_string("device_info_manufacturer");
    char *model_title = wkc_translations_get_string("device_info_model");
    char *mac_address_title = wkc_translations_get_string("device_info_mac_address");
    char *protocol_version_title = wkc_translations_get_string("device_info_protocol_version");

    char device_name_combined[strlen(device_name) + strlen(device_name_title) + 3];
    char owner_combined[strlen(owner) + strlen(owner_title) + 3];
    char character_combined[strlen(character) + strlen(character_title) + 3];
    char manufacturer_combined[strlen(manufacturer) + strlen(manufacturer_title) + 3];
    char model_combined[strlen(model) + strlen(model_title) + 3];
    char mac_address_combined[strlen(mac_address) + strlen(mac_address_title) + 3];
    char protocol_version_combined[strlen(protocol_version_title) + strlen(protocol_version) + 3];

    sprintf(device_name_combined, "%s: %s",device_name_title, device_name);
    sprintf(owner_combined, "%s: %s",owner_title, owner);
    sprintf(character_combined, "%s: %s",character_title, character);
    sprintf(manufacturer_combined, "%s: %s",manufacturer_title, manufacturer);
    sprintf(model_combined, "%s: %s",model_title, model);
    sprintf(mac_address_combined, "%s: %s",mac_address_title, mac_address);
    sprintf(protocol_version_combined, "%s: %s",protocol_version_title, protocol_version);

    int total_width = 0, total_height = 0;

    ui_device_info_text_size_append(device_name_combined, &total_width, &total_height);
    ui_device_info_text_size_append(owner_combined, &total_width, &total_height);
    ui_device_info_text_size_append(character_combined, &total_width, &total_height);
    ui_device_info_text_size_append(manufacturer_combined, &total_width, &total_height);
    ui_device_info_text_size_append(model_combined, &total_width, &total_height);
    ui_device_info_text_size_append(mac_address_combined, &total_width, &total_height);
    ui_device_info_text_size_append(protocol_version_combined, &total_width, &total_height);

    int draw_x = (logical_width - total_width) / 2;
    int draw_y = (logical_height - total_height) / 2 - 32;

    ui_device_info_text_write_line(device_name_combined, draw_x, &draw_y, formats, orientation);
    ui_device_info_text_write_line(owner_combined, draw_x, &draw_y, formats, orientation);
    ui_device_info_text_write_line(character_combined, draw_x, &draw_y, formats, orientation);
    ui_device_info_text_write_line(manufacturer_combined, draw_x, &draw_y, formats, orientation);
    ui_device_info_text_write_line(model_combined, draw_x, &draw_y, formats, orientation);
    ui_device_info_text_write_line(mac_address_combined, draw_x, &draw_y, formats, orientation);
    ui_device_info_text_write_line(protocol_version_combined, draw_x, &draw_y, formats, orientation);

    draw_y += 4;
    display_line_t separator = {
        .x1 = draw_x, .x2 = draw_x + total_width,
        .y1 = draw_y, .y2 = draw_y
    };
    display_line_t separator_primary = display_line_compensation(&separator, formats[0]);
    display_line_t separator_secondary = display_line_compensation(&separator, formats[1]);
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
    {
        display_draw_line(0, orientation, &separator_primary, DISPLAY_COLOR_WHITE, 1);
        display_line_translate(&separator_primary, 1, 1);
        display_draw_line(0, orientation, &separator_primary, DISPLAY_COLOR_BLACK, 1);
    }
    display_draw_line(1, orientation, &separator_secondary, DISPLAY_COLOR_WHITE, 1);
    display_line_translate(&separator_secondary, 1, 1);
    display_draw_line(1, orientation, &separator_secondary, DISPLAY_COLOR_BLACK, 1);

    draw_y += 12;
    int logo_x = (logical_width - LOGO_WIDTH_PAL) / 2;
    display_vector_t logo_coordinate_primary = display_coordinate_compensation(
        logo_x, draw_y, formats[0]);
    display_vector_t logo_coordinate_secondary = display_coordinate_compensation(
        logo_x, draw_y, formats[1]);

    char logo_path_primary[50] = { 0 },
         logo_path_secondary[50] = { 0 };
    sprintf(logo_path_primary, "%s%s.bin", LOGO_PREFIX,
            formats[0] == DISPLAY_FORMAT_NTSC ? "ntsc" : "pal");
    sprintf(logo_path_secondary, "%s%s.bin", LOGO_PREFIX,
            formats[1] == DISPLAY_FORMAT_NTSC ? "ntsc" : "pal");
    if (orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
    {
        display_draw_image(0, orientation, logo_coordinate_primary.x + 1,
                           logo_coordinate_primary.y + 1, logo_path_primary,
                           formats[0] == DISPLAY_FORMAT_NTSC ? LOGO_WIDTH_NTSC :
                           LOGO_WIDTH_PAL, DISPLAY_COLOR_BLACK);
        display_draw_image(0, orientation, logo_coordinate_primary.x,
                           logo_coordinate_primary.y, logo_path_primary,
                           formats[0] == DISPLAY_FORMAT_NTSC ? LOGO_WIDTH_NTSC :
                           LOGO_WIDTH_PAL, DISPLAY_COLOR_WHITE);
    }
    display_draw_image(1, orientation, logo_coordinate_secondary.x + 1,
                       logo_coordinate_secondary.y + 1, logo_path_secondary,
                       formats[1] == DISPLAY_FORMAT_NTSC ? LOGO_WIDTH_NTSC :
                       LOGO_WIDTH_PAL, DISPLAY_COLOR_BLACK);
    display_draw_image(1, orientation, logo_coordinate_secondary.x,
                       logo_coordinate_secondary.y, logo_path_secondary,
                       formats[1] == DISPLAY_FORMAT_NTSC ? LOGO_WIDTH_NTSC :
                       LOGO_WIDTH_PAL, DISPLAY_COLOR_WHITE);
    DISPLAY_UPDATE_FULLSCREEN(0);
    DISPLAY_UPDATE_FULLSCREEN(1);
    device_info->draw_request = false;
    wkc_userprofile_release_semaphore();
}

void ui_device_info_on_key_event(ui_device_info_t *device_info, int key_code)
{
    switch (key_code)
    {
    case UI_KEY_CODE_EXIT:
        ui_page_t *home = ui_shell_find_page(device_info->base.parent, UI_PAGE_TYPE_HOME);
        if(home == NULL) return;
        ui_shell_show_page(device_info->base.parent, home);
        break;

    default:
        break;
    }
}

void ui_device_info_on_format_changed(ui_device_info_t *device_info)
{
    if (wkc_settings_get_current()->display.orientation == DISPLAY_ORIENTATION_VERTICAL_TILED)
        DISPLAY_CLEAR_SCREEN(0);

    ui_device_info_on_show(device_info);
}

ui_page_t *ui_device_info_create()
{
    ui_device_info_t *device_info = (ui_device_info_t*)calloc(1, sizeof(ui_device_info_t));
    device_info->base.type = UI_PAGE_TYPE_DEVICE_INFO;
    device_info->base.on_show = (ui_page_event_t)ui_device_info_on_show;
    device_info->base.on_draw = (ui_page_draw_event_t)ui_device_info_on_draw;
    device_info->base.on_key_event = (ui_page_key_event_t)ui_device_info_on_key_event;
    device_info->base.on_format_changed = (ui_page_event_t)ui_device_info_on_format_changed;
    return (ui_page_t*)device_info;
}