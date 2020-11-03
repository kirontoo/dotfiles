lua <<EOF
-- totally optional to use setup
require('telescope').setup {
  defaults = {
    shorten_path = false -- currently the default value is true
  }
}
EOF

" nnoremap <leader>fg :lua require'telescope.builtin'.git_files{}<CR>
" nnoremap <leader>ff :lua require'telescope.builtin'.find_files{}<CR>
" nnoremap <leader>gg :lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <leader>lf :lua require('telescope.builtin').treesitter{}<CR>
nnoremap <leader>,  :lua require'telescope.builtin'.buffers()<CR>
" nnoremap <leader>hh :lua require('telescope.builtin').command_history{}<CR>
