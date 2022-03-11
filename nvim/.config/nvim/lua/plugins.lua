return require('packer').startup(function()
  -- packer manages itself
  use 'wbthomason/packer.nvim'  

  -- TODO: setup LSP and highlighting
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'folke/lsp-colors.nvim'
  use 'anott03/nvim-lspinstall'

  -- TODO: set this up as default
  -- highlights current scope
  use {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {
      }
    end
    }

  -- terminal inside nvim
  use 'akinsho/toggleterm.nvim'

  -- Auto-pairs
  use 'steelsojka/pears.nvim'

  -- Comments with shortcut like in VS Code
  use 'numToStr/Comment.nvim'

  -- better comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- highlights words and lines on the cursor
  use 'xiyaowong/nvim-cursorword'

  -- displays scope
  use {
    'SmiteshP/nvim-gps',
    requires = "nvim-treesitter/nvim-treesitter"
  }

  -- displays indent guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }

  -- TODO: set this up too
  -- diagnostics thing
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- TODO: setup TreeSitter
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use 'norcalli/snippets.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- pretty stuff
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
