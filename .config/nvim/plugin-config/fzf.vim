"________________________________
" \_   _____/\____    /\_   _____/
"  |    __)    /     /  |    __)
"  |     \    /     /_  |     \
"  \___  /   /_______ \ \___  /
"      \/            \/     \/

"~~~~~~~~~~ FZF PLUGIN  ~~~~~~~~~
noremap <leader>fp :GFiles <CR>|                             "  Search file in current git Directory
noremap <space><space> :FZF<CR>|                             "  Search file in current Directory
noremap <leader>ff :Files $HOME<CR>|                         "  Search file in Home Directory
noremap <leader>bb :Buffers<CR>|                             "  open buffer menu
noremap <leader>fh :History <CR>|                            "  command history
noremap <leader>Tc :Colors<CR>|                              "  Search colorschemes
nmap <leader>sb :BLines<CR>|                                 "  swoop current buffer
nmap <leader>sa :Lines<CR>|                                  "  swoop all open buffer

"~~~~~~~~~~ MAPPING HELP ~~~~~~~~~
nnoremap <leader>? :Commands<CR>
nnoremap <leader>?m :Maps<CR>


"Fzf-Swoop Config
let g:defaultWinSwoopHeight=15

" FZF Config
if !has( "win32" )
	" let $FZF_DEFAULT_COMMAND="find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
	let $FZF_DEFAULT_COMMAND="fd -H -E '.git' -E '.o' -E '.meta' -E 'node_modules/**' --type file --follow"
endif

let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
	let buf = nvim_create_buf(v:false, v:true)
	call setbufvar(buf, '&signcolumn', 'no')
	let height = float2nr(22)
	let width = float2nr(110)
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = float2nr((&lines - height) / 2)
	let opts = {
				\ 'relative': 'editor',
				\ 'row': vertical,
				\ 'col': horizontal,
				\ 'width': width,
				\ 'height': height,
				\ }
	call nvim_open_win(buf, v:true, opts)
endfunction

let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Keyword'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }
