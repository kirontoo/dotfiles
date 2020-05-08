"     .___                          .__
"   __| _/___________    ____  __ __|  | _____
"  / __ |\_  __ \__  \ _/ ___\|  |  \  | \__  \
" / /_/ | |  | \// __ \\  \___|  |  /  |__/ __ \_
" \____ | |__|  (____  /\___  >____/|____(____  /
"      \/            \/     \/                \/

noremap <leader>Ta :call Dracula()<CR>

function! Dracula()
	colorscheme dracula
	let g:airline_theme='dracula'
	set background=dark
	if exists('#lightline')
		let g:lightline.colorscheme='dracula'
		call lightline#enable()
	endif
endfunction

