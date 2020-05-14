"           __          __               .__  .__
"   _______/  |______ _/  |_ __ __  _____|  | |__| ____   ____
"  /  ___/\   __\__  \\   __\  |  \/  ___/  | |  |/    \_/ __ \
"  \___ \  |  |  / __ \|  | |  |  /\___ \|  |_|  |   |  \  ___/
" /____  > |__| (____  /__| |____//____  >____/__|___|  /\___  >
"      \/            \/                \/             \/     \/

set laststatus=2
set modifiable

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END

set statusline=%!ActiveStatus()

function! InactiveStatus()
	let statusline=""

	" buffer number
	let statusline .= '%#Typedef# %n%*'
	" git branch
	let statusline .= '%#keyword# %{GitInfo()} '

	" git repo status
	let [added, modified, removed] = sy#repo#get_stats()

	" show modified
	" FIXME: will show modified on both active and inactive windows
	if &modified
		let statusline .= '%#SpecialKey#[ '
		let statusline .= '%#Identifier#+'
		let statusline .= '%#SpecialKey# ]'
	endif

	" file path
	let statusline .= '%#SpecialKey#['
	let statusline .= '%#Number# %<%f%*'
	let statusline .= '%#Warningmsg#%{ReadOnly()}'
	let statusline .= '%#SpecialKey# ]'

	" separator
	let statusline .= '%=%*'

	" filetype
	let statusline .= "%#Number#%{'[ '.(&filetype).' ]'} "

	return statusline
endfunction

function! ActiveStatus()
	let statusline=""

	" mode
	let statusline .= '%7*%#Include# %{toupper(g:currentmode[mode()])}'
	" buffer number
	let statusline .= '%#Typedef# %n%*'
	" git branch
	let statusline .= '%#keyword# %{GitInfo()} '

	" git repo status
	let [added, modified, removed] = sy#repo#get_stats()
	if added > 0 || removed > 0 || modified > 0
		let statusline .= '%#SpecialKey#['

		if added > 0
			let statusline .= '%#SignifySignAdd# +' . added . ' '
		endif

		if removed > 0
			let statusline .= '%#SignifySignDelete# -' . removed . ' '
		endif

		if modified > 0
			let statusline .= '%#SignifySignChange# ~' . modified . ' '
		endif

		let statusline .= '%#SpecialKey#] '

	elseif &modified
		let statusline .= '%#SpecialKey#[ '
	 	let statusline .= '%#Identifier#%{ShowModified()}'
		let statusline .= '%#SpecialKey# ]'
	endif

	" file path
	let statusline .= '%#SpecialKey#['
	let statusline .= '%#Number# %<%f%*'
	let statusline .= '%#Warningmsg#%{ReadOnly()}'
	let statusline .= '%#SpecialKey# ]'

	" separator
	let statusline .= '%=%*'

	" filetype and format
	let statusline .= '%#SpecialKey#['
	let statusline .= "%#Number#%{' '.(&ff).' '}"
	let statusline .= '%#SpecialKey#]'
	let statusline .= '%#SpecialKey#['
	let statusline .= "%#Number#%{' '.(&filetype).' '}"
	let statusline .= '%#SpecialKey#]'
	let statusline .= '%#Identifier#%5l%*'
	let statusline .= '%#SpecialKey#/%L%*'

	" line number, column, percentage
	let statusline .= '%#Identifier#%4v %*'
	let statusline .= '%#SpecialKey#0x%04B %*'
	let statusline .= '%#Identifier#%2P%*'

	let info = get(b:, 'coc_diagnostic_info', {})
	if get(info, 'error', 0)
		let statusline .= '%#Warningmsg# E' . info['error']
	endif

	if get(info, 'warning', 0)
		let statusline .= '%#SignifySignChange# W' . info['warning']
	endif

	let statusline .= '%#SpecialKey#' . get(g:, 'coc_status', '') . ' '

	return statusline
endfunction

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
		return ' '
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
