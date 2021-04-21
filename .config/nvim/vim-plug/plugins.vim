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
    Plug 'airblade/vim-rooter'
    Plug 'glepnir/dashboard-nvim'
    Plug 'tpope/vim-surround'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    " Looks cool
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'

call plug#end()
