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

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_keywords = true

vim.cmd[[colorscheme tokyonight]]
