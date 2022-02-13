" ____   ____.___  _________________________
" \   \ /   /|   |/   _____/\__    ___/  _  \
"  \   Y   / |   |\_____  \   |    | /  /_\  \
"   \     /  |   |/        \  |    |/    |    \
"    \___/   |___/_______  /  |____|\____|__  /
"                        \/                 \/

nnoremap <leader>vo :Vista<cr>
nnoremap <leader>vc :Vista!<cr>
nnoremap <leader>vt :Vista!!<cr>
nnoremap <leader>vf :Vista focus<cr>
nnoremap <leader>vs :Vista finder<cr>

let g:vista_sidebar_width = 35
let g:vista_close_on_jump = 0
let g:vista_default_executive = 'ctags'
let g:vista_highlight_whole_line = 1
let g:vista#renderer#enable_icon  = 1
let g:vista_echo_cursor_strategy = 'echo'
let g:vista_update_on_text_changed = 1
let g:vista_disable_statusline = 1
let g:vista_icon_indent = ["", "﬌ "]
let g:vista_update_on_text_changed=1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\  }

let g:vista_executive_for = {
  \'ts': 'nvim_lsp',
  \'js': 'nvim_lsp',
  \'jsx': 'nvim_lsp',
  \'tsx': 'nvim_lsp',
  \'go': 'ctags',
  \'html': 'nvim_lsp',
  \'svelte': 'nvim_lsp',
  \'json': 'nvim_lsp',
  \'css': 'ctags'
  \}

" augroup NearestMethod
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" augroup END

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
