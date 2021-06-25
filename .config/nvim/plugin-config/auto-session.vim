lua << EOF
require('auto-session').setup({
  auto_session_enable_last_session = false,
  pre_save_cmds = { "tabdo NERDTreeClose", "tabdo Vista!" }
})
EOF

nnoremap <leader>ss <cmd>SaveSession<CR>
nnoremap <leader>sd <cmd>DeleteSession<CR>
nnoremap <leader>sr <cmd>RestoreSession<CR>
