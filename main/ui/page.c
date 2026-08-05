#include "ui_common.h"
#include <stdlib.h>
#include <string.h>
#include "shell.h"

ui_shell_t *ui_page_get_parent(ui_page_t *page)
{
    return page->parent;
}

ui_page_type_t ui_page_get_type(ui_page_t *page)
{
    return page->type;
}

void ui_page_on_show(ui_page_t *page)
{
    if(page->parent == NULL || page == NULL) return;
    if(page->on_show != NULL)
        page->on_show(page);
}

void ui_page_on_draw(ui_page_t *page, display_format_t *formats, display_orientation_t orientation)
{
    if(page == NULL) return;
    if(ui_shell_get_current_page(page->parent) != page) return;
    if(page->on_draw != NULL)
        page->on_draw(page, formats, orientation);
}

void ui_page_on_key_event(ui_page_t *page, int key_code)
{
    if(page == NULL) return;
    if(page->on_key_event != NULL)
        page->on_key_event(page, key_code);
}

void ui_page_on_mainloop(ui_page_t *page, bool on_foreground)
{
    if(page->on_mainloop != NULL)
        page->on_mainloop(page, on_foreground);
}

void ui_page_on_format_changed(ui_page_t *page)
{
    if(page->on_format_changed != NULL)
        page->on_format_changed(page);
}