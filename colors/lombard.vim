" Maintainer:  Lars H. Nielsen (dengmao@gmail.com)
" Last Change:  January 22 2007

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   guibg=#2d2d2d
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen   guifg=#ff0000 guibg=NONE    gui=bold
  hi Pmenu 		  guifg=#f6f3e8 guibg=#444444
  hi PmenuSel 	  guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor 		  guifg=NONE    guibg=#656565 gui=none
hi Normal 		  guifg=#f6f3e8 guibg=#2B2D2D gui=none
hi NonText 		  guifg=#808080 guibg=#303030 gui=none
hi LineNr 		  guifg=#cccccc guibg=#1b1b1b gui=none
hi StatusLine 	  guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC   guifg=#857b6f guibg=#444444 gui=none
hi VertSplit 	  guifg=#444444 guibg=#444444 gui=none
hi Folded 		  guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		  guifg=#f6f3e8 guibg=NONE	  gui=bold
hi Visual		  guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey	  guifg=#808080 guibg=#343434 gui=none
hi Search		  guifg=#212121 guibg=#8ac6f2 gui=none

" Syntax highlighting
hi Comment 		  guifg=#B6AE99 gui=italic
hi Todo 		  guifg=#B6AE99 guibg=NONE gui=bold
hi Constant 	  guifg=#F6F0E1 gui=none
hi String 		  guifg=#E84C52 gui=none
hi Identifier 	  guifg=#56B3A6 gui=none
hi Function 	  guifg=#F6F0E1 gui=none
hi Type 		  guifg=#F6F0E1 gui=none
hi Statement 	  guifg=#56B3A6 gui=none
hi Keyword		  guifg=#56B3A6 gui=none
hi PreProc 		  guifg=#E84C52 gui=none
hi Number		  guifg=#E59E4B gui=none
hi Special		  guifg=#F6F0E1 gui=none

