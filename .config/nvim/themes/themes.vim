"   __  .__
" _/  |_|  |__   ____   _____   ____   ______
" \   __\  |  \_/ __ \ /     \_/ __ \ /  ___/
"  |  | |   Y  \  ___/|  Y Y  \  ___/ \___ \
"  |__| |___|  /\___  >__|_|  /\___  >____  >
"            \/     \/      \/     \/     \/

" Default theme
set background=dark
colorscheme embark
call MyLualine('embark')
" colorscheme catppuccin
" call MyLualine('catppuccin')


" NOTE: needs to be called after colorcheme
syntax on

highlight Pmenu guibg=bg guifg=fg                       " popup menu colors
highlight Comment gui=NONE cterm=italic                 " italic comments
" highlight Normal gui=none
highlight NonText guibg=none
" highlight clear SignColumn                              " use number color for sign column color
" hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
" autocmd ColorScheme * highlight VertSplit cterm=NONE    " split color
" hi NonText guifg=bg                                     " mask ~ on empty lines
" hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=#ff7480 cterm=bold,undercurl          " misspelled words
