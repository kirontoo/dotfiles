"        .__       .__  .__
" _____  |__|______|  | |__| ____   ____
" \__  \ |  \_  __ \  | |  |/    \_/ __ \
"  / __ \|  ||  | \/  |_|  |   |  \  ___/
" (____  /__||__|  |____/__|___|  /\___  >
"      \/                       \/     \/

" Airline (Powerline) Themes and Config
let g:airline_theme='challenger_deep'

let g:webdevicons_enable_airline_statusline=1
let g:webdevicons_enable_airline_tabline = 1

let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='short_path'
let g:airline#extensions#tabline#buffer_nr_show=1 " buffer number
let g:airline#extensions#tabline#buffer_nr_format='%s: ' " buffer number

let g:airline_left_sep=''
let g:airline_right_sep=''

