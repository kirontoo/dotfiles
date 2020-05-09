"           __          __               .__  .__
"   _______/  |______ _/  |_ __ __  _____|  | |__| ____   ____
"  /  ___/\   __\__  \\   __\  |  \/  ___/  | |  |/    \_/ __ \
"  \___ \  |  |  / __ \|  | |  |  /\___ \|  |_|  |   |  \  ___/
" /____  > |__| (____  /__| |____//____  >____/__|___|  /\___  >
"      \/            \/                \/             \/     \/

set laststatus=2

" set statusline=
" set statusline+=\ %l
" set statusline+=\ %*
" set statusline+=\ 
" set statusline+=\ %m
" set statusline+=\ %F
" set statusline+=\ 
" set statusline+=%=
" " set statusline+=\ %{LinterStatus()}
" set statusline+=\ 
" " set statusline+=\ %{strftime('%R', getftime(expand('%')))}
" set statusline+=\ ::
" set statusline+=\ %n
" set statusline+=\ ››\ %*

" set statusline=
" set statusline+=%<\                       " cut at start
" " set statusline+=%2*[%n%H%R%W]%*\        " flags and buf no
" " set statusline+=%#PmenuSel#                       " cut at start
" set statusline+=%{StatuslineGit()}
" " set statusline+=%#LineNr#                       " cut at start
" set statusline+=                  " path
" set statusline+=\ %f\                    " path
" set statusline+=                   " path
" " set statusline+=\ %m                   " path
" set statusline+="%{&modified ? '-': '+'}"
" set statusline+=%=%1*%y%*%*\              " file type
" set statusline+=%10([\ %l/%L\ ]%)\            " line and column
" set statusline+=%P                        " percentage of file
"
" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction
"
" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?' '.l:branchname.' ':''
" endfunction

set laststatus=2
set statusline=
set statusline+=%#function#\ %l
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ "%{&m ? '+' : ''}"
" set statusline+=%#keyword#\ %F
set statusline+=%=
set statusline+=\ ‹‹
set statusline+=\ %{strftime('%R',getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ %*

set modifiable
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
    return ' '.fugitive#head()
  else
    return ''
endfunction

" 
" 

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%#Identifier#\ %n\                                " buffernr
set statusline+=%#keyword#\ %{GitInfo()}                 " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ \ %w\        " File+path
" set statusline+=%#warningmsg#
" set statusline+=%*
set statusline+=%8*%#keyword#%{ShowModified()}
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
" set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
" set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)

highlight User1 cterm=None gui=None ctermfg=007 guifg=fgcolor
highlight User2 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User3 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User4 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User5 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User7 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User8 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User9 cterm=None gui=None ctermfg=007 guifg=fgcolor

function! ShowModified()
	let winnum = winnr()
	let modified = getbufvar( winbufnr( winnum ), '&modified' )
	if modified
		return '+'
	else
		return ''
	endif
endfunction

set statusline=
set statusline +=%#Identifier#\ %n\ %*                  " buffer number
" set statusline +=%#PreProc#%{&ff}%*                     " file format
set statusline +=%#Number#%y%*                          " file type
set statusline +=%#String#\ %<%t%*                      " full path
set statusline +=%#String#\ %<%F%*                      " full path
" set statusline +=%#SpecialKey#%m%*                      " modified flag
set statusline +=%#Identifier#\ %{ShowModified()}\ %* " pomodoro status
set statusline +=%8*%=%*                                   " separator
set statusline +=%#Identifier#%5l%*                     " current line
set statusline +=%#SpecialKey#/%L%*                     " total lines
set statusline +=%#Identifier#%4v\ %*                   " virtual column number
set statusline +=%#SpecialKey#0x%04B\ %*                " character under cursor
