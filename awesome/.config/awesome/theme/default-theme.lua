local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local theme = {}
local walp = {}
theme.icons = theme_dir .. '/icons/'
--theme.font = 'Roboto Medium 10'
local walp_dir = filesystem.get_configuration_dir() .. '/walps'
theme.font = 'BlexMono Nerd Font Mono 10'
-- Colors Pallets

-- Primary
theme.primary = mat_colors.black

-- Accent
theme.accent = mat_colors.pink

-- Background
theme.background = mat_colors.grey

local awesome_overrides =
  function(theme)
  theme.dir = os.getenv('HOME') .. '/.config/awesome/theme'
  walp.dir = os.getenv('HOME') .. '/.config/awesome/walps'

  theme.icons = theme.dir .. '/icons/'
  theme.wallpaper = walp.dir .. '/skull.png'
  --theme.wallpaper = '#e0e0e0'
  --theme.font = 'Roboto Medium 10'
  theme.font = 'BlexMono Nerd Font Mono 10'
  --theme.title_font = 'Roboto Medium 14'
  theme.title_font = 'BlexMono Nerd Font Mono 14'

  theme.fg_normal = '#665c54'

  theme.fg_focus = '#fbf1c7'
  theme.fg_urgent = '#fbf1c7'
  theme.bat_fg_critical = '#32302f'

  theme.bg_normal = theme.background.hue_800
  theme.bg_focus = '#5a5a5a'
  theme.bg_urgent = '#3F3F3F'
  theme.bg_systray = theme.background.hue_800

  -- Borders

  theme.border_width = dpi(2)
  theme.border_normal = theme.background.hue_800
  theme.border_focus = theme.primary.hue_300
  theme.border_marked = '#CC9393'

  -- Menu

  theme.menu_height = dpi(16)
  theme.menu_width = dpi(160)

  -- Tooltips
  theme.tooltip_bg = '#232323'
  --theme.tooltip_border_color = '#232323'
  theme.tooltip_border_width = 0
  theme.tooltip_shape = function(cr, w, h)
    gears.shape.rectangle(cr, w, h)
  end

  -- Layout

  --theme.layout_max = theme.icons .. 'layouts/arrow-expand-all.png'
  theme.layout_tile = theme.icons .. 'layouts/view-quilt.png'

  -- Taglist

  theme.taglist_bg_empty = theme.background.hue_800
  theme.taglist_bg_occupied = theme.background.hue_800
  theme.taglist_bg_urgent =
    'linear:0,0:' ..
    dpi(0) ..
      ',0:0,' ..
        theme.accent.hue_500 ..
          ':0.08,' .. theme.accent.hue_500 .. ':0.08,' .. theme.background.hue_800 .. ':1,' .. theme.background.hue_800
  theme.taglist_bg_focus =
    'linear:0,0:' ..
    dpi(0) ..
      ',0:0,' ..
        theme.primary.hue_500 ..
          ':0.08,' .. theme.primary.hue_500 .. ':0.08,' .. theme.background.hue_800 .. ':1,' .. theme.background.hue_800

  -- Tasklist

  --theme.tasklist_font = 'Roboto Medium 11'
  theme.tasklist_font = 'BlexMono Nerd Font Mono 11'
  theme.tasklist_bg_normal = theme.background.hue_800
  theme.tasklist_bg_focus =
    'linear:0,0:0,' ..
    dpi(25) ..
      ':0,' ..
        theme.background.hue_800 ..
          ':0.95,' .. theme.background.hue_800 .. ':0.95,' .. theme.fg_normal .. ':1,' .. theme.fg_normal
  theme.tasklist_bg_urgent = theme.primary.hue_800
  theme.tasklist_fg_focus = '#a89984'
  theme.tasklist_fg_urgent = theme.fg_normal
  theme.tasklist_fg_normal = '#a89984'

  theme.icon_theme = 'oomox-gruvbox-dark'

  --Client
  theme.border_width = dpi(2)
  theme.border_focus = theme.primary.hue_500
  theme.border_normal = theme.background.hue_800
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
