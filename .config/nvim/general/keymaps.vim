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
nnoremap <leader>ee :e %:h/|                                  "  edit a file in same directory in same buffer
nnoremap <leader>es :split %:h/|                              "  splits buffer horizontally
nnoremap <leader>ev :vsplit %:h/|                             "  splits buffer vertically

"~~~~~~~~~~ MOVE LINES ~~~~~~~~~
nnoremap <leader>m+ :m+|
nnoremap <leader>m- :m-|
vnoremap <leader>m+ :m+|
vnoremap <leader>m- :m-|

"~~~~~~~~~~ DUPLICATE LINES ~~~~~~~~~
vnoremap <A-S-Up> :t -1<CR>
vnoremap <A-S-Down> :t.<CR>
nnoremap <A-S-Up> :t -1<CR>
nnoremap <A-S-Down> :t.<CR>

"~~~~~~~~~~ VISUAL LINES ~~~~~~~~~
vnoremap v $h																									" vv selects to eol without newline

"~~~~~~~~~~ YANK LINES ~~~~~~~~~
nnoremap Y y$                                                 "  yank to end of line

"~~~~~~~~~~ TODO LISTS ~~~~~~~~~
if has( "win32" )
	nnoremap <leader>T :vimgrep /TODO/ **/*.*<CR>|								" find all TODOs recursively in current directory
	" :vimgrep TODO **/*.%:e \| cw
	nnoremap<leader>To :copen<CR>|																" open todo list
else
	nnoremap <leader>T :Ag \(FIXME\)\\|\(TODO\)<CR> |								" find all TODOs recursively in current directory
	nnoremap<leader>To :copen<CR>|																" open todo list
endif


" next and previous grep item
nnoremap <leader>Tn :cn<CR>|
nnoremap <leader>Tp :cp<CR>|

"NOTE: quickfix  useful commands
" :.cc to go to file under cursor ( if cursor is in quickfix window )
" :ccl to close it
" :cn next search item
" :cp previous search item
" :copen open quickfix window

" search all occurences of the current word in the current directory and sub-directory
command GREP execute "vimgrep /" . expand("<cword>") . "/j **" | cw
command FIXME execute "vimgrep /" . expand("FIXME") . "/j **" | cw
command TODO execute "vimgrep /" . expand("TODO") . "/j **" | cw

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

" resize window horizontally
nnoremap <c-,> <C-W><
nnoremap <c-.> <C-W>>

" resize window vertically
nnoremap <A-,> <C-W>-
nnoremap <A-.> <C-W>+

"~~~~~~~~~~TAB NAVIGATION ~~~~~~~~~
noremap <leader>td :tabclose<CR>|                             "  close tab
noremap <leader>to :tabnew<CR>|                               "  open new empty tab
noremap <leader>tn :tabn<CR>|                                 "  go to next tab
noremap <leader>tp :tabp<CR>|                                 "  go to prev tab

"~~~~~~~~~~ BUFFER NAVIGATION~~~~~~~~~
noremap <leader>bd :bd<CR>|																		"  delete current buffer
noremap <leader>bD :%bd<bar>e#<CR>|                           "  delete all buffers but current and previous one
noremap <leader>br :e<CR>|                                    "  reload buffer
noremap <leader>bp :bp<CR>|                                   "  previous buffer
noremap <leader>bn :bn<CR>|                                   "  next buffer
noremap <leader>bv :vsp \| b|                                 "  vsplit and open buffer from number
" nnoremap <leader>. :ls <CR>:b|                                "  open buffer list and change buffers
nnoremap <leader>. :b <c-d>|																	" change buffer
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>

"~~~~~~~~~~ TERMINAL NAVIGATION~~~~~~~~~
tnoremap <C-\> <C-\><C-n>

"~~~~~~~~~~ SEARCH & REPLACE ~~~~~~~~
nnoremap <leader>rl :s//g<Left><Left>|                        "  search in line
nnoremap <leader>rw :%s/<c-r><c-w>//g<Left><Left>|            "  search word under cursor in file
nnoremap <leader>rv :%s///c<Left><Left><Left>|                "  search file & confirm
nnoremap <leader>rg :%s///gc<Left><Left><Left><Left>|         "  search entire file & confirm
nnoremap <leader>rc :%s///gcI<Left><Left><Left><Left><Left>|  "  search case sensitive

"~~~~~~~~~~ BACKGROUND TOGGLE ~~~~~~~~~
nnoremap <leader>bg :call ToggleBackground()<cr>

"~~~~~~~~~~ CCOMMAND LINE ~~~~~~~~~
cnoreabbr <expr> %% fnameescape( expand( '%:p' ) )

"~~~~~~~~~~ QUIT VIM ~~~~~~~~~
noremap <leader>qq :conf qa!<CR>|                             "  quit all files
noremap <leader>qn :q!<CR>|                                   "  quit without saving

