-- Title: Kernel Version Display
-- Author: Sai Nivas Mangu
-- Contact: sainonbeat99@gmail.com

local wibox = require("wibox")
local watch = require("awful.widget.watch")

local kern_text = wibox.widget{
    font = "BlexMono Nerd Font Mono SemiBold Italic 10",
    widget = wibox.widget.textbox,
}

local kern_widget = wibox.widget.background()
kern_widget:set_widget(kern_text)

kern_widget:set_bg("#2E3440")
kern_widget:set_fg("#B48EAD")

watch(
    "uname -r", 6000,
    function (_, stdout, stderr, exitreason, exitcode)
        local kern = stdout
        kern_text:set_text(kern)
    end,
  kern_widget
)
kern_text:set_text(" ??? ")
return kern_widget
