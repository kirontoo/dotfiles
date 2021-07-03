"        _                               _
" __   _(_)_ __ ___  ___ _ __   ___  ___| |_ ___  _ __
" \ \ / / | '_ ` _ \/ __| '_ \ / _ \/ __| __/ _ \| '__|
"  \ V /| | | | | | \__ \ |_) |  __/ (__| || (_) | |
"   \_/ |_|_| |_| |_|___/ .__/ \___|\___|\__\___/|_|
"                       |_|
" taken from ThePrimeagen

let g:vimspectcor_install_gadgets = [ 'vscode-node-debug2', 'vscode-go', 'CodeLLDB' ]

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dh <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

function! GotoWindow( id )
  call win_gotoid( a:id )
endfunction
