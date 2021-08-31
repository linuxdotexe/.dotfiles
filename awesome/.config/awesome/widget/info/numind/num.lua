-- Title: NumLock Indicator Widget
-- Author: Sai Nivas Mangu
-- Contact: sainonbeat99@gmail.com

local wibox = require("wibox")
local watch = require("awful.widget.watch")

local num_text = wibox.widget{
    font = "BlexMono Nerd Font Mono SemiBold Italic 10",
    widget = wibox.widget.textbox,
}

local num_widget = wibox.widget.background()
num_widget:set_widget(num_text)

num_widget:set_bg("#2E3440")
num_widget:set_fg("#88C0D0")

watch(
    "xset q", 0.01,
    function (_, stdout, stderr, exitreason, exitcode)
        local num = tostring(stdout)
        if num:match("Num Lock") then
            local fou = num:gsub(".*(Num Lock:%s+)(%a+).*", "%2")
            local fout = string.upper(fou)
            num_text:set_text("Num Lock: " .. fout)
        end
    end,
    num_widget
)

num_text:set_text("???")
return num_widget
