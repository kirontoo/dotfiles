"           __        ___.   .__  .__
" ___  ____/  |______ \_ |__ |  | |__| ____   ____
" \  \/  /\   __\__  \ | __ \|  | |  |/    \_/ __ \
"  >    <  |  |  / __ \| \_\ \  |_|  |   |  \  ___/
" /__/\_ \ |__| (____  /___  /____/__|___|  /\___  >
"       \/           \/    \/             \/     \/

let g:xtabline_settings = {}

let g:xtabline_settings.enable_mappings = 0

let g:xtabline_settings.tabline_modes = ['buffers', 'tabs']

let g:xtabline_settings.enable_persistance = 0

" let g:xtabline_settings.last_open_first = 1
let g:xtabline_lazy = 1

let g:xtabline_settings.show_right_corner = 1
let g:xtabline_settings.tab_number_in_left_corner = 1

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

let g:xtabline_settings.indicators = {
      \ 'modified': '+',
      \ 'pinned': '[📌]',
      \}
      " \ 'modified': '●',

let g:xtabline_settings.icons = {
      \'pin': '📌',
      \'star': '*',
      \'book': '📖',
      \'lock': '🔒',
      \'hammer': '🔨',
      \'tick': '✔',
      \'cross': '✖',
      \'warning': '⚠',
      \'menu': '☰',
      \'apple': '🍎',
      \'linux': '🐧',
      \'windows': '⌘',
      \'git': '',
      \'palette': '🎨',
      \'lens': '🔍',
      \'flag': '🏁',
      \}
