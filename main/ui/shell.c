#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "ui_common.h"
#include "page.h"
#include "math.h"
#include "display/graphics.h"
#include "display/display_control.h"
#include "profile/settings.h"
#include "esp_log.h"
#include "esp_timer.h"

#define MAX_PAGE_STORAGE_COUNT 10

typedef enum
{
    QUEUE_EVENT_UPDATE,
    QUEUE_EVENT_TOAST
} ui_shell_queue_event_t;

typedef struct
{
    ui_shell_queue_event_t event_type;
    int num;
    char *msg;
} ui_shell_queue_info_t;

typedef struct
{
    char *message;
    int64_t start_time;
    display_orientation_t orientation;
    int duration;
} ui_toast_t;

typedef struct ui_shell_t
{
    ui_toast_t toast;
    ui_page_t *current_page;
    ui_page_t *page_backlog;
    ui_page_t **page_storage;
    int key_backlog;
    display_format_t format_primary;
    display_format_t format_secondary;
    display_orientation_t orientation;
    int interval;
    QueueHandle_t queue;
} ui_shell_t;

static void toast_get_region(ui_toast_t *toast, display_rect_t *bound, display_format_t format,
                      display_orientation_t orientation)
{
    int logical_height = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                         DISPLAY_HEIGHT_PAL : DISPLAY_WIDTH_PAL;
    display_vector_t toast_origin = display_coordinate_compensation(18,
                                    logical_height - 18, format);
    int text_length;
    display_vector_t text_size;
    int selected_width = orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                                      DISPLAY_WIDTH_PAL : DISPLAY_HEIGHT_PAL;
    text_position_descriptor_t *descriptor = font_measure_text(toast->message, format,
        selected_width - 64, &text_length, &text_size);
    int toast_height = text_size.y + 6;

    *bound = (display_rect_t) {
        .x = toast_origin.x,
        .y = toast_origin.y - toast_height,
        .width = text_size.x + 12 + 1,
        .height = toast_height + 1
    };

    free(descriptor);
}

static void ui_shell_close_toast(ui_shell_t *shell)
{
    // Clear toast display region
    display_rect_t bound[2];
    toast_get_region(&shell->toast, &bound[0], shell->format_primary, shell->toast.orientation);
    toast_get_region(&shell->toast, &bound[1], shell->format_secondary, shell->toast.orientation);

    display_rect_expand(bound, 1, 1);
    display_rect_expand(bound + 1, 1, 1);

    display_fill_rect(2, shell->toast.orientation, &bound[0], DISPLAY_COLOR_TRANSPARENT);
    display_fill_rect(3, shell->toast.orientation, &bound[1], DISPLAY_COLOR_TRANSPARENT);

    display_update(0, shell->toast.orientation, &bound[0]);
    display_update(1, shell->toast.orientation, &bound[1]);

    // Free toast
    if (shell->toast.message)
    {
        free(shell->toast.message);
        shell->toast.message = NULL;
    }
}

static void ui_shell_sync_toast(ui_shell_t *shell, char *msg, int duration)
{
    if(shell == NULL) return;
    int64_t current_time = esp_timer_get_time();
    if(shell->toast.message != NULL)
    {
        if (current_time - shell->toast.start_time > (int64_t)shell->toast.duration * 1000000 ||
           duration < 0 || msg != NULL)
            ui_shell_close_toast(shell);
    }
    // Draw toast
    if (msg != NULL)
    {
        shell->toast.message = msg;
        shell->toast.orientation = shell->orientation;
        shell->toast.duration = duration;
        display_rect_t bound_primary, bound_secondary;
        toast_get_region(&shell->toast, &bound_primary, shell->format_primary, shell->orientation);
        toast_get_region(&shell->toast, &bound_secondary, shell->format_secondary, shell->orientation);

        display_fill_rounded_rect(2, shell->orientation, &bound_primary, DISPLAY_COLOR_BLACK, 3);
        display_draw_rounded_rect(2, shell->orientation, &bound_primary, DISPLAY_COLOR_WHITE, 3, 1);
        if (shell->orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
        {
            display_fill_rounded_rect(3, shell->orientation, &bound_secondary, DISPLAY_COLOR_BLACK, 3);
            display_draw_rounded_rect(3, shell->orientation, &bound_secondary, DISPLAY_COLOR_WHITE, 3, 1);
        }

        int text_length;
        display_vector_t text_size;

        int selected_width = shell->orientation == DISPLAY_ORIENTATION_HORIZONTAL ?
                             DISPLAY_WIDTH_PAL : DISPLAY_HEIGHT_PAL;
        text_position_descriptor_t *descriptor_primary = font_measure_text(shell->toast.message,
                                   shell->format_primary, selected_width - 64,
                                   &text_length, &text_size);
        text_position_descriptor_t *descriptor_secondary = font_measure_text(shell->toast.message,
                                   shell->format_secondary,
                                   selected_width - 64, &text_length, &text_size);
        display_draw_text(2, shell->orientation, bound_primary.x + 6, bound_primary.y + 3,
                          descriptor_primary, text_length, DISPLAY_COLOR_WHITE, shell->format_primary);

        if (shell->orientation != DISPLAY_ORIENTATION_VERTICAL_TILED)
            display_draw_text(3, shell->orientation, bound_secondary.x + 6, bound_secondary.y + 3,
                descriptor_secondary, text_length, DISPLAY_COLOR_WHITE, shell->format_secondary);
        free(descriptor_primary);
        free(descriptor_secondary);
        display_rect_expand(&bound_primary, 1, 1);
        display_rect_expand(&bound_secondary, 1, 1);
        display_update(0, shell->orientation, &bound_primary);
        display_update(1, shell->orientation, &bound_secondary);
        shell->toast.start_time = current_time;
    }
}

void ui_shell_show_toast(ui_shell_t *shell, char *message, int duration)
{
    if(shell == NULL) return;
    char *msg_copy = NULL;
    if (message != NULL)
    {
        msg_copy = calloc(strlen(message) + 1, 1);
        strcpy(msg_copy, message);
    }
    int result = xQueueSendToBack(shell->queue, (&(ui_shell_queue_info_t) {
        .event_type = QUEUE_EVENT_TOAST, .num = duration, .msg = msg_copy
    }), configTICK_RATE_HZ);
    if (result != pdTRUE && msg_copy) free(msg_copy);
}

void ui_shell_show_page(ui_shell_t *shell, ui_page_t *page)
{
    for(int i = 0; i < MAX_PAGE_STORAGE_COUNT; i++)
        if(shell->page_storage[i] == page)
        {
            shell->page_backlog = page;
            xQueueSendToBack(shell->queue, &(ui_shell_queue_info_t) {
                .event_type = QUEUE_EVENT_UPDATE
            }, configTICK_RATE_HZ);
            return;
        }
}

void ui_shell_add_page(ui_shell_t *shell, ui_page_t *page)
{
    for (int i = 0; i < MAX_PAGE_STORAGE_COUNT; i++)
        if(shell->page_storage[i] == page) return;
    for (int i = 0; i < MAX_PAGE_STORAGE_COUNT; i++)
    {
        if(shell->page_storage[i] == NULL)
        {
            shell->page_storage[i] = page;
            page->parent = shell;
            break;
        }
    }
}

ui_page_t *ui_shell_find_page(ui_shell_t *shell, ui_page_type_t type)
{
    for(int i = 0; i < MAX_PAGE_STORAGE_COUNT; i++)
        if(shell->page_storage[i]->type == type) return shell->page_storage[i];
    return NULL;
}

ui_page_t *ui_shell_get_current_page(ui_shell_t *shell)
{
    return shell->current_page;
}

display_orientation_t ui_shell_get_orientation(ui_shell_t *shell)
{
    return shell->orientation;
}

void ui_shell_send_key(ui_shell_t *shell, int key_code)
{
    shell->key_backlog = key_code;
    xQueueSendToBack(shell->queue, &(ui_shell_queue_info_t){
        .event_type = QUEUE_EVENT_UPDATE
    }, configTICK_RATE_HZ);
}

ui_shell_t *ui_shell_create()
{
    ui_shell_t *result = (ui_shell_t*)calloc(1, sizeof(ui_shell_t));
    result->format_primary = DISPLAY_FORMAT_PAL;
    result->format_secondary = DISPLAY_FORMAT_PAL;
    result->orientation = DISPLAY_ORIENTATION_HORIZONTAL;
    result->page_storage = (ui_page_t**)calloc(sizeof(ui_shell_t*) * MAX_PAGE_STORAGE_COUNT, 1);
    result->key_backlog = -1;
    result->toast.message = NULL;
    result->queue = xQueueCreate(10, sizeof(ui_shell_queue_info_t));
    return (ui_shell_t*)result;
}

void ui_shell_acquire_interval(ui_shell_t *shell, int interval)
{
    if (interval < shell->interval)
        shell->interval = interval;
}

void ui_shell_mainloop(ui_shell_t *shell)
{
    if(shell != NULL)
        for(;;)
        {
            ui_shell_queue_info_t queue_info = { .event_type = QUEUE_EVENT_UPDATE };
            xQueueReceive(shell->queue, &queue_info, shell->interval / portTICK_PERIOD_MS);
            shell->interval = 500;
            // Show page in backlog
            if(shell->page_backlog != NULL)
            {
                if(shell->page_backlog != shell->current_page)
                {
                    shell->current_page = shell->page_backlog;
                    ui_page_on_show(shell->current_page);
                }
            }
            if(shell->current_page != NULL && shell->key_backlog != -1)
            {
                ui_page_on_key_event(shell->current_page,shell->key_backlog);
                shell->key_backlog = -1;
            }
            for(int i = 0; i < MAX_PAGE_STORAGE_COUNT; i++)
            {
                if(shell->page_storage[i] == NULL) continue;
                ui_page_on_mainloop(shell->page_storage[i],
                    shell->page_storage[i] == shell->current_page);
            }
            ui_page_t *current = shell->current_page;
            if(current != NULL)
            {
                display_format_t formats[2];
                display_control_get_formats(formats);
                display_orientation_t new_orientation = (display_orientation_t)
                                    wkc_settings_get_current()->display.orientation;
                if (shell->format_primary != formats[0] ||
                    shell->format_secondary != formats[1] ||
                    shell->orientation != new_orientation)
                {
                    if (shell->format_primary != formats[0] ||
                    shell->format_secondary != formats[1])
                        vTaskDelay(2100 / portTICK_PERIOD_MS);
                    ui_shell_close_toast(shell);
                    ui_page_on_format_changed(current);
                    shell->format_primary = formats[0];
                    shell->format_secondary = formats[1];
                    shell->orientation = new_orientation;
                }
                ui_page_on_draw(current, (display_format_t[]) {
                    shell->format_primary, shell->format_secondary }, shell->orientation);
            }
            if(queue_info.event_type == QUEUE_EVENT_TOAST)
                ui_shell_sync_toast(shell, queue_info.msg, queue_info.num);
            else
                ui_shell_sync_toast(shell, NULL, 0);
        }
}