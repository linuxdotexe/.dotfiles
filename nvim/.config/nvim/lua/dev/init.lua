require("dev.remap")
require("dev.set")
require("dev.packer")

-- PRESERVE THE GODDAMN CURSOR FOR CHRIST'S SAKE
vim.cmd('autocmd VimLeave,VimSuspend * set guicursor=a:hor20')

-- PERF: preserve cursor position
vim.cmd[[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
