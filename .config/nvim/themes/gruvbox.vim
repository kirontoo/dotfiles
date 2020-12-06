"                           ___.
"    ___________ __ _____  _\_ |__   _______  ___
"   / ___\_  __ \  |  \  \/ /| __ \ /  _ \  \/  /
"  / /_/  >  | \/  |  /\   / | \_\ (  <_> >    <
"  \___  /|__|  |____/  \_/  |___  /\____/__/\_ \
" /_____/                        \/            \/"   __  .__


let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

noremap <leader>Tg :call Gruvbox()<CR>
function! Gruvbox()
	colorscheme gruvbox
	let g:airline_theme='gruvbox'
	if exists('#lightline')
		let g:lightline.colorscheme='gruvbox'
		call lightline#enable()
	endif
endfunction

