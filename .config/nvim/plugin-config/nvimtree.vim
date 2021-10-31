" let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard', 'vimwiki' ]
" let g:nvim_tree_width = 40
" let g:nvim_tree_follow = 1

lua << EOF
require('nvim-tree').setup {
  disable_netrw = false,
  hijack_netrw = false,
  auto_close = true,
  indent_markers = true,
  width_allow_resize = false,
  ignore_ft_on_setup = { 'startify', 'dashboard', 'vimwiki' },
  view = {
      width = 40
  }
}

EOF

nnoremap <leader>tt <cmd>NvimTreeToggle<CR>
nnoremap <leader>tf <cmd>NvimTreeFindFile<CR>
nnoremap <leader>tr <cmd>NvimTreeRefresh<CR>
nnoremap <leader>tc <cmd>NvimTreeClose<CR>
