-- Title: Volume Status Widget
-- Author: Sai Nivas Mangu
-- Contact: sainonbeat99@gmail.com

local wibox = require("wibox")
local watch = require("awful.widget.watch")

local vol_text = wibox.widget{
    font = "BlexMono Nerd Font Mono SemiBold Italic 10",
    widget = wibox.widget.textbox,
}

local vol_widget = wibox.widget.background()
vol_widget:set_widget(vol_text)

vol_widget:set_bg("#2E3440")
vol_widget:set_fg("#A3BE8C")

watch(
    "pamixer --get-volume", 0.01,
    function (_, stdout, stderr, exitreason, exitcode)
        local vol = nil
        vol = stdout
        vol_text:set_text(string.format("%d%%", vol))
    end,
  vol_widget
)
vol_text:set_text(" ??? ")
return vol_widget
