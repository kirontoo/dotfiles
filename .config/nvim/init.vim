 " __   .__                      __
" |  | _|__|______  ____   _____/  |_  ____   ____
" |  |/ /  \_  __ \/  _ \ /    \   __\/  _ \ /  _ \
" |    <|  ||  | \(  <_> )   |  \  | (  <_> |  <_> )
" |__|_ \__||__|   \____/|___|  /__|  \____/ \____/
     " \/                     \/

" Leader key
let mapleader = "\<Space>"

" Autoinstall package manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin Calls
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'

call plug#end()

" COC extensions
let g:coc_global_extensions=[ 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-tslint', 'coc-html', 'coc-css', 'coc-angular' ]

filetype plugin indent on

" Basic configurations
  set nocompatible          "  prevent remapping to make plugins compatible
  syntax on                 "  Turn on syntax highlighting
  set ttyfast               "  Speed up scrolling in Vim
  set path+=**              "  Search down into subfolders & provide tab-completion
  set wildmenu              "  Display all matching files when tab-complete
  set wildignore+=**/node_modules/**      "ignore folders to search
  set updatetime=100        "  lower updatetime to 100ms from 4000
  
  set signcolumn=yes        "  Enable sign column

	"~Tab indent
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
	set expandtab             "  convert tab to spaces
	set smarttab
  set shiftround            "  use multiple of shiftwidth when indenting with '<' and '>'

  set splitbelow splitright "  Splits window below and right
	set mouse=a               "  Enable mouse usage
  set hidden                "  hide buffers
  set autoindent            "  always set autoindenting on
  set number relativenumber "  Line Numbers

  "~Line Wrap
  set tw=80
  set wrap linebreak nolist
  set textwidth=0
  set wrapmargin=0

  set cursorline            "  Show line highlight
  set wildmode=list:longest "  Auto complete

  set showcmd               "  show command
  set incsearch             "  highlight search terms
  set incsearch             "  show search matches as you type
  set ignorecase            "  Ignore case

  " Disable automatic comment on newline
  set formatoptions-=cro 

  " Mode Cursor Settings
  set guicursor=n-v-c:block-Cursor/iCursor
  set guicursor+=i:hor20-Cursor/iCursor
  set guicursor+=r:hor20-Cursor/rCursor-blinkwait300-blinkoff200-blinkon150

  "~set command timeout
  set timeoutlen=2000

  "~source file for tags
  set tags+=tags

  "~~~~~~~ AUTOMACTIC SETTINGS ~~~~~~~~
  " autocmd BufEnter * silent! lcd %:p:h                                                                      " change dir on buffer switch
  autocmd CursorMoved * if (expand('<cword>') =~ @/) | set hlsearch | else | set nohlsearch | endif         " unhighligt for search
  autocmd bufenter * if (winnr("$") == 1 && exists( " b:NERDTree " ) && b:NERDTree.isTabTree()) | q | endif " Exit Nerd Tree on exit vim

  set list                                        " show trailing whitespaces
  set listchars=tab:>.,trail:.,extends:#,nbsp:.
  autocmd filetype html,xml set listchars-=tab:>. " disable trailing whitspace for html/xml

" Airline (Powerline) Themes and Config
	let g:airline_theme='fruit_punch'
	let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	" let g:airline#extensions#tabline#left_alt_sep = '|'

" Vim-Swoop Config
  let g:defaultWinSwoopHeight = 15

" NERD Commenter Config
  let g:NERDSpaceDelims = 1
  " Enable NERDCommenterToggle to check all selected lines is commented or not
  let g:NERDToggleCheckAllLines = 1
  let g:NERDCreateDefaultMappings = 0

" NERD Tree Config
  let g:NERDTreeShowHidden = 1

" Syntax Color Scheme / Theme
	colorscheme deep-space
  hi! Normal ctermbg=NONE guibg=NONE

" For terminal true colo not working atm
  if (has("termguicolors"))
   set termguicolors
  endif

" Configure Goy
" NOTE: keymaps for Goyo is default
  let g:goyo_width=120     " width
  let g:goyo_linenr=1

" CTRLP Configuration
  let g:ctrlp_working_path_mode = 'ra'

" GitGutter Config
  let g:gitgutoter_max_signs=200           "  change max signs shown

" EasyMotion Config
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1


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
  noremap <leader>fev :e  ~/.config/nvim/init.vim<CR>|         "  edit vimrc
  noremap <leader>fer :source ~/.config/nvim/init.vim<CR>|     "  reload vimrc

  "~~~~~~~~~~ NERD TREE PLUGIN~~~~~~~~~
  noremap <leader>ft :NERDTreeToggle ~/<CR>
  noremap <leader>tf :NERDTreeFocus<CR>
  noremap <leader>pt :NERDTreeVCS<CR>
  noremap <leader>tc :NERDTreeClose<CR>

  "~~~~~~~~~~ FZF PLUGIN  ~~~~~~~~~
  noremap <leader>fp :GFiles <CR>|                             "  Search file in current git Directory
  noremap <leader>fd :Files ./<CR>|                            "  Search file in current Directory
  noremap <leader>ff :Files ~<CR>|                             "  Search file in Home Directory
  noremap <leader>fh :History <CR>|                            "  command history
  noremap <leader>Ts :Colors<CR>|

  noremap <leader>fs :w <CR>|                                  "  save file
  noremap <leader>fq :q <CR>|                                  "  quit file

  "~~~~~~~~~~ INCSEARCH-EASYMOTION PLUGIN  ~~~~~~~~~
  map z/ <Plug>(incsearch-easymotion-/)
  map z? <Plug>(incsearch-easymotion-?)
  map zg <Plug>(incsearch-easymotion-stay)

  "~~~~~~~~~~ EASYMOTION PLUGIN  ~~~~~~~~~
  map <leader><leader>w <Plug>(easymotion-overwin-w)
  map <leader><leader>e <Plug>(easymotion-bd-e)
  map <leader><leader>t <Plug>(easymotion-bd-t)
  map <leader><leader>s <Plug>(easymotion-overwin-f)

  "~~~~~~~~~~ MOVE LINES ~~~~~~~~~
  vnoremap <A-Up> :m -2<CR>
  vnoremap <A-Down> :m +1<CR>
  nnoremap <A-Up> :m -2<CR>
  nnoremap <A-Down> :m +1<CR>

  vnoremap <A-k> :m -2<CR>
  vnoremap <A-j> :m +1<CR>
  nnoremap <A-k> :m -2<CR>
  nnoremap <A-j> :m +1<CR>

  "~~~~~~~~~~ DUPLICATE LINES ~~~~~~~~~
  vnoremap <A-S-Up> :t -1<CR>
  vnoremap <A-S-Down> :t.<CR>
  nnoremap <A-S-Up> :t -1<CR>
  nnoremap <A-S-Down> :t.<CR>

  "~~~~~~~~~~WINDOW NAVIGATION ~~~~~~~~~
  nnoremap <C-Left>  <C-w>h
  nnoremap <C-Down>  <C-w>j
  nnoremap <C-Up>    <C-w>k
  nnoremap <C-Right> <C-w>l

  noremap <leader>w/ :vsplit<CR>|                              "  split window vertically
  noremap <leader>w/r :vert sview <C-Z><CR>|                   "  split vertically in read only mode
  noremap <leader>wd :hide<CR>|                                "  delete window
  noremap <leader>wo :only<CR>|                                "  keep only current window open

  "~~~~~~~~~~TAB NAVIGATION ~~~~~~~~~
  noremap <C-W> :tabclose<CR>|                                 "  close tab
  noremap <C-T> :tabnew<CR>|                                   "  open new empty tab
  noremap <leader>tn :tabn<CR>|                                "  go to next tab
  noremap <leader>tp :tabp<CR>|                                "  go to prev tab

  "~~~~~~~~~~ BUFFER NAVIGATION~~~~~~~~~
  noremap <leader><Tab> :bp<Cr>                                "  switch previous buffer
  noremap <leader>bb :Buffers<CR>|                             "  open buffer menu

  set wildchar=<Tab> wildmenu wildmode=full
  set wildcharm=<C-Z>
  nnoremap <leader>bd :bd<Cr>|                                 "  delete buffer

  "~~~~~~~~~~ SEARCH ~~~~~~~~
  nmap <leader>ss :BLines<CR>|                                 "  swoop current buffer
  nmap <leader>sg :Lines<CR>|                                  "  swoop all open buffer

"~~~~~~~~~~ FUGITIVE PLUGIN~~~~~~~~
  nnoremap <leader>gs :Gstatus<CR>|                            "  git status
  nnoremap <leader>gc :Gcommit<CR>|                            "  git commit
  nnoremap <leader>gd :Gdiff<CR>|                              "  git diff
  nnoremap <leader>gf :Gpull<CR>|                              "  git pull
  nnoremap <leader>gp :Gpush<CR>|                              "  git push
  nnoremap <leader>gm :Gmerge<CR>|                             "  git merge

"~~~~~~~~~~ COC PLUGIN~~~~~~~~
  inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  "Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)                      " go to definition
  nmap <silent> gy <Plug>(coc-type-definition)                 " go to type definition
  nmap <silent> gi <Plug>(coc-implementation)                  " go to implementation
  nmap <silent> gr <Plug>(coc-references)                      " go to reference

  " show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  nmap <leader>rn <Plug>(coc-rename)                           " Remap for rename current word
  autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight on symbol under cursor

  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>    " Show all diagnostics
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>     " Manage extensions
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>       " Show commands
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr         " Find symbol of current document
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr      " Search workspace symbols
  nnoremap <silent> <space>j  :<C-u>CocNext<CR                 " Do default action for next item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR                 " Do default action for previous item.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR           " Resume latest coc list


"~~~~~~~~~~ NERDCOMMENTER PLUGIN~~~~~~~~
  nmap <leader>/ <plug>NERDCommenterToggle
  vmap <leader>/ <plug>NERDCommenterToggle gv

"~~~~~~~~~~ TAGBAR PLUGIN~~~~~~~~
  nnoremap <silent> <leader>tt :TagbarToggle<CR>|              "  toggle tag bar
  nnoremap <leader>tb :BTags<CR>|                              "  search tags in current buffer

"~~~~~~~~~~ SEARCH & REPLACE ~~~~~~~~
  nnoremap <leader>rl :s//<Left>|                              "  search line
  nnoremap <leader>rv :%s///c<Left><Left><Left>|               "  search file & confirm
  nnoremap <leader>rg :%s///gc<Left><Left><Left><Left>|        "  search entire file & confirm
  nnoremap <leader>rc :%s///gcI<Left><Left><Left><Left><Left>| "  search case sensitive

"~~~~~~~~~~ INSERT MODE ~~~~~~~~~
  "pairing braces
  inoremap <> <><Left>
  inoremap () ()<Left>
  inoremap {} {}<Left>
  inoremap "" ""<Left>
  inoremap '' ''<Left>
  inoremap `` ``<Left>'

"~~~~~~~~~~ SURROUND TEXT ~~~~~~~~~
  nnoremap <leader>s' ciw''<ESC>P|                             "  surround word with ''
  nnoremap <leader>s" ciw""<ESC>P|                             "  surround word with ""
  nnoremap <leader>s( ciw()<ESC>P|                             "  surround word with ()
  nnoremap <leader>s{ ciw{}<ESC>P|                             "  surround word with {}
  nnoremap <leader>s[ ciw[]<ESC>P|                             "  surround word with []

"~~~~~~~~~~ PLUGIN INSTALL ~~~~~~~~~
  nnoremap <leader>pi :PlugInstall<CR>
  nnoremap <leader>pc :PlugClean<CR>
  nnoremap <leader>pu :PlugUpdate<CR>
  nnoremap <leader>pg :PlugUpgrade<CR>

"~~~~~~~~~~ QUIT VIM ~~~~~~~~~
  noremap <leader>qq :conf qa!<CR>|                            "  quit all files
  noremap <leader>qn :q!<CR>|                                  "  quit without saving

"~~~~~~~~~~ MAPPING HELP ~~~~~~~~~
  nnoremap <leader>? :Commands<CR>
  nnoremap <leader>?m :Maps<CR>
