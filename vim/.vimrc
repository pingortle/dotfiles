" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'janko-m/vim-test'
  Plug 'jremmen/vim-ripgrep'
  Plug 'lifepillar/vim-solarized8'
  Plug 'mileszs/ack.vim'
  Plug 'pangloss/vim-javascript'
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

  Plug 'wincent/command-t', {
      \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
      \ }
call plug#end()

" Plugin Customization
let g:javascript_plugin_flow = 1

" Whitespace
set expandtab
set shiftwidth=2
set softtabstop=2

" UX
set scrolloff=2
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set number
set relativenumber
set spelllang=en_us
set complete+=kspell

cabbr <expr> %% expand('%:p:h')
command! Revim execute "so ~/.vimrc"

" Theme
set background=light
colorscheme solarized8_flat

" Filetype customizations
command! -nargs=* Wrap set wrap linebreak nolist
autocmd FileType markdown Wrap set colorcolumn=0
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" TIL stuff
nnoremap <leader>??? "=strftime("%x")<CR>P^i# <C-[>o
command! TIL execute "tabe" strftime("%Y-%m-%d.md")
nnoremap <leader>p :execute 'tabe' strftime("$MYDEV/notes/%Y-%m-%d.md")<CR>

" Session
function! GitDir()
  let git_path = substitute(system("git rev-parse --show-toplevel 2>/dev/null"), '\n', '', '')
  return git_path . "/.git"
endfunction

function! SaveSession(path)
  let session_file = a:path.'/session.vim'
  execute 'mksession! ' . session_file
endfunction

nnoremap <leader>w :wa<CR>:call SaveSession(GitDir())<CR>
