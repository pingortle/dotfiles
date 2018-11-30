scriptencoding utf-8

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug '/usr/local/opt/fzf'
  Plug 'DataWraith/auto_mkdir'
  Plug 'alvan/vim-closetag'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'janko-m/vim-test'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/vim-emoji'
  Plug 'kana/vim-textobj-user'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'mxw/vim-jsx'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'pangloss/vim-javascript'
  Plug 'reedes/vim-pencil'
  Plug 'tpope/vim-abolish'
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
  Plug 'w0rp/ale'

  " Themes
  " Plug 'lifepillar/vim-solarized8'
  " Plug 'rakr/vim-two-firewatch'
  " pencil was misbehaving (adding random junk to every fresh vim instance)
  " commenting out until I get a chance to figure out what's going on
  " Plug 'reedes/vim-colors-pencil'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'rakr/vim-one'
  Plug 'cormacrelf/vim-colors-github'
  Plug 'owickstrom/vim-colors-paramount'
  Plug 'robertmeta/nofrils'
  Plug 'vim-airline/vim-airline-themes'

"   " Noisy
"   Plug 'wincent/command-t', {
"       \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
"       \ }
call plug#end()

" Theme
let g:github_colors_soft = 1
colorscheme paramount
let g:airline_theme = 'minimalist'
set cursorline

" Plugin Customization
let g:markdown_fenced_languages = ['ruby', 'js=javascript']
let g:markdown_minlines = 150
let g:tmux_navigator_disable_when_zoomed = 1

" Plugin vim-test
let test#strategy = "dispatch"

" Plugin vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.

let g:closetag_filenames = '*.html,*.html.erb,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.

let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)

let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'

let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''

let g:closetag_close_shortcut = '<leader>>'

" Whitespace
set expandtab
set shiftwidth=2
set softtabstop=2
set showbreak=↪\ 

function! DefaultWhitespace()
  set list listchars=tab:\ \ ,precedes:«,extends:»,trail:░,nbsp:☐
endfunction
call DefaultWhitespace()

function! DebugWhitespace()
  call DefaultWhitespace()
  setlocal listchars+=space:⌟,tab:⌞\ ,eol:⏎
endfunction

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
set nowrap
set splitright

set wildcharm=<C-Z>
nnoremap <leader>z :b <C-Z>

nnoremap <C-]> g<C-]>
nnoremap <leader>] :set nowrap<cr>
nnoremap <leader>[ :set wrap<cr>

nnoremap j :m+<CR>==
nnoremap k :m-2<CR>==
nnoremap h <<
nnoremap l >>

inoremap j <Esc>:m+<CR>==gi
inoremap k <Esc>:m-2<CR>==gi
inoremap h <Esc><<gi<C-o>2h
inoremap l <Esc>>>gi<C-o>2l

" Experiment:
" Mapping ^[ in insert mode can be tricky because it introduces a lag when
" using <Esc> to return to normal mode. My muscle memory causes me to use a
" ^[{h,j,k,l} pattern to quickly move around after editing. I will see if
" I can learn to double mash ^[ in insert to alleviate this pain.
inoremap  <Esc><Esc>

vnoremap j :m'>+<CR>gv=gv
vnoremap k :m-2<CR>gv=gv
vnoremap h <gv
vnoremap l >gv

" See note for inoremap ^[^[ above
vnoremap  <Esc><Esc>

cabbr <expr> %% fnamemodify(expand('%:p:h'), ':~:.')
command! Revim execute "so ~/.vimrc"

call textobj#user#plugin('dash', {
      \   'dash-word': {
      \     'pattern': '\(\w\|-\)\+',
      \     'select': ['adw', 'idw'],
      \   },
      \   'html-comment': {
      \     'pattern': ['<!--', '-->'],
      \     'select-a': 'act',
      \     'select-i': 'ict',
      \   },
      \   'erb': {
      \     'pattern': ['<%', '%>'],
      \     'select-a': 'ace',
      \     'select-i': 'ice',
      \   },
      \ })

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
  let dir = fnamemodify(a:path, ":h")
  if !isdirectory(dir)
    call mkdir(dir, "p")
  endif
  execute 'mksession! ' . a:path
endfunction

function! SafeLoadVimfile(path)
  if filereadable(expand(a:path))
    execute 'source '.expand(a:path)
  endif
endfunction

nnoremap <leader>wg :wa<CR>:call SaveSession(GitDir().'/session.vim')<CR>
nnoremap <leader>w :wa<CR>:call SaveSession(GitDir().'/'.GitBranch().'.vim')<CR>

command! ChmodX execute "!chmod +x %"
nnoremap <leader>#! ^i#!/usr/bin/env

nnoremap <leader>rg :Rg <C-r><C-w>

" Leave this at the end so projects get an opportunity to override things.
" TODO: Add a boilerplate .vimrc to the git template
silent! call SafeLoadVimfile(GitDir().'/.vimrc')
