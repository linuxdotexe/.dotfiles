local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'

return {
  --tags
  logo = dir .. '/logo.svg',
  --others
  close = dir .. '/close.svg',
  logout = dir .. '/logout.svg',
  sleep = dir .. '/power-sleep.svg',
  power = dir .. '/power.svg',
  lock = dir .. '/lock.svg',
  restart = dir .. '/restart.svg',
  plus = dir .. '/plus.svg'
}
