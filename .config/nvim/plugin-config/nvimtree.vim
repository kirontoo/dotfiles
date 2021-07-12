let g:nvim_tree_auto_close = 1 " auto close tree if last buffer
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_width_allow_resize = 1
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard', 'vimwiki' ]
let g:nvim_tree_width = 40
let g:nvim_tree_follow = 1

nnoremap <leader>tt <cmd>NvimTreeToggle<CR>
nnoremap <leader>tf <cmd>NvimTreeFindFile<CR>
nnoremap <leader>tr <cmd>NvimTreeRefresh<CR>
nnoremap <leader>tc <cmd>NvimTreeClose<CR>
