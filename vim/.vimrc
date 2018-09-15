" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'janko-m/vim-test'
  Plug 'lifepillar/vim-solarized8'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rbenv'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-ruby/vim-ruby'
call plug#end()

" Whitespace
set expandtab
set shiftwidth=2
set softtabstop=2

" UX
set scrolloff=2
set showcmd
set incsearch
set hlsearch
set number
set relativenumber
set spelllang=en_us
set complete+=kspell

" Theme
set background=light
colorscheme solarized8_flat

" Filetype customizations
command! -nargs=* Wrap set wrap linebreak nolist
autocmd FileType markdown Wrap set colorcolumn=0
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
