"     .___                          .__
"   __| _/___________    ____  __ __|  | _____
"  / __ |\_  __ \__  \ _/ ___\|  |  \  | \__  \
" / /_/ | |  | \// __ \\  \___|  |  /  |__/ __ \_
" \____ | |__|  (____  /\___  >____/|____(____  /
"      \/            \/     \/                \/

noremap <leader>ta :call Dracula()<CR>

function! Dracula()
	colorscheme dracula
	let g:airline_theme='dracula'
	set background=dark
endfunction

