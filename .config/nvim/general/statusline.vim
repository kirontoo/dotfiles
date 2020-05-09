"           __          __               .__  .__
"   _______/  |______ _/  |_ __ __  _____|  | |__| ____   ____
"  /  ___/\   __\__  \\   __\  |  \/  ___/  | |  |/    \_/ __ \
"  \___ \  |  |  / __ \|  | |  |  /\___ \|  |_|  |   |  \  ___/
" /____  > |__| (____  /__| |____//____  >____/__|___|  /\___  >
"      \/            \/                \/             \/     \/

set laststatus=2
set modifiable

set statusline=
set statusline +=%7*%#Include#\ %{toupper(g:currentmode[mode()])}  "  Current mode
set statusline +=%#Typedef#\ %n%*                                  "  buffer number
set statusline +=%#keyword#\ %{GitInfo()}                          "  Git Branch name

set statusline +=%#SpecialKey#\ %{GitLBracket()}%*
set statusline +=%#SignifySignAdd#%{GitAdded()}                    "  Git line added
set statusline +=%#SignifySignDelete#%{GitDeleted()}               "  Git line deleted
set statusline +=%#SignifySignChange#%{GitModified()}              "  Git line removed
set statusline +=%#SpecialKey#%{GitRBracket()}%*

set statusline +=%#SpecialKey#\[
set statusline +=%#Number#\ %<%f%*                                 "  file path
set statusline +=%#SpecialKey#\ ]

set statusline +=%#Identifier#\ %{ShowModified()}                  "  modified status

set statusline +=%=%*                                              "  separator
set statusline+=%#Number#%{'[\ '.(&filetype).'\ ]'}                "  file type
set statusline +=%#Identifier#%5l%*                                "  current line
set statusline +=%#SpecialKey#/%L%*                                "  total lines

set statusline +=%#Identifier#%4v\ %*                              "  virtual column number
set statusline +=%#SpecialKey#0x%04B\ %*                           "  character under cursor

set statusline +=%#Identifier#%2P\ %*                              "  virtual column number
set statusline +=%#Warningmsg#%{StatusDiagnostic()}                "  coc status

" Statusline
" :h mode() to see all modes
let g:currentmode={
			\ 'n'      : 'N ',
			\ 'no'     : 'N·Operator Pending ',
			\ 'v'      : 'V ',
			\ 'V'      : 'V·Line ',
			\ '\<C-V>' : 'V·Block ',
			\ 's'      : 'Select ',
			\ 'S'      : 'S·Line ',
			\ '\<C-S>' : 'S·Block ',
			\ 'i'      : 'I ',
			\ 'R'      : 'R ',
			\ 'Rv'     : 'V·Replace ',
			\ 'c'      : 'Command ',
			\ 'cv'     : 'Vim Ex ',
			\ 'ce'     : 'Ex ',
			\ 'r'      : 'Prompt ',
			\ 'rm'     : 'More ',
			\ 'r?'     : 'Confirm ',
			\ '!'      : 'Shell ',
			\ 't'      : 'Terminal '
			\}

highlight User1 cterm=None gui=None ctermfg=007 guifg=fgcolor
highlight User2 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User3 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User4 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User5 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User7 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User8 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User9 cterm=None gui=None ctermfg=007 guifg=fgcolor

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
	if (mode() =~# '\v(n|no)')
		exe 'hi! StatusLine ctermfg=008'
	elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
		exe 'hi! StatusLine ctermfg=005'
	elseif (mode() ==# 'i')
		exe 'hi! StatusLine ctermfg=004'
	else
		exe 'hi! StatusLine ctermfg=006'
	endif
	return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
	let bytes = getfsize(expand('%:p'))
	if (bytes >= 1024)
		let kbytes = bytes / 1024
	endif
	if (exists('kbytes') && kbytes >= 1000)
		let mbytes = kbytes / 1000
	endif
	if bytes <= 0
		return '0'
	endif
	if (exists('mbytes'))
		return mbytes . 'MB '
	elseif (exists('kbytes'))
		return kbytes . 'KB '
	else
		return bytes . 'B '
	endif
endfunction

function! ReadOnly()
	if &readonly || !&modifiable
		return ''
	else
		return ''
	endfunction

function! GitInfo()
	let git = fugitive#head()
	if git != ''
		return '  '.fugitive#head()
	else
		return ''
endfunction

function! StatusDiagnostic() abort
	let info = get(b:, 'coc_diagnostic_info', {})
	if empty(info) | return '' | endif
	let msgs = []
	if get(info, 'error', 0)
		call add(msgs, 'E' . info['error'])
	endif
	if get(info, 'warning', 0)
		call add(msgs, 'W' . info['warning'])
	endif
	return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '') . ' '
endfunction

function! GitAdded()
	let [added, modified, removed] = sy#repo#get_stats()
	if added > 0
		return ' +' . added . ' '
	else
		return ''
	endif
endfunction

function! GitDeleted()
	let [added, modified, removed] = sy#repo#get_stats()
	if removed > 0
		return ' -' . removed . ' '
	else
		return ''
	endif
endfunction

function! GitModified()
	let [added, modified, removed] = sy#repo#get_stats()
	if modified > 0
		return ' ~' . modified . ' '
	else
		return ''
	endif
endfunction

function! GitRBracket()
	let [added, modified, removed] = sy#repo#get_stats()
	if added || modified || removed
		return ']'
	else
		return ''
	endif
endfunction
function! GitLBracket()
	let [added, modified, removed] = sy#repo#get_stats()
	if added || modified || removed
		return '[ '
	else
		return ''
	endif
endfunction

function! ShowModified()
	let winnum = winnr()
	let modified = getbufvar( winbufnr( winnum ), '&modified' )
	if modified
		return '+'
	else
		return ''
	endif
endfunction

" 
" 
