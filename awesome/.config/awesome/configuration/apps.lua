local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    editor = 'nvim',
    lock = 'i3lock',
    quake = 'alacritty --title QuakeTerminal'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'xfce4-power-manager', -- Power manager
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)' -- credential manager
  }
}
