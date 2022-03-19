lua << EOF
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup({
  auto_session_enable_last_session = false,
  auto_save_enabled = false,
  --- pre_save_cmds = { "tabdo Vista!", "tabdo TroubleClose" }
  pre_save_cmds = { "tabdo Vista!", "tabdo TroubleClose", "tabdo SymbolsOutlineClose" }
})
EOF

nnoremap <leader>ss <cmd>SaveSession<CR>
nnoremap <leader>sd <cmd>DeleteSession<CR>
nnoremap <leader>sr <cmd>RestoreSession<CR>
