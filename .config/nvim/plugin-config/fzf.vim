"_______________________________
" \_   _____/\____    /\_   _____/
"  |    __)    /     /  |    __)
"  |     \    /     /_  |     \
"  \___  /   /_______ \ \___  /
"      \/            \/     \/

"~~~~~~~~~~ FZF PLUGIN  ~~~~~~~~~
noremap <leader>g :GFiles <CR>|                              "  Search file in current git Directory
noremap <leader>g :GFiles?<CR>|                              "  Git status
noremap <space><space> :FZF<CR>|                             "  Search file in current Directory
noremap <leader>, :Buffers<CR>|                              "  open buffer menu

noremap <leader>ff :Files $HOME<CR>|                         "  Search file in Home Directory
noremap <leader>hf :History<CR>|														 "  File history
noremap <leader>hc :History: <CR>|                           "  Command history
noremap <leader>h/ :History/ <CR>|                           "  Command history
noremap <leader>Tc :Colors<CR>|                              "  Search colorschemes
nmap <leader>/ :BLines<CR>|                                  "  Swoop current buffer
nmap <leader>sa :Lines<CR>|                                  "  Swoop all open buffer

nnoremap <silent> <leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <leader>c  :Commits<CR>
nnoremap <silent> <leader>bc :BCommits<CR>
nnoremap <silent> <leader>m :Marks<CR>

if filereadable('src/index.tsx')
  " This looks like a React app, add React specific mappings here.
	nnoremap <silent> <Leader>ec :Files src/components<CR>
endif

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
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'


let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

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
