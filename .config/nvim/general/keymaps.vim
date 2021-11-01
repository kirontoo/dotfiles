""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"___   _  _______  __   __  __   __  _______  _______  _______
"|   | | ||       ||  | |  ||  |_|  ||   _   ||       ||       |
"|   |_| ||    ___||  |_|  ||       ||  |_|  ||    _  ||  _____|
"|      _||   |___ |       ||       ||       ||   |_| || |_____
"|     |_ |    ___||_     _||       ||       ||    ___||_____  |
"|    _  ||   |___   |   |  | ||_|| ||   _   ||   |     _____| |
"|___| |_||_______|  |___|  |_|   |_||__| |__||___|    |_______|
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"~~~~~~~~~~ FILES ~~~~~~~~
noremap <leader>fev :e  $MYVIMRC<CR>|                         "  edit vimrc
noremap <leader>fer :source $MYVIMRC<CR>|                     "  reload vimrc
noremap <leader>fi gg=G|                                      "  fix file indents
noremap <leader>ft :Retab<CR>|                                "  toggle between tabs and spaces
noremap <leader>fs :w <CR>|                                   "  save file
noremap <leader>fq :q <CR>|                                   "  quit file

"~~~~~~~~~~ EDIT FILE ~~~~~~~~~
nnoremap <leader>ee :e %:h/|                                  "  edit a file in same directory in same buffer
nnoremap <leader>es :split %:h/|                              "  splits buffer horizontally
nnoremap <leader>ev :vsplit %:h/|                             "  splits buffer vertically

"~~~~~~~~~~ MOVE LINES ~~~~~~~~~
nnoremap <leader>m+ :m+|
nnoremap <leader>m- :m-|
vnoremap <leader>m+ :m+|
vnoremap <leader>m- :m-|

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"~~~~~~~~~~ DUPLICATE LINES ~~~~~~~~~
vnoremap <A-S-Up> :t -1<CR>
vnoremap <A-S-Down> :t.<CR>
nnoremap <A-S-Up> :t -1<CR>
nnoremap <A-S-Down> :t.<CR>

"~~~~~~~~~~ JUMPLIST ~~~~~~~~~
nnoremap <expr> k      ( v:count > 5 ? "m'" . v:count : "" ) . 'k'
nnoremap <expr> j      ( v:count > 5 ? "m'" . v:count : "" ) . 'j'
nnoremap <expr> <Up>   ( v:count > 5 ? "m'" . v:count : "" ) . 'k'
nnoremap <expr> <Down> ( v:count > 5 ? "m'" . v:count : "" ) . 'j'

"~~~~~~~~~~ INCREACE & DECREASE ~~~~~~~~~
nmap <silent>+ <C-a>
nmap <silent>- <C-x>
vmap <silent>+ <C-a>
vmap <silent>- <C-x>

"~~~~~~~~~~ UNDO BREAKPOINTS ~~~~~~~~~
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

"~~~~~~~~~~ VISUAL LINES ~~~~~~~~~
vnoremap v $h                                                 " vv selects to eol without newline

"~~~~~~~~~~ YANK LINES ~~~~~~~~~
nnoremap Y y$                                                 "  yank to end of line

"~~~~~~~~~~GIT DIFF ~~~~~~~~~
nnoremap <leader>gt :diffget //2<CR>|                         " keep changes from left file
nnoremap <leader>gn :diffget //3<CR>|                         " keep changes from right file

"~~~~~~~~~~WINDOW NAVIGATION ~~~~~~~~~

nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l

" nnoremap <leader>h <C-w>h
" nnoremap <leader>j <C-w>j
" nnoremap <leader>k <C-w>k
" nnoremap <leader>l <C-w>l

noremap <leader>wv :vsplit<CR>|                               "  split window vertically
noremap <leader>ws :split<CR>|                                "  split window vertically
noremap <leader>wvr :vert sview <C-Z><CR>|                    "  split vertically in read only mode
noremap <leader>wd :close<CR>|                                "  close a window
noremap <leader>wo :only<CR>|                                 "  keep only current window open
noremap <leader>wh :hide<CR>|                                 "  hide the current window

noremap <leader>wq <C-w>t
noremap <leader>w; <C-w>b

noremap <leader>whh <C-w>h:hide<CR>|                          " hide the left window
noremap <leader>whj <C-w>j:hide<CR>|                          " hide the bottom window
noremap <leader>whk <C-w>k:hide<CR>|                          " hide the top window
noremap <leader>whl <C-w>l:hide<CR>|                          " hide the right window

noremap <leader>wr :vs<bar>:b#<CR>|                           " restore previous closed buffer in new window

" resize window horizontally
nnoremap <C-,> <C-W><
nnoremap <C-.> <C-W>>

" resize window vertically
nnoremap <A-,> <C-W>-
nnoremap <A-.> <C-W>+

"~~~~~~~~~~TAB NAVIGATION ~~~~~~~~~
noremap <leader>tx :tabclose<CR>|                             "  close tab
noremap <leader>tn :tabnew<CR>|                               "  open new empty tab

"~~~~~~~~~~ BUFFER NAVIGATION~~~~~~~~~
" nnoremap <leader>. :ls <CR>:b|                                "  open buffer list and change buffers
" noremap <S-Tab> :bp<CR>
" noremap <Tab> :bn<CR>
" noremap <leader>bD :%bd<bar>e#<CR>|                           "  delete all buffers but current and previous one
noremap <leader>bd :bd<CR>|                                   "  delete current buffer
" noremap <leader>bn :bn<CR>|                                   "  next buffer
" noremap <leader>bp :bp<CR>|                                   "  previous buffer
nnoremap <leader>. :b <c-d>|                                  " change buffer
noremap <leader>br :e<CR>|                                    "  reload buffer
noremap <leader>bv :vsp \| b <c-d>|                           "  vsplit and open buffer from number

"~~~~~~~~~~ TERMINAL NAVIGATION~~~~~~~~~
tnoremap <C-\> <C-\><C-n>

"~~~~~~~~~~ SEARCH & REPLACE ~~~~~~~~
nnoremap <leader>rl :s//g<Left><Left>|                        "  search in line
nnoremap <leader>rw :s/<c-r><c-w>//g<Left><Left>|             "  search/replace word under cursor in line
nnoremap <leader>rW :%s/<c-r><c-w>//g<Left><Left>|            "  search/replace word under cursor in file
nnoremap <leader>rv :%s///c<Left><Left><Left>|                "  search file & confirm
nnoremap <leader>rg :%s///gc<Left><Left><Left><Left>|         "  search entire file & confirm
nnoremap <leader>rc :%s///gcI<Left><Left><Left><Left><Left>|  "  search case sensitive

"~~~~~~~~~~ BACKGROUND TOGGLE ~~~~~~~~~
nnoremap <leader>bg :call ToggleBackground()<cr>

"~~~~~~~~~~ CCOMMAND LINE ~~~~~~~~~
cnoreabbr <expr> %% fnameescape( expand( '%:p' ) )

"~~~~~~~~~~ VIM HELP ~~~~~~~~~
nnoremap <leader>?v :vert h<space>
nnoremap <leader>?c :helpclose<CR>

"~~~~~~~~~~ QUIT VIM ~~~~~~~~~
noremap <leader>qq :conf qa!<CR>|                             "  quit all files
noremap <leader>qn :q!<CR>|                                   "  quit without saving

