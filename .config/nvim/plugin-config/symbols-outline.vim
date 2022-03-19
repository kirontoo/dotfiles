
lua << EOF
vim.g.symbols_outline = {
    auto_preview = false,
    show_relative_numbers = true,
    auto_close = false,
    relative_width = true,
    width = 15
}
EOF

nnoremap <leader>so <cmd>SymbolsOutline<cr>
nnoremap <leader>sc <cmd>SymbolsOutlineClose<cr>
