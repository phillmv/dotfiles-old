" Seems to be mostly based off 256-jungle.
" Vim remains relusive and mysterious to me.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="reslate"

" background
hi Normal ctermfg=15 ctermbg=0 guifg=White guibg=grey15


hi Special guibg=bg guifg=#ffa500 gui=none
hi PreProc guibg=bg guifg=#ff80ff gui=none
hi Statement guibg=bg guifg=#ffff60 gui=bold
"hi String guibg=bg guifg=#87ceeb gui=none

" dark greenish
hi String guibg=bg guifg=#40A629 gui=none

hi Constant guibg=bg guifg=#ffa0a0 gui=none
hi Type guibg=bg guifg=#60ff60 gui=bold
hi Function guibg=bg guifg=#ffdead gui=none

" nice blue
hi Comment guibg=bg guifg=#80a0ff gui=none
hi Underlined guibg=bg guifg=#80a0ff gui=underline
hi Identifier guibg=bg guifg=#40ffff gui=none

" nice orange
hi Title guibg=bg guifg=#ffd700 gui=bold
hi Operator guibg=bg guifg=#ff0000 gui=none
hi Include guibg=bg guifg=#ff0000 gui=none
hi Todo guibg=#ffff00 guifg=#0000ff gui=none
hi Define guibg=bg guifg=#ffd700 gui=bold

hi NERDTreeDir guifg=#80a0ff
hi NERDTreeDirSlash guifg=#80a0ff
hi NERDTreeCMD guifg=#ffd700
hi NERDTreeCWD guifg=#ffd700

hi NERDTreeUp guifg=#40A629

hi rubyRegexpQuantifier guifg=wheat
hi rubyPredefinedVariable  guibg=bg guifg=#ffa0a0 gui=none
hi javaScriptLabel guibg=bg guifg=#ffa500 gui=none


hi SpecialKey      term=bold ctermfg=2 guifg=yellowgreen
hi NonText         term=bold cterm=bold ctermfg=9 gui=bold guifg=RoyalBlue guibg=grey15
hi Directory       term=bold ctermfg=3 guifg=Cyan
hi ErrorMsg        term=standout cterm=bold ctermfg=7 ctermbg=1 guifg=White guibg=Red

hi IncSearch       term=reverse ctermfg=14 ctermbg=10 guifg=wheat guibg=peru
hi Search          term=reverse ctermfg=7 ctermbg=9 guifg=wheat guibg=peru


hi MoreMsg         term=bold ctermfg=2 gui=bold guifg=SeaGreen
hi ModeMsg         term=bold ctermfg=6 gui=bold guifg=goldenrod
hi LineNr          term=underline ctermfg=3 guifg=grey50
hi Question        term=standout ctermfg=10 gui=bold guifg=springgreen
hi StatusLine      term=bold,reverse cterm=bold,reverse guifg=grey40 guibg=white
hi StatusLineNC    term=reverse cterm=reverse guifg=grey15 guibg=#c2bfa5
hi VertSplit       term=reverse cterm=reverse guifg=grey15 guibg=#c2bfa5
hi Title           term=bold cterm=bold ctermfg=14 gui=bold guifg=gold
hi Visual          term=reverse cterm=reverse guifg=khaki guibg=olivedrab
hi VisualNOS       term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg      term=standout ctermfg=1 guifg=salmon
hi WildMenu        term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
hi Folded          term=standout ctermfg=7 ctermbg=8 guifg=grey40 guibg=black
hi FoldColumn      term=standout ctermfg=4 ctermbg=7 guifg=grey20 guibg=black
hi DiffAdd         term=bold ctermbg=4 guibg=DarkBlue
hi DiffChange      term=bold ctermbg=5 guibg=DarkMagenta
hi DiffDelete      term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
hi DiffText        term=reverse cterm=bold ctermbg=1 gui=bold guibg=Red
hi SignColumn      term=standout ctermfg=11 ctermbg=8 guifg=Cyan guibg=Grey
hi Conceal         ctermfg=7 ctermbg=8 guifg=LightGrey guibg=DarkGrey
hi SpellBad        term=reverse ctermbg=12 gui=undercurl guisp=Red
hi SpellCap        term=reverse ctermbg=9 gui=undercurl guisp=Blue
hi SpellRare       term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi SpellLocal      term=underline ctermbg=11 gui=undercurl guisp=Cyan
hi Pmenu           ctermbg=13 guibg=Magenta
hi PmenuSel        ctermbg=8 guibg=DarkGrey
hi PmenuSbar       ctermbg=7 guibg=Grey
hi PmenuThumb      cterm=reverse gui=reverse
hi TabLine         term=underline cterm=underline ctermfg=15 ctermbg=8 gui=underline guibg=DarkGrey
hi TabLineSel      term=bold cterm=bold gui=bold
hi TabLineFill     term=reverse cterm=reverse gui=reverse
hi CursorColumn    term=reverse ctermbg=8 guibg=Grey40
hi CursorLine      term=underline cterm=underline guibg=Grey40
hi ColorColumn     term=reverse ctermbg=4 guibg=DarkRed
hi Cursor          guifg=slategrey guibg=khaki
hi lCursor         guifg=bg guibg=fg
hi MatchParen      term=reverse ctermbg=3 guibg=DarkCyan
hi Normal          guifg=White guibg=grey15
hi Comment         term=bold ctermfg=11 guifg=#80a0ff
hi Constant        term=underline ctermfg=13 guifg=#ffa0a0
hi Special         term=bold ctermfg=12 guifg=Orange

hi Identifier      term=underline cterm=bold ctermfg=11 guifg=#40ffff
hi Statement       term=bold ctermfg=14 gui=bold guifg=#ffff60
hi PreProc         term=underline ctermfg=9 guifg=#ff80ff
hi Type            term=underline ctermfg=10 gui=bold guifg=#60ff60
