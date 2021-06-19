-------------------------------------------------
-- Spotify Shell for Awesome Window Manager
-- Simplifies interaction with Spotify for Linux
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/spotify-shell

-- @author Pavel Makhov
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local gears = require("gears")


local shell = awful.widget.prompt()

local w = wibox {
    bg = '#282828',
    border_width = 1,
    border_color = '#a99984',
    max_widget_size = 500,
    ontop = true,
    height = 50,
    width = 250,
    shape = function(cr, width, height)
        gears.shape.rectangle(cr, width, height)
    end
}

w:setup {
    {
        layout = wibox.container.margin,
        left = 10,
        shell,
    },
    id = 'left',
    layout = wibox.layout.fixed.horizontal
}

local function launch()
    w.visible = true

    awful.placement.top(w, { margins = {top = 40}, parent = awful.screen.focused()})
    awful.prompt.run{
        bg_cursor = '#a99984',
        textbox = shell.widget,
        exe_callback = function(input_text)
            if not input_text or #input_text == 0 then return end
            awful.spawn("alacritty -e " .. input_text)
        end,
        done_callback = function()
            w.visible = false
        end
    }
end

return {
    launch = launch
}
