local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Toggle NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Toggle Colorizer
keymap("n", "<leader>t", ":ColorizerToggle<CR>", opts)

-- Switch windows
keymap("n", "<leader>j", ":bnext<CR>", opts)
-- Close current window
keymap("n", "<leader>w", ":bdelete<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<C-q>", ":ToggleTerm<CR>", opts)
