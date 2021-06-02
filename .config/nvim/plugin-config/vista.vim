" ____   ____.___  _________________________
" \   \ /   /|   |/   _____/\__    ___/  _  \
"  \   Y   / |   |\_____  \   |    | /  /_\  \
"   \     /  |   |/        \  |    |/    |    \
"    \___/   |___/_______  /  |____|\____|__  /
"                        \/                 \/

nnoremap <leader>vo :Vista<cr>|
nnoremap <leader>vc :Vista!<cr>|
nnoremap <leader>vt :Vista!!<cr>|
nnoremap <leader>vf :Vista focus<cr>

let g:vista_sidebar_width = 30
let g:vista_close_on_jump = 0
let g:vista_default_executive = 'nvim_lsp'
let g:vista_highlight_whole_line = 1
let g:vista#renderer#enable_icon  = 1
let g:vista_echo_cursor_strategy = 'echo'
let g:vista_update_on_text_changed = 1
let g:vista_disable_statusline = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:vista#renderer#icons = {
\   "function": "\uf794",
\  }

augroup NearestMethod
	autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup END

