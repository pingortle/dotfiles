if $TERM_PROGRAM ==# 'Apple_Terminal'
  highlight CursorLine         ctermfg=NONE ctermbg=10 cterm=NONE

  " In diffs, added lines are green, changed lines are yellow, deleted lines are
  " red, and changed text (within a changed line) is bright yellow and bold.

  " highlight DiffAdd        ctermfg=8    ctermbg=14
  " highlight DiffChange     ctermfg=8    ctermbg=11
  " highlight DiffDelete     ctermfg=8    ctermbg=9
  " highlight DiffText       ctermfg=0    ctermbg=11   cterm=bold

  " highlight SpellBad       ctermbg=9
  " highlight SpellRare      ctermbg=13

  " highlight Error          ctermfg=0 ctermbg=9
endif
