" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'sheerun/vim-polyglot'
    Plug 'scrooloose/NERDTree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch' : 'release'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'dense-analysis/ale'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
    Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }

call plug#end()
