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
	let &guifont = substitute(
			\ &guifont,
			\ ':h\zs\d\+',
			\ '\=eval(submatch(0)+5)',
			\ '')
endfunction

function! s:goyo_leave()
	set list
	let &guifont = substitute(
			\ &guifont,
			\ ':h\zs\d\+',
			\ '\=eval(submatch(0)-5)',
			\ '')
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
