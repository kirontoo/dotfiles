"
"    ____   ____ ___.__. ____
"   / ___\ /  _ <   |  |/  _ \
"  / /_/  >  <_> )___  (  <_> )
"  \___  / \____// ____|\____/
" /_____/        \/

" Configure Goyo
let g:goyo_width=120     " width
let g:goyo_linenr=1

"~~~~~~~~~~ GOYO PLUGIN~~~~~~~~
nnoremap <leader>tz :Goyo<CR>|                               " toggle zen mode

function! s:goyo_enter()
	set nolist
endfunction

function! s:goyo_leave()
	set list
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
