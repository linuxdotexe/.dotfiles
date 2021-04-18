" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/autoload/plugged')

" Useful
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch' : 'release'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }
    Plug 'airblade/vim-gitgutter'
    "Plug 'mhinz/vim-startify'
    Plug 'glepnir/dashboard-nvim'
    Plug 'tpope/vim-surround'
    " Looks cool
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'nvim-lua/popup.nvim'  " telescope.nvim dependency
    Plug 'nvim-lua/plenary.nvim'    " telescope.nvim dependency
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'junegunn/limelight.vim'

call plug#end()
