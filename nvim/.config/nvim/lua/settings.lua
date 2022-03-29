local au = require("au")

local settings = {
  undofile = true,
  cmdheight = 1,
  shiftwidth = 2,
  number = true,
  relativenumber = true,
  hlsearch = true,
  ignorecase = true,
  showtabline = 2,
  smartindent = true,
  showmode = false,
  updatetime = 500,
  expandtab = true,
  cursorline = true,
  termguicolors = true,
  conceallevel = 1,
}

for k, v in pairs(settings) do
  vim.o[k] = v
end
-- tokyonight color scheme settings
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_italic_keywords = true

vim.cmd[[colorscheme catppuccin]]

vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

-- PERF: bring back my nice underline cursor on the terminal
vim.cmd('autocmd VimLeave,VimSuspend * set guicursor=a:hor20')

-- PERF: preserve cursor position
vim.cmd[[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

-- TODO: autocmd
au.BufEnter = {"*", "ColorizerAttachToBuffer"}
