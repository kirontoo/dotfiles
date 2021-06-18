"  _ __  _ __  _ __
" | '_ \| '_ \| '_ \
" | | | | | | | | | |
" |_| |_|_| |_|_| |_|

" let g:nnn#layout= { 'window': { 'width': 0.2, 'height': 1, 'xoffset': 1, 'yoffset': 0,'highlight': 'Debug', 'border': 'sharp'} }
let g:nnn#session = 'local'
let g:nnn#layout = 'vnew' " or vnew, tabnew etc.
let g:nnn#layout = { 'left': '~20%' }

nnoremap <silent><leader>n :NnnPicker<CR>
nnoremap <silent><leader>nd :NnnPicker %:p:h<CR>

let g:nnn#action = {
	\ '<c-t>': 'tab split',
	\ '<c-x>': 'split',
	\ '<c-v>': 'vsplit'
}
