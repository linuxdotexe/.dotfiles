local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'BlexMono Nerd Font Mono 10'
-- Colors Pallets

-- Primary
theme.primary = mat_colors.teal
theme.primary.hue_900 = '#2e3440'
-- Accent
theme.accent = mat_colors.red

-- Background
theme.background = mat_colors.blue_grey

theme.background.hue_800 = '#2e3440'
theme.background.hue_900 = '#2e3440'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
