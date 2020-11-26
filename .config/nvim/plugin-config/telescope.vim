lua <<EOF
-- totally optional to use setup
require('telescope').setup ({
  defaults = {
    shorten_path = false, -- currently the default value is true
		file_sorter = require('telescope.sorters').get_fzy_sorter
  }
})

EOF

nnoremap <leader>hc :lua require('telescope.builtin').command_history( require('telescope.themes').get_dropdown({ winblend=10, border=true, previewer=false, shorten_path=false }))<CR>
nnoremap <leader>gf :lua require'telescope.builtin'.git_files()<CR>
nnoremap <leader>gr :lua require('telescope.builtin').treesitter()<CR>
nnoremap <leader>/b :lua require('telescope.builtin').current_buffer_fuzzy_find( require('telescope.themes').get_dropdown({ winblend=10, border=true, previewer=false, shorten_path=false }))<CR>
nnoremap <leader>, :lua require('telescope.builtin').buffers( require('telescope.themes').get_dropdown({ winblend=10, border=true, previewer=false, shorten_path=false }))<CR>
nnoremap <leader>. :lua require('telescope.builtin').find_files( require('telescope.themes').get_dropdown({ cwd=vim.fn.expand("%:h"), winblend=10, border=true, previewer=false, shorten_path=false }))<CR>
nnoremap <leader>ht :lua require('telescope.builtin').help_tags()<CR>
