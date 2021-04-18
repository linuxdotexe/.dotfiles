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
    b = {description = {'  Search             '}, command = 'Telescope find_files'},
    c = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    d = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    e = {description = {'  Awesome            '}, command = ':e ~/.config/awesome/'},
    f = {description = {'  ZSH                '}, command = ':e ~/.zshrc'},
    g = {description = {'  PY4E               '}, command = ':e ~/hdd/py4e/new.py'},
    h = {description = {'  Quit               '}, command = ':q'},
}
vim.g.dashboard_custom_footer = {'May the Force be with you.'}
