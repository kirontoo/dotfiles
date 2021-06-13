" | |__   __ _ _ __| |__   __ _ _ __
" | '_ \ / _` | '__| '_ \ / _` | '__|
" | |_) | (_| | |  | |_) | (_| | |
" |_.__/ \__,_|_|  |_.__/ \__,_|_|

let bufferline = get(g:, 'bufferline', {})

let bufferline.animation = v:false

let bufferline.auto_hide = v:true

nnoremap <silent> <Tab>        :BufferNext<CR>
nnoremap <silent> <S-Tab>      :BufferPrevious<CR>
nnoremap <silent> <leader>bd   :BufferClose<CR>
nnoremap <silent> <leader>bp   :BufferPrevious<CR>
nnoremap <silent> <leader>bn   :BufferNext<CR>
nnoremap <silent> <leader>bd   :BufferClose<CR>
nnoremap <silent> <leader>bD   :BufferCloseAllButCurrent<CR>
nnoremap <silent> <leader>bdl  :BufferCloseBuffersLeft<CR>
nnoremap <silent> <leader>bdr  :BufferCloseBuffersRight<CR>
