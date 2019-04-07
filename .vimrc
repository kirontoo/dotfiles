 " __   .__                      __
" |  | _|__|______  ____   _____/  |_  ____   ____
" |  |/ /  \_  __ \/  _ \ /    \   __\/  _ \ /  _ \
" |    <|  ||  | \(  <_> )   |  \  | (  <_> |  <_> )
" |__|_ \__||__|   \____/|___|  /__|  \____/ \____/
     " \/                     \/

" Leader key
let mapleader = "\<Space>"

" " Autoinstall package manager
" if empty(glob('~/.vim/autoload/plug.vim'))
  " silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" Plugin Calls
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'pelodelfuego/vim-swoop'
Plug 'majutsushi/tagbar'

call plug#end()

" Pathogen plugin for powerline
execute pathogen#infect()
filetype plugin indent on

" Basic configurations
  set nocompatible " prevent remapping to make plugins compatible
  syntax on        " Turn on syntax highlighting
  set ttyfast      " Speed up scrolling in Vim
	
	" Tab indent
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
	set expandtab  " convert tab to spaces
	set smarttab
  set shiftround " use multiple of shiftwidth when indenting with '<' and '>'

  " Searching
	set hlsearch              " Highlight matching search patterns
	set incsearch             " Enable incremental search

  set splitbelow splitright " Splits window below and right
	set mouse=a               " Enable mouse usage
  set hidden                " hide buffers
  set autoindent            " always set autoindenting on
  set number relativenumber " Line Numbers

  " Line Wrap
  set tw=80
  set wrap linebreak nolist
  set textwidth=0
  set wrapmargin=0

  set cursorline            " Show line highlight
  set wildmode=list:longest " Auto complete

  set showcmd       " show command
  set hlsearch      " highlight search terms
  set incsearch     " show search matches as you type

  "set command timeout
  set timeoutlen=2000

  " source file for tags
  set tags+=tags

  "~~~~~~~ AUTOMACTIC SETTINGS ~~~~~~~~
  autocmd BufEnter * silent! lcd %:p:h:pwd                                                          " change dir on buffer switch
  autocmd CursorMoved * if (expand('<cword>') =~ @/) | set hlsearch | else | set nohlsearch | endif " unhighligt for search
  autocmd bufenter * if (winnr("$") == 1 && exists( " b:NERDTree " ) && b:NERDTree.isTabTree()) | q | endif " Exit Nerd Tree on exit vim

  set list                                        " show trailing whitespaces
  set listchars=tab:>.,trail:.,extends:#,nbsp:.
  autocmd filetype html,xml set listchars-=tab:>. " disable trailing whitspace for html/xml

" Airline (Powerline) Themes and Config
	let g:airline_theme='deus'
	let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'

" Vim-Swoop Config
  let g:defaultWinSwoopHeight = 15

" NERD Commenter Config
  let g:NERDSpaceDelims = 1
  " Enable NERDCommenterToggle to check all selected lines is commented or not
  let g:NERDToggleCheckAllLines = 1
  let g:NERDCreateDefaultMappings = 0

" Syntax Color Scheme
	colorscheme onedark

" For terminal true colo not working atm
  if (has("termguicolors"))
   set termguicolors
  endif

" Configure Goyo
" NOTE: keymaps for Goyo is default
  let g:goyo_width=120     " width

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"~~~~~~~~~~ FILES AND NAVIGATION ~~~~~~~~
  "~~~~~~~~~~ .VIMRC ~~~~~~~~
  " Quickly edit/reload the vimrc file
  noremap <leader>fev :e  ~/.vimrc<CR>|     " edit vimrc
  noremap <leader>fer :source ~/.vimrc<CR>| " reload vimrc

  "~~~~~~~~~~ NERD TREE ~~~~~~~~~
  noremap <leader>ft :NERDTreeToggle<CR>

  "~~~~~~~~~~ FZF PLUGIN  ~~~~~~~~~
  noremap <leader>fp :FZF <CR>|     " Search file in current Directory
  noremap <leader>ff :FZF ~<CR>|    " Search file in Home Directory
  noremap <leader>fh :History <CR>| " command history

  noremap <leader>fs :w <CR>|       " save file
  "~~~~~~~~~~WINDOW NAVIGATION ~~~~~~~~~
  nnoremap <C-Left>  <C-w>h
  nnoremap <C-Down>  <C-w>j
  nnoremap <C-Up>    <C-w>k
  nnoremap <C-Right> <C-w>l

  noremap <leader>w/ :vsplit<CR>|            " split window vertically
  noremap <leader>w/r :vert sview <C-Z><CR>| " split vertically in read only mode
  noremap <leader>wd :hide<CR>|              " delete window
  noremap <leader>wo :only<CR>|              " keep only current window open

  "~~~~~~~~~~TAB NAVIGATION ~~~~~~~~~
  noremap <C-W> :tabclose<CR>| " close tab
  noremap <C-T> :tabnew<CR>|   " open new empty tab
  noremap <C-Tab> :tabn<CR>|   " go to next tab
  noremap <C-S-Tab> :tabp<CR>| " go to prev tab

  "~~~~~~~~~~ BUFFER NAVIGATION~~~~~~~~~
  noremap <leader><Tab> :bp<Cr>                  " switch previous buffer
  noremap <leader>bb :buffers<CR>:buffer<Space>| " open buffer menu

  set wildchar=<Tab> wildmenu wildmode=full
  set wildcharm=<C-Z>
  nnoremap <leader>bf :b <C-Z>|                  " find buffer
  nnoremap <leader>bd :bd<Cr>|                   " delete buffer

"~~~~~~~~~~ SEARCH & SWOOP PLUGIN~~~~~~~~
  nmap <silent> ,/ :nohlsearch<CR>|           " search with no highlight
  nmap <leader>ss :call Swoop()<CR>|          " swoop current buffer
  nmap <leader>sb :call SwwopSelection()<CR>| " swoop all open buffers

"~~~~~~~~~~ FUGITIVE PLUGIN~~~~~~~~
  nnoremap <leader>gs :Gstatus<CR>| " git status
  nnoremap <leader>gc :Gcommit<CR>| " git commit
  nnoremap <leader>gd :Gdiff<CR>|   " git diff
  nnoremap <leader>gf :Gpull<CR>|   " git pull
  nnoremap <leader>gp :Gpush<CR>|   " git push
  nnoremap <leader>gm :Gmerge<CR>|  " git merge
  nnoremap <leader>gg :Git 

"~~~~~~~~~~ NERDCOMMENTER PLUGIN~~~~~~~~
  nmap <leader>; <plug>NERDCommenterToggle
  vmap <leader>; <plug>NERDCommenterToggle gv

"~~~~~~~~~~ TAGBAR PLUGIN~~~~~~~~
  nnoremap <silent> <leader>tt :TagbarToggle<CR>

"~~~~~~~~~~ INSERT MODE ~~~~~~~~~
  "pairing braces
  inoremap <> <><Left>
  inoremap () ()<Left>
  inoremap {} {}<Left>
  inoremap "" ""<Left>
  inoremap '' ''<Left>
  inoremap `` ``<Left>

"~~~~~~~~~~ QUIT VIM ~~~~~~~~~
  noremap <leader>qq :qa<CR>|   " quit all files

"~~~~~~~~~~ MAPPING HELP ~~~~~~~~~
  nnoremap <leader>g? :map <leader>g <CR>
  nnoremap <leader>s? :map <leader>s <CR>
  nnoremap <leader>b? :map <leader>b <CR>
  nnoremap <leader>w? :map <leader>w <CR>
  nnoremap <leader>f? :map <leader>f <CR>
  nnoremap <leader>c? :map <leader>c <CR>


