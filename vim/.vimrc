" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'DataWraith/auto_mkdir'
  Plug 'janko-m/vim-test'
  Plug 'jremmen/vim-ripgrep'
  Plug 'kana/vim-textobj-user'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rbenv'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-ruby/vim-ruby'

  " Themes
  Plug 'lifepillar/vim-solarized8'
  Plug 'reedes/vim-colors-pencil'

  " Noisy
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

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call textobj#user#plugin('dash', {
      \   'dash-word': {
      \     'pattern': '\(\w\|-\)\+',
      \     'select': ['adw', 'idw'],
      \   }
      \ })

" Theme
set background=light
" colorscheme solarized8_flat
colorscheme pencil
let g:pencil_terminal_italics = 1

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
  let git_path = substitute(system("git rev-parse --show-toplevel 2>/dev/null"), '\n\+$', '', '')
  return git_path . "/.git"
endfunction

function! GitBranch()
  return substitute(system("git rev-parse --abbrev-ref HEAD"), '\n\+$', '', '')
endfunction

function! SaveSession(path)
  let session_file = a:path.'/session.vim'
  execute 'mksession! ' . a:path
endfunction

function! SafeLoadVimfile(path)
  if filereadable(expand(a:path))
    execute 'source '.expand(a:path)
  endif
endfunction

nnoremap <leader>wg :wa<CR>:call SaveSession(GitDir().'/session.vim')<CR>
nnoremap <leader>w :wa<CR>:call SaveSession(GitDir().'/'.GitBranch().'.vim')<CR>

autocmd BufEnter,VimEnter call SafeLoadPath(GitDir().'.vimrc')
