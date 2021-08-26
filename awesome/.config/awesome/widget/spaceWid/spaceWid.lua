-- Title: Space Widget
-- Author: Sai Nivas Mangu
-- Contact: sainonbeat99@gmail.com

local wibox = require("wibox")
local watch = require("awful.widget.watch")

local space_text = wibox.widget{
    font = "BlexMono Nerd Font Mono Bold 10",
    widget = wibox.widget.textbox,
}

local space_widget = wibox.widget.background()
space_widget:set_widget(space_text)

space_widget:set_bg("#2E3440")
space_widget:set_fg("#4C566A")

space_text:set_text(" | ")
return space_widget
