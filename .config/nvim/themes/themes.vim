"   __  .__
" _/  |_|  |__   ____   _____   ____   ______
" \   __\  |  \_/ __ \ /     \_/ __ \ /  ___/
"  |  | |   Y  \  ___/|  Y Y  \  ___/ \___ \
"  |__| |___|  /\___  >__|_|  /\___  >____  >
"            \/     \/      \/     \/     \/

" Default theme
colorscheme embark
set background=dark

" NOTE: needs to be called after colorcheme
syntax on

nnoremap <leader>Tl :call LightScheme()<CR>

function! LightScheme()
	set background=light
	colorscheme solarized8_high
endfunction

highlight Pmenu guibg='#00010a' guifg=white             " popup menu colors
highlight Comment gui=italic cterm=italic               " bold comments
highlight Normal gui=none
highlight NonText guibg=none
highlight clear SignColumn                              " use number color for sign column color
" hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
autocmd ColorScheme * highlight VertSplit cterm=NONE    " split color
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=#ff7480 cterm=bold,undercurl          " misspelled words
