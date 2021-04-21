vim.g.dashboard_custom_header = {
' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝'
               
}
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
    a = {description = {'  New                '}, command = 'DashboardNewFile'},
    b = {description = {'  Search             '}, command = 'Telescope file_browser hidden=true'},
    c = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    d = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    e = {description = {'  Configs            '}, command = ':cd ~/.config/ | Telescope file_browser hidden=true'},
    f = {description = {'  ZSH                '}, command = ':e ~/.zshrc'},
    g = {description = {'  PY4E               '}, command = ':cd ~/hdd/py4e/ | Telescope file_browser'},
    h = {description = {'  Website            '}, command = ':cd ~/hdd/sainivasmangu.ml/ | Telescope file_browser'},
    i = {description = {'  Settings           '}, command = ':e ~/.config/nvim/lua/dashboard.lua'},
    j = {description = {'  Quit               '}, command = ':q'},
}
vim.g.dashboard_custom_footer = {'May the Force be with you.'}

