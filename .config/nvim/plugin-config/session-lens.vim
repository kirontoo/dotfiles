lua << EOF
require('session-lens').setup({
  prompt_title = 'CHANGE SESSION',
  shorten_path = false,
})
EOF

nnoremap <leader>st <cmd>SearchSession<CR>
