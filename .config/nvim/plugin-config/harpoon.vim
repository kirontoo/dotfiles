nnoremap <leader>ma :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-e> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-i> :lua require("harpoon.ui").nav_file(4)<CR>
