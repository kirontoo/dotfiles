" .__  .__       .__     __  .__  .__
" |  | |__| ____ |  |___/  |_|  | |__| ____   ____
" |  | |  |/ ___\|  |  \   __\  | |  |/    \_/ __ \
" |  |_|  / /_/  >   Y  \  | |  |_|  |   |  \  ___/
" |____/__\___  /|___|  /__| |____/__|___|  /\___  >
"        /_____/      \/                  \/     \/

" show tab line
set showtabline=2

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

let g:lightline = { 'colorscheme': 'embark' }
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

"
" let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
"
" let s:embark0 = ["#585273", "NONE"]
" let s:embark1 = ["#3e3859", 0]
" let s:embark2 = ["#2d2b40", "NONE"]
" let s:embark3 = ["#100e23", 8]
" let s:embark4 = ["#8a889d", "NONE"]
" let s:embark5 = ["#CBE3E7", 7]
" let s:embark6 = ["#f02e6e", 15]
" let s:embark7 = ["#91ddff", 14]
" let s:embark8 = ["#65b2ff", 6]
" let s:embark9 = ["#87dfe0", 4]
" let s:embark10 = ["#63f2f1", 12]
" let s:embark11 = ["#f48fb1", 1]
" let s:embark12 = ["#f2b482", 11]
" let s:embark13 = ["#ffe6b3", 3]
" let s:embark14 = ["#a1efd3", 2]
" let s:embark15 = ["#d4bfff", 5]
"
" " let s:p.normal.left = [ [ s:embark1, s:embark8 ], [ s:embark5, s:embark1 ] ]
" let s:p.normal.left = [ [ s:embark3, s:embark14 ], [ s:embark5, s:embark1 ] ]
" let s:p.normal.middle = [ [ s:embark5, s:embark3 ] ]
" let s:p.normal.right = [ [ s:embark5, s:embark1 ], [ s:embark5, s:embark1 ] ]
" let s:p.normal.warning = [ [ s:embark1, s:embark13 ] ]
" let s:p.normal.error = [ [ s:embark1, s:embark11 ] ]
"
" let s:p.inactive.left =  [ [ s:embark1, s:embark8 ], [ s:embark5, s:embark1 ] ]
" let s:p.inactive.middle = [ [ s:embark5, s:embark1 ] ]
" let s:p.inactive.right = [ [ s:embark5, s:embark1 ], [ s:embark5, s:embark1 ] ]
"
" let s:p.insert.left = [ [ s:embark1, s:embark6 ], [ s:embark5, s:embark1 ] ]
" let s:p.replace.left = [ [ s:embark1, s:embark13 ], [ s:embark5, s:embark1 ] ]
" let s:p.visual.left = [ [ s:embark3, s:embark13 ], [ s:embark3, s:embark12 ] ]
"
" let s:p.tabline.left = [ [ s:embark5, s:embark3 ] ]
" let s:p.tabline.middle = [ [ s:embark5, s:embark1 ], [ s:embark5, s:embark3 ] ]
" let s:p.tabline.right = [ [ s:embark3, s:embark11 ] ]
" let s:p.tabline.tabsel = [ [ s:embark3, s:embark11 ] ]
"
" let g:lightline#colorscheme#embark#palette = lightline#colorscheme#flatten(s:p)
" Colors
let s:deep_space= { "gui": "#100E23", "cterm": "232", "cterm16": "8"}
let s:space = { "gui": "#1e1c31", "cterm": "233", "cterm16": "NONE"}
let s:eclipse = { "gui": "#3E3859", "cterm": "236", "cterm16": "0"}

let s:red = { "gui": "#F48FB1", "cterm": "204", "cterm16": "1"}
let s:dark_red = { "gui": "#ff5458", "cterm": "203", "cterm16": "9"}

let s:green = { "gui": "#A1EFD3", "cterm": "120", "cterm16": "2"}
let s:dark_green = { "gui": "#62d196", "cterm": "119", "cterm16": "10"}

let s:yellow = { "gui": "#ffe6b3", "cterm": "228", "cterm16": "3"}
let s:dark_yellow = { "gui": "#f2b982", "cterm": "215", "cterm16": "11"}

let s:blue = { "gui": "#91ddff", "cterm": "159", "cterm16": "4"}
let s:dark_blue = { "gui": "#65b2ff", "cterm": "75", "cterm16": "12"}

let s:purple = { "gui": "#d4bfff", "cterm": "141", "cterm16": "5"}
let s:dark_purple = { "gui": "#a37acc", "cterm": "135", "cterm16": "13"}

let s:cyan = { "gui": "#87dfeb", "cterm": "122", "cterm16": "6"}
let s:dark_cyan = { "gui": "#63f2f1", "cterm": "121", "cterm16": "14"}

let s:clouds = { "gui": "#cbe3e7", "cterm": "253", "cterm16": "7"}
let s:dark_clouds = { "gui": "#8a889d", "cterm": "252", "cterm16": "15"}

let s:bg              = s:space
let s:bg_dark       = s:deep_space
let s:bg_bright         = s:eclipse
let s:norm            = s:clouds
let s:norm_subtle     = s:dark_clouds
let s:visual          = s:bg_bright

" lightline embark colors
let s:lfc = {
      \'space': [s:space.gui, s:space.cterm16],
      \'deep_space': [s:deep_space.gui, s:deep_space.cterm16],
      \'eclipse' : [s:eclipse.gui, s:eclipse.cterm16],
      \'red' : [s:red.gui, s:red.cterm16],
      \'dark_red' : [s:dark_red.gui, s:dark_red.cterm16],
      \'green' : [s:green.gui, s:green.cterm16],
      \'dark_green' : [s:dark_green.gui, s:dark_green.cterm16],
      \'yellow' : [s:yellow.gui, s:yellow.cterm16],
      \'dark_yellow' : [s:dark_yellow.gui, s:dark_yellow.cterm16],
      \'blue' : [s:blue.gui, s:blue.cterm16],
      \'dark_blue' : [s:dark_blue.gui, s:dark_blue.cterm16],
      \'purple' : [s:purple.gui, s:purple.cterm16],
      \'dark_purple' : [s:dark_purple.gui, s:dark_purple.cterm16],
      \'cyan' : [s:cyan.gui, s:cyan.cterm16],
      \'dark_cyan' : [s:dark_cyan.gui, s:dark_cyan.cterm16],
      \'clouds' : [s:clouds.gui, s:clouds.cterm16],
      \'dark_clouds' : [s:dark_clouds.gui, s:dark_clouds.cterm16],
      \'bg': [s:bg.gui, s:bg.cterm16],
      \'bg_dark': [s:bg_dark.gui, s:bg_dark.cterm16],
      \'bg_bright': [s:bg_bright.gui, s:bg_bright.cterm16],
      \'norm': [s:norm.gui, s:norm.cterm16],
      \'norm_subtle': [s:norm_subtle.gui, s:norm_subtle.cterm16],
      \}

let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

" Tabline
let s:p.tabline.left    = [ [ s:lfc.clouds, s:lfc.bg_dark ], [s:lfc.clouds, s:lfc.eclipse] ]
let s:p.tabline.tabsel  = [ [ s:lfc.bg_dark, s:lfc.red ] ]
let s:p.tabline.middle  = [ [ s:lfc.clouds, s:lfc.bg_dark ] ]
let s:p.tabline.right   = [ [ s:lfc.bg_dark, s:lfc.red ] ]

" Normal mode
let s:p.normal.left     = [ [ s:lfc.bg_dark, s:lfc.cyan ],  [ s:lfc.clouds, s:lfc.eclipse ] ]
let s:p.normal.middle   = [ [ s:lfc.clouds, s:lfc.bg_dark ] ]
let s:p.normal.right    = [ [ s:lfc.bg_dark, s:lfc.cyan ],  [ s:lfc.clouds, s:lfc.eclipse ] ]
let s:p.normal.error    = [ [ s:lfc.red, s:lfc.bg_dark ] ]
let s:p.normal.warning  = [ [ s:lfc.yellow, s:lfc.bg_dark ] ]

" Visual mode
let s:p.visual.left     = [ [ s:lfc.bg_dark, s:lfc.yellow ],  [ s:lfc.bg_dark, s:lfc.dark_yellow ] ]
let s:p.visual.right    = [ [ s:lfc.bg_dark, s:lfc.yellow ],  [ s:lfc.bg_dark, s:lfc.dark_yellow ] ]

" Replace mode
let s:p.replace.left    = [ [ s:lfc.bg_dark, s:lfc.green ],  [ s:lfc.bg_dark, s:lfc.dark_green ] ]
let s:p.replace.right   = [ [ s:lfc.bg_dark, s:lfc.green ],  [ s:lfc.bg_dark, s:lfc.dark_green ] ]

" Insert mode
let s:p.insert.left     = [ [ s:lfc.bg_dark, s:lfc.red ],  [ s:lfc.bg_dark, s:lfc.dark_red ] ]
let s:p.insert.right    = [ [ s:lfc.bg_dark, s:lfc.red ],  [ s:lfc.bg_dark, s:lfc.dark_red ] ]

" Inactive split
let s:p.inactive.left   = [ [ s:lfc.eclipse, s:lfc.bg_dark ], [ s:lfc.eclipse, s:lfc.bg_dark ] ]
let s:p.inactive.middle = [ [ s:lfc.eclipse, s:lfc.bg_dark ] ]
let s:p.inactive.right  = [ [ s:lfc.eclipse, s:lfc.bg_dark ], [ s:lfc.eclipse, s:lfc.bg_dark ] ]

let g:lightline#colorscheme#embark#palette = lightline#colorscheme#flatten(s:p)
