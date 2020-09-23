" .__  .__       .__     __  .__  .__
" |  | |__| ____ |  |___/  |_|  | |__| ____   ____
" |  | |  |/ ___\|  |  \   __\  | |  |/    \_/ __ \
" |  |_|  / /_/  >   Y  \  | |  |_|  |   |  \  ___/
" |____/__\___  /|___|  /__| |____/__|___|  /\___  >
"        /_____/      \/                  \/     \/

" show tab line
set showtabline=2
"
" let g:lightline = {
" 			\ 'enable': { 'statusline': 0, 'tabline': 1 },
" 			\ 'colorscheme': 'seoul256',
" 			\ 'active': {
" 			\   'left': [ [ 'mode', 'paste' ],
" 			\             [ 'gitbranch', 'readonly' ],
" 			\							[ 'bufnum', 'absolutepath', 'modified' ] ],
" 			\		'right': [ [ 'currentfunction', 'cocstatus' ],
" 			\							 [ 'percent', 'lineinfo' ],
" 			\							 [ 'filetype', 'fileformat' ] ]
" 			\ },
" 			\ 'component_function': {
" 			\   'gitbranch': 'FugitiveHead',
" 			\		'cocstatus': 'coc#status',
" 			\		'currentfunction': 'CocCurrentFunction'}}
"
" let g:lightline.tabline = {
" 			\ 'left': [ [ 'buffers' ] ],
" 			\ 'right': [ [ 'close' ] ] }
"
" let g:lightline.tab = {
" 			\ 'active': [ 'tabnum', 'filename', 'modified' ],
" 			\ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
"
" let g:lightline.component_type = { 'buffers': 'tabsel' }
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
"
" let g:lightline#bufferline#show_number=1
" let g:lightline#bufferline#clickable=1
" let g:lightline#bufferline#shorten_path=0
"
" let g:lightline.component_raw = {'buffers': 1}
"
" let g:lightline.mode_map = {
" 			\ 'n' : 'NORMAL',
" 			\ 'i' : 'INSERT',
" 			\ 'r' : 'REPLACE',
" 			\ 'R' : 'REPLACE',
" 			\ 'v' : 'VISUAL',
" 			\ 'V' : 'V-LINE',
" 			\ "\<C-v>": 'V-BLOCK',
" 			\ 'c' : 'COMMAND',
" 			\ 's' : 'SELECT',
" 			\ 'S' : 'S-LINE',
" 			\ "\<C-s>": 'S-BLOCK',
" 			\ 't': 'TERMINAL',
" 			\ }
"



let g:TESTING_STATUS = 'passing'
function! TestingStatus() abort
  if g:TESTING_STATUS == 'passing'
    return " "
  elseif g:TESTING_STATUS == 'running'
    return " "
  elseif g:TESTING_STATUS == 'failing'
    return " "
  endif
endfunction


function! FileNameWithIcon() abort
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : ''
endfunction

function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction

function! Git_branch() abort
  if fugitive#head() !=# ''
    return  fugitive#head() . "  "
  else
    return "\uf468"
  endif
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})

  if get(info, 'error', 0)
    return ""
  endif

  if get(info, 'warning', 0)
    return info['warning'] . ""
  endif

  return ""
endfunction

let g:lightline = {}
let g:lightline.active = {
      \ 'left': [ ['mode', 'readonly'], ['filename_with_icon', 'modified']],
      \ 'right': [['lineinfo'], ['testing_status', 'status_diagnostic'] ]
      \ }
let g:lightline.separator = { 'left': " ", 'right': " " }
let g:lightline.tabline_separator = { 'left': " ", 'right': "" }
let g:lightline.tabline_subseparator = { 'left': "/", 'right': "/" }
let g:lightline.subseparator = { 'left': '\\', 'right': '\\' }

let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo'], [ 'tabs' ] ],
            \ 'right': [ [ 'git_branch' ]]
            \ }
let g:lightline.tab = {
        \ 'active': ['filename_with_parent'],
        \ 'inactive': ['filename']
        \ }

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
            \ 'artify_filename': 'lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum',
            \ 'filename_with_parent': 'FileNameWithParent'
            \ }

let g:lightline.component = {
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'vim_logo': "\ue7c5 ",
        \ 'git_branch': '%{Git_branch()}',
        \ 'filename_with_parent': '%t',
        \ 'status_diagnostic': '%{StatusDiagnostic()}',
        \ 'testing_status': '%{TestingStatus()}'
        \ }
