scriptencoding utf-8

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
" let &t_ut=''

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup vimplug
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.vim/plugged')
  Plug '/usr/local/opt/fzf'
"   Plug 'AndrewRadev/splitjoin.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'DataWraith/auto_mkdir'
  Plug 'digitaltoad/vim-pug'
  Plug 'alvan/vim-closetag'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ElmCast/elm-vim'
"   Plug 'janko-m/vim-test'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/vim-emoji'
  Plug 'kana/vim-textobj-user'
"   Plug 'michaeljsmith/vim-indent-object'
"   Plug 'mustache/vim-mustache-handlebars'
"   Plug 'mxw/vim-jsx'
  Plug 'nelstrom/vim-textobj-rubyblock'
"   Plug 'pangloss/vim-javascript'
"   Plug 'reedes/vim-pencil'
"   Plug 'rizzatti/dash.vim'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
"   Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
"   Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rbenv'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
"   Plug 'tsiemens/vim-aftercolors'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-ruby/vim-ruby'
  Plug 'w0rp/ale'

" Themes
"  Plug 'lifepillar/vim-solarized8'
"  Plug 'rakr/vim-two-firewatch'
"  Plug 'nightsense/snow'
"  Plug 'KKPMW/sacredforest-vim'

" commenting out until I get a chance to figure out what's going on
"   Plug 'reedes/vim-colors-pencil'
"   Plug 'sonph/onehalf', {'rtp': 'vim/'}
"   Plug 'rakr/vim-one'
"   Plug 'cormacrelf/vim-colors-github'
"   Plug 'owickstrom/vim-colors-paramount'
"   Plug 'robertmeta/nofrils'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jeffkreeftmeijer/vim-dim'
"   Plug 'Lokaltog/vim-monotone'
call plug#end()

" " Theme
" " set termguicolors
" set background=light
colorscheme dim
let g:airline_theme = 'minimalist'

function! ReloadMood()
  for line in readfile($HOME.'/.dev-mood', '', 1)
    let &background = line
  endfor
endfunction
call ReloadMood()

function! SetMood(mood)
  silent execute '!bash' '-lc' 'good-'.a:mood
  call ReloadMood()
  execute 'redraw!'
endfunction

command! GoodMorning call SetMood('morning')
command! GoodNight call SetMood('night')

" " Plugin Customization
let g:markdown_fenced_languages = ['ruby', 'js=javascript']
let g:markdown_minlines = 150
let g:tmux_navigator_disable_when_zoomed = 1

" " Plugin vim-test
" let test#strategy = 'dispatch'

" " Plugin vim-closetag
" " filenames like *.xml, *.html, *.xhtml, ...
" " These are the file extensions where this plugin is enabled.

let g:closetag_filenames = '*.html,*.html.erb,*.xhtml,*.phtml'

" " filenames like *.xml, *.xhtml, ...
" " This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" " filetypes like xml, html, xhtml, ...
" " These are the file types where this plugin is enabled.

let g:closetag_filetypes = 'html,xhtml,phtml'

" " filetypes like xml, xhtml, ...
" " This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" " integer value [0|1]
" " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)

let g:closetag_emptyTags_caseSensitive = 1

" " Shortcut for closing tags, default is '>'

let g:closetag_shortcut = '>'

" " Add > at current position without closing the current tag, default is ''

let g:closetag_close_shortcut = '<leader>>'

" Plugin goyo
function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    " set linespace=16
    set guifont=OpenDyslexicMono:h20
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set linespace=0
    set guifont=Monaco:h16
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" " Plugin ALE
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.javascript = ['prettier-standard', 'standard']
let g:ale_fixers.ruby = ['standardrb']
let g:ale_fixers.scss = ['stylelint']
let g:ale_fixers.css = ['stylelint']

let g:ale_linters = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_linters.javascript = ['prettier-standard', 'standard']
let g:ale_linters.ruby = ['standardrb', 'reek']
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']

nnoremap <leader>= :ALEFix<cr>

" " Whitespace
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

" " UX
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

" " Easily navigate wrapped lines
noremap <C-p> gk
noremap <C-n> gj

nnoremap <leader>] :set nowrap<cr>
nnoremap <leader>[ :set wrap linebreak<cr>
nnoremap <leader>/ :noh<cr>

" " Follow tag immediately if there is only one match
nnoremap <C-]> g<C-]>

nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<CR>==
nnoremap <leader>h <<
nnoremap <leader>l >>

nnoremap <leader>g :Gstatus<CR>

nnoremap <leader>f :FZF<CR>

" " Shortcut for directory of current buffer's file
cabbr <expr> %% fnamemodify(expand('%:p:h'), ':~:.')

" command! Revim execute "so ~/.vimrc"

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

" " Turn on spelling for prosey files
augroup vimrc
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
augroup END

" " TIL stuff
" nnoremap <leader>??? "=strftime("%x")<CR>P^i# <C-[>o
" command! TIL execute "tabe" strftime("%Y-%m-%d.md")
" nnoremap <leader>p :execute 'tabe' strftime("$MYDEV/notes/%Y-%m-%d.md")<CR>

" " Session
function! GitDir()
  let git_path = substitute(system('git rev-parse --show-toplevel 2>/dev/null'), '\n\+$', '', '')
  return git_path . '/.git'
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

nnoremap <leader>w :wa<CR>:call SaveSession(GitDir().'/.vim-sessions/'.GitBranch().'.vim')<CR>

command! ChmodX execute "!chmod +x %"
nnoremap <leader>#! ^i#!/usr/bin/env

nnoremap <leader>rg :Rg <C-r><C-w>

" " Leave this at the end so projects get an opportunity to override things.
" " TODO: Add a boilerplate .vimrc to the git template
silent! call SafeLoadVimfile(GitDir().'/.vimrc')
