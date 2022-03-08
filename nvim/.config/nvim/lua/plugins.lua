return require('packer').startup(function()
  -- packer manages itself
  use 'wbthomason/packer.nvim'  

  -- TODO: setup LSP and highlighting
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'folke/lsp-colors.nvim'
  use 'anott03/nvim-lspinstall'

  -- TODO: set this up as default
  use 'kosayoda/nvim-lightbulb'

  -- TODO: setup TreeSitter
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use 'norcalli/snippets.nvim'
  use 'norcalli/nvim-colorizer.lua'

  use {
    'akinsho/bufferline.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}

  use 'folke/tokyonight.nvim'
end)
