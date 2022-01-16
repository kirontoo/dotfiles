"                           ___.
"    ___________ __ _____  _\_ |__   _______  ___
"   / ___\_  __ \  |  \  \/ /| __ \ /  _ \  \/  /
"  / /_/  >  | \/  |  /\   / | \_\ (  <_> >    <
"  \___  /|__|  |____/  \_/  |___  /\____/__/\_ \
" /_____/                        \/            \/"   __  .__


let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'

noremap <leader>Tg :call Gruvbox()<CR>

function! Gruvbox()
	colorscheme gruvbox
	if exists('#lightline')
		let g:lightline.colorscheme='gruvbox'
		call lightline#enable()
	endif

    let g:lualinescheme="gruvbox"
	call MyLualine('gruvbox')
endfunction

nnoremap <leader>Tl :call LightScheme()<CR>

function! LightScheme()
	let g:gruvbox_contrast_light='hard'
	colorscheme gruvbox
	set background=light
    let g:lualinescheme="gruvbox"
	call MyLualine('gruvbox')
endfunction
