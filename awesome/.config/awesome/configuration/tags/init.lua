local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local tags = {
  {
    icon = icons.code,
    type = 'code',
    defaultApp = 'alacritty',
    screen = 1,
  },
  {
    icon = icons.cles,
    type = 'cles',
    defaultApp = 'brave',
    screen = 1,
    id = '2'
  },
  {
    icon = icons.social,
    type = 'social',
    defaultApp = 'telegram-desktop',
    screen = 1
  },
  {
    icon = icons.music,
    type = 'music',
    defaultApp = 'spotify',
    screen = 1
  },
  {
    icon = icons.lab,
    type = 'any',
    defaultApp = '',
    screen = 1
  },
  }

awful.layout.layouts = {
  awful.layout.suit.tile,
}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon = tag.icon,
          icon_only = true,
          layout = awful.layout.suit.tile,
          gap_single_client = true,
          gap = 5,
          screen = s,
          defaultApp = tag.defaultApp,
          selected = i == 1
        }
      )
    end
  end
)

_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 5
    else
      t.gap = 5
    end
  end
)
