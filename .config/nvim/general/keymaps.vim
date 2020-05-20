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
noremap <leader>feg :e  $MYVIMRC<CR>|                         "  edit fvim gui vimrc
noremap <leader>fer :source $MYVIMRC<CR>|                     "  reload vimrc
noremap <leader>fi gg=G|                                      "  fix file indents
noremap <leader>fs :w <CR>|                                   "  save file
noremap <leader>fq :q <CR>|                                   "  quit file

"~~~~~~~~~~ EDIT FILE ~~~~~~~~~
nnoremap <leader>de :e %:h/|                                  "  edit a file in same directory in same buffer
nnoremap <leader>ds :split %:h/|                              "  splits buffer horizontally
nnoremap <leader>dv :vsplit %:h/|                             "  splits buffer vertically

"~~~~~~~~~~ MOVE LINES ~~~~~~~~~
vnoremap <A-Up> :m -2<CR>
vnoremap <A-Down> :m +1<CR>
nnoremap <A-Up> :m -2<CR>
nnoremap <A-Down> :m +1<CR>

vnoremap <A-k> :m -2<CR>
vnoremap <A-j> :m +1<CR>
nnoremap <A-k> :m -2<CR>
nnoremap <A-j> :m +1<CR>

nmap <S-CR> O<Esc>|                                           "  add newline down without insert mode
nmap <CR> o<Esc>|                                             "  add newline above without insert mode

"~~~~~~~~~~ DUPLICATE LINES ~~~~~~~~~
vnoremap <A-S-Up> :t -1<CR>
vnoremap <A-S-Down> :t.<CR>
nnoremap <A-S-Up> :t -1<CR>
nnoremap <A-S-Down> :t.<CR>

"~~~~~~~~~~ YANK LINES ~~~~~~~~~
nnoremap Y y$                                                 "  yank to end of line

"~~~~~~~~~~WINDOW NAVIGATION ~~~~~~~~~

nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

noremap <leader>wv :vsplit<CR>|                               "  split window vertically
noremap <leader>ws :split<CR>|                                "  split window vertically
noremap <leader>wvr :vert sview <C-Z><CR>|                    "  split vertically in read only mode
noremap <leader>wd :close<CR>|                                "  close a window
noremap <leader>wo :only<CR>|                                 "  keep only current window open

noremap <leader>wr :vs<bar>:b#<CR>                            " restore previous closed buffer in new window

"~~~~~~~~~~TAB NAVIGATION ~~~~~~~~~
noremap <leader>td :tabclose<CR>|                             "  close tab
noremap <leader>to :tabnew<CR>|                               "  open new empty tab
noremap <leader>tn :tabn<CR>|                                 "  go to next tab
noremap <leader>tp :tabp<CR>|                                 "  go to prev tab

"~~~~~~~~~~ BUFFER NAVIGATION~~~~~~~~~
noremap <leader>bd :bd<CR>|                                   "  delete buffer
noremap <leader>br :e<CR>|                                    "  reload buffer
noremap <leader>bp :bp<CR>|                                   "  previous buffer
noremap <leader>bn :bn<CR>|                                   "  next buffer
noremap <leader>bv :vsp \| b|                                 "  vsplit and open buffer from number
nnoremap <leader>. :ls <CR>:b|                                "  open buffer list and change buffersopen buffer list and change buffers

"~~~~~~~~~~ TERMINAL NAVIGATION~~~~~~~~~
tnoremap <C-\> <C-\><C-n>

"~~~~~~~~~~ SEARCH & REPLACE ~~~~~~~~
nnoremap <leader>rl :s//<Left>|                               "  search line
nnoremap <leader>rv :%s///c<Left><Left><Left>|                "  search file & confirm
nnoremap <leader>rg :%s///gc<Left><Left><Left><Left>|         "  search entire file & confirm
nnoremap <leader>rc :%s///gcI<Left><Left><Left><Left><Left>|  "  search case sensitive

"~~~~~~~~~~ SURROUND TEXT ~~~~~~~~~
nnoremap <leader>s' ciw''<ESC>P|                              "  surround word with ''
nnoremap <leader>s" ciw""<ESC>P|                              "  surround word with ""
nnoremap <leader>s( ciw()<ESC>P|                              "  surround word with ()
nnoremap <leader>s{ ciw{}<ESC>P|                              "  surround word with {}
nnoremap <leader>s[ ciw[]<ESC>P|                              "  surround word with []

"~~~~~~~~~~ BACKGROUND TOGGLE ~~~~~~~~~
nnoremap <leader>bg :call ToggleBackground()<cr>

"~~~~~~~~~~ QUIT VIM ~~~~~~~~~
noremap <leader>qq :conf qa!<CR>|                             "  quit all files
noremap <leader>qn :q!<CR>|                                   "  quit without saving

