lua << EOF

local saga = require 'lspsaga'
saga.init_lsp_saga()
saga.init_lsp_saga {
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    quit = 'q',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>' -- quit can be a table
  },
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  rename_prompt_prefix = '',
}
EOF


" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

" code action
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

" show hover doc
" nnoremap <silent>K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>

" " scroll down hover doc or scroll in definition preview
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" " scroll up hover doc
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>


" show signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>

" and you also can use smart_scroll_with_saga to scroll in signature help win


" rename
nnoremap <silent><leader>cr :Lspsaga rename<CR>
" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`


" preview definition
nnoremap <silent> gd :Lspsaga preview_definition<CR>
" can use smart_scroll_with_saga to scroll

autocmd! CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()

" jump diagnostic
nnoremap <silent> [d :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]d :Lspsaga diagnostic_jump_prev<CR>
