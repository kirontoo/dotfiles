" .__  .__       .__     __  .__  .__
" |  | |__| ____ |  |___/  |_|  | |__| ____   ____
" |  | |  |/ ___\|  |  \   __\  | |  |/    \_/ __ \
" |  |_|  / /_/  >   Y  \  | |  |_|  |   |  \  ___/
" |____/__\___  /|___|  /__| |____/__|___|  /\___  >
"        /_____/      \/                  \/     \/

" show tab line
set showtabline=2

let g:lightline = {
			\ 'enable': { 'statusline': 1, 'tabline': 1 },
			\ 'colorscheme': 'seoul256',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly' ],
			\							[ 'bufnum', 'absolutepath', 'modified' ] ],
			\		'right': [ [ 'currentfunction', 'cocstatus' ],
			\							 [ 'percent', 'lineinfo' ],
			\							 [ 'filetype', 'fileformat' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead',
			\		'cocstatus': 'coc#status',
			\		'currentfunction': 'CocCurrentFunction'}}

let g:lightline.tabline = {
			\ 'left': [ [ 'buffers' ] ],
			\ 'right': [ [ 'close' ] ] }

let g:lightline.tab = {
			\ 'active': [ 'tabnum', 'filename', 'modified' ],
			\ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.component_type = { 'buffers': 'tabsel' }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}

let g:lightline#bufferline#show_number=1
let g:lightline#bufferline#clickable=1
let g:lightline#bufferline#shorten_path=0

let g:lightline.component_raw = {'buffers': 1}

let g:lightline.mode_map = {
			\ 'n' : 'NORMAL',
			\ 'i' : 'INSERT',
			\ 'r' : 'REPLACE',
			\ 'R' : 'REPLACE',
			\ 'v' : 'VISUAL',
			\ 'V' : 'V-LINE',
			\ "\<C-v>": 'V-BLOCK',
			\ 'c' : 'COMMAND',
			\ 's' : 'SELECT',
			\ 'S' : 'S-LINE',
			\ "\<C-s>": 'S-BLOCK',
			\ 't': 'TERMINAL',
			\ }
