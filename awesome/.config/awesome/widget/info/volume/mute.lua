-- Title: Mute Status Widget
-- Author: Sai Nivas Mangu
-- Contact: sainonbeat99@gmail.com

local wibox = require("wibox")
local watch = require("awful.widget.watch")

local mute_text = wibox.widget{
    font = "BlexMono Nerd Font Mono SemiBold Italic 10",
    widget = wibox.widget.textbox,
}

local mute_widget = wibox.widget.background()
mute_widget:set_widget(mute_text)

mute_widget:set_bg("#2E3440")
mute_widget:set_fg("#BF616A")

-- Thanks to stackoverflow
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

watch(
    "pamixer --get-mute", 0.01,
    function (_, stdout, stderr, exitreason, exitcode)
        local mute = stdout
        mute = firstToUpper(mute)
        mute_text:set_text(" Mute: " .. mute)
    end,
  mute_widget
)
mute_text:set_text(" ??? ")
return mute_widget
