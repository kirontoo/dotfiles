 " __   .__                      __
" |  | _|__|______  ____   _____/  |_  ____   ____
" |  |/ /  \_  __ \/  _ \ /    \   __\/  _ \ /  _ \
" |    <|  ||  | \(  <_> )   |  \  | (  <_> |  <_> )
" |__|_ \__||__|   \____/|___|  /__|  \____/ \____/
     " \/                     \/


" Leader key
let mapleader = "\<Space>"

" Autoinstall package manager
" Plugin Calls
if has("win32") || has("win16")
	if empty(glob('C:\Users\amynd\AppData\Local\nvim\autoload\plug.vim'))
		silent !curl -fLo 'C:\Users\amynd\AppData\Local\nvim\autoload\plug.vim' --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
	call plug#begin('C:\Users\amynd\AppData\Local\nvim\autoload\plugged')
endif

if !has("win32")
	if empty(glob('~/.local/share/nvim/plugged'))
		silent !curl -fLo 'C:\Users\amynd\AppData\Local\nvim\autoload\plug.vim' --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

	call plug#begin('~/.local/share/nvim/plugged')
endif

" Plugin: Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'
Plug 'aswathkk/DarkScene.vim'

" Plugin: Packages
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentLine'

call plug#end()

" COC extensions
let g:coc_global_extensions=[ 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-tslint', 'coc-html', 'coc-css', 'coc-omnisharp' ]

filetype plugin indent on

" Basic configurations
  set nocompatible                 " prevent remapping to make plugins compatible
  syntax on                        " Turn on syntax highlighting
  set ttyfast                      " Speed up scrolling in Vim
  set path+=**                     " Search down into subfolders & provide tab-completion
  set wildmenu                     " Display all matching files when tab-complete
  set wildignore+=*/node_modules/* " ignore folders to search
  set updatetime=100               " lower updatetime to 100ms from 4000

  set signcolumn=yes               " Enable sign column

	" ~Tab indent
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
  set shiftround                   " use multiple of shiftwidth when indenting with '<' and '>'

  set splitbelow splitright        " Splits window below and right
	set mouse=a                      " Enable mouse usage
  set hidden                       " hide buffers
  set autoindent                   " always set autoindenting on
  set number relativenumber        " Line Numbers

	" ~Line Wrap
  set tw=80
  set nowrap linebreak
  set textwidth=0
  set wrapmargin=0

  set cursorline                   " Show line highlight
  set wildmode=list:longest        " Auto complete

  set showcmd                      " show command
  set hlsearch                     " highlight search terms
  set incsearch                    " show search matches as you type
  set ignorecase                   " Ignore case

	" WINDOWS CLIPBOARD
	set clipboard+=unnamed

  " Disable automatic comment on newline
  set formatoptions-=cro 

  " Mode Cursor Settings
	highlight Cursor guifg=white guibg=black
	highlight iCursor guifg=white guibg=steelblue
  set guicursor=n-v-c:block-Cursor/iCursor
	set guicursor+=i:hor20-Cursor/iCursor
  set guicursor+=r:hor20-Cursor/rCursor-blinkwait300-blinkoff200-blinkon150

  "~set command timeout
  set timeoutlen=2000

  "~source file for tags
  set tags+=tags

  "~~~~~~~ AUTOMACTIC SETTINGS ~~~~~~~~
	set autochdir
  autocmd CursorMoved * if (expand('<cword>') =~ @/) | set hlsearch | else | set nohlsearch | endif         " unhighligt for search
  autocmd bufenter * if (winnr("$") == 1 && exists( " b:NERDTree " ) && b:NERDTree.isTabTree()) | q | endif " Exit Nerd Tree on exit vim

  set list                                        " show trailing whitespaces
	set showbreak=↪\ 
	" set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:↲
	set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:§
	autocmd filetype html,xml set listchars-=tab:>. " disable trailing whitspace for html/xml

" Airline (Powerline) Themes and Config
	let g:airline_theme='base16'
	let g:airline_powerline_fonts=1
  let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#formatter='short_path'
	let g:airline#extensions#tabline#buffer_nr_show=1 " buffer number
	let g:airline#extensions#tabline#buffer_nr_format='%s: ' " buffer number
	let g:airline_left_sep = ''
	let g:airline_right_sep = ''

" Font
	set guifont=space\ mono:h16
" set guifont=envy\ code\ r:h12
" set guifont=terminessttf\ nf:h12

" Vim-Swoop Config
  let g:defaultWinSwoopHeight=15

" NERD Tree Config
  let g:NERDTreeShowHidden=1

" Syntax Color Scheme / Theme
	colorscheme DarkScene
  hi! Normal ctermbg=NONE guibg=NONE

" For terminal true colo not working atm
  if (has("termguicolors"))
   set termguicolors
  endif

" Configure Goy
  let g:goyo_width=120     " width
  let g:goyo_linenr=1

" CTRLP Configuration
  let g:ctrlp_working_path_mode = 'ra'

" Git Gutter Config
  let g:gitgutoter_max_signs=200           "  change max signs shown
	let g:gitgutter_enabled=1
	" for windows only
	if has("win32") || has("win16")
		let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
	endif

" EasyMotion Config
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1

" FZF Config
	let g:fzf_colors =
	\ { 'fg':      ['fg', 'Normal'],
		\ 'bg':      ['bg', 'Normal'],
		\ 'hl':      ['fg', 'Comment'],
		\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
		\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
		\ 'hl+':     ['fg', 'Statement'],
		\ 'info':    ['fg', 'PreProc'],
		\ 'border':  ['fg', 'Ignore'],
		\ 'prompt':  ['fg', 'Conditional'],
		\ 'pointer': ['fg', 'Exception'],
		\ 'marker':  ['fg', 'Keyword'],
		\ 'spinner': ['fg', 'Label'],
		\ 'header':  ['fg', 'Comment'] }

" Indent Line Config
	let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Hardtime Config
	let g:hardtime_default_on=1
	let g:hardtime_showmsg=1

" Startify Config
	let g:startify_session_peristence=1
	let g:startify_session_number=5
	let g:startify_change_to_vcs_root=1
	let g:startify_files_number=8
	let g:startify_custom_header =
						\ 'startify#center(startify#fortune#cowsay())'
	let g:startify_custom_footer =
           \ ['', "   Vim is charityware. Please read ':help uganda'.", '']
	let g:startify_lists = [
						\ { 'type': 'sessions',  'header': ['   Sessions']       },
						\ { 'type': 'files',     'header': ['   MRU']            },
						\ { 'type': 'commands',  'header': ['   Commands']       },
						\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
						\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
						\ ]

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
  noremap <leader>fev :e  C:\Users\amynd\AppData\Local\nvim\init.vim<CR>|         "  edit vimrc
  noremap <leader>feg :e  C:\Users\amynd\AppData\Local\nvim\ginit.vim<CR>|        "  edit fvim gui vimrc
  noremap <leader>fer :source C:\Users\amynd\AppData\Local\nvim\init.vim<CR>|     "  reload vimrc

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

  noremap <leader>ts :Colors<CR>|

  noremap <leader>fs :w <CR>|                                  "  save file
  noremap <leader>fq :q <CR>|                                  "  quit file

  "~~~~~~~~~~ INCSEARCH-EASYMOTION PLUGIN  ~~~~~~~~~
  map z/ <Plug>(incsearch-easymotion-/)
  map z? <Plug>(incsearch-easymotion-?)
  map zg <Plug>(incsearch-easymotion-stay)|                    "  search within view buffer

  "~~~~~~~~~~ EASYMOTION PLUGIN  ~~~~~~~~~
  " map <leader><leader>w <Plug>(easymotion-overwin-w)           "  move to word
  " map <leader><leader>e <Plug>(easymotion-bd-e)                "  move to end
  " map <leader><leader>t <Plug>(easymotion-bd-t)                "  search for 1 character
  " map <leader><leader>s <Plug>(easymotion-overwin-f)           "  search for 1 character

  "~~~~~~~~~~ TABULAR PLUGIN ~~~~~~~~~
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:<CR>
	vmap <Leader>a: :Tabularize /:<CR>
	nmap <Leader>as: :Tabularize /:\zs<CR>
	vmap <Leader>as: :Tabularize /:\zs<CR>

  "~~~~~~~~~~ MOVE LINES ~~~~~~~~~
  vnoremap <A-Up> :m -2<CR>
  vnoremap <A-Down> :m +1<CR>
  nnoremap <A-Up> :m -2<CR>
  nnoremap <A-Down> :m +1<CR>

  vnoremap <A-k> :m -2<CR>
  vnoremap <A-j> :m +1<CR>
  nnoremap <A-k> :m -2<CR>
  nnoremap <A-j> :m +1<CR>

	nmap <S-Enter> O<Esc>
	nmap <CR> o<Esc>

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

	nnoremap <leader>wh <C-w>h
	nnoremap <leader>wj <C-w>j
	nnoremap <leader>wk <C-w>k
	nnoremap <leader>wl <C-w>l

  noremap <leader>wv :vsplit<CR>|                              "  split window vertically
  noremap <leader>ws :split<CR>|                               "  split window vertically
  noremap <leader>wvr :vert sview <C-Z><CR>|                   "  split vertically in read only mode
  noremap <leader>wd :hide<CR>|                                "  delete window
  noremap <leader>wo :only<CR>|                                "  keep only current window open

  "~~~~~~~~~~TAB NAVIGATION ~~~~~~~~~
  noremap <leader>td :tabclose<CR>|                            "  close tab
  noremap <leader>t :tabnew<CR>|                               "  open new empty tab
  noremap <leader>tn :tabn<CR>|                                "  go to next tab
  noremap <leader>tp :tabp<CR>|                                "  go to prev tab

  "~~~~~~~~~~ BUFFER NAVIGATION~~~~~~~~~
  noremap <leader>bb :Buffers<CR>|                             "  open buffer menu
  noremap <leader>bd :bd<CR>|                                  "  delete buffer
	noremap <leader>br :e<CR>|                                   "  reload buffer
	noremap <leader>bp :bp<CR>|                                  "  previous buffer
	noremap <leader>bn :bn<CR>|                                  "  next buffer

  set wildchar=<Tab> wildmenu wildmode=full
  set wildcharm=<C-Z>

  "~~~~~~~~~~ SEARCH ~~~~~~~~
  nmap <leader>sb :BLines<CR>|                                 "  swoop current buffer
  nmap <leader>sa :Lines<CR>|                                  "  swoop all open buffer

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
  nnoremap <silent> <leader>cd :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  nmap <leader>rn <Plug>(coc-rename)                           " Remap for rename current word

  autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight on symbol under cursor

	nmap <silent> gp <Plug>(coc-diagnostic-prev)         " prev diagnostic
	nmap <silent> gn <Plug>(coc-diagnostic-next)         " next diagnostic

  nnoremap <silent> <leader>ce  :<C-u>CocList diagnostics<cr>    " Show all diagnostics
  nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>     " Manage extensions
  nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>       " Show commands
  nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>        " Find symbol of current document
	nnoremap <silent> <leader>cs :<C-u>CocList -I symbols<cr>      " Search workspace symbols
  " nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>                " Do default action for next item.
  " nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>                " Do default action for previous item.
  nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>          " Resume latest coc list

"~~~~~~~~~~ NERDCOMMENTER PLUGIN~~~~~~~~
  nmap <leader>/ <plug>NERDCommenterToggle
  vmap <leader>/ <plug>NERDCommenterToggle gv

"~~~~~~~~~~ TAGBAR PLUGIN~~~~~~~~
  nnoremap <silent> <leader>tt :TagbarToggle<CR>|              "  toggle tag bar
  nnoremap <leader>tb :BTags<CR>|                              "  search tags in current buffer

"~~~~~~~~~~ GOYO PLUGIN~~~~~~~~
	nnoremap <leader>tz :Goyo<CR>|                               " toggle zen mode

"~~~~~~~~~~ SEARCH & REPLACE ~~~~~~~~
  nnoremap <leader>rl :s//<Left>|                              "  search line
  nnoremap <leader>rv :%s///c<Left><Left><Left>|               "  search file & confirm
  nnoremap <leader>rg :%s///gc<Left><Left><Left><Left>|        "  search entire file & confirm
  nnoremap <leader>rc :%s///gcI<Left><Left><Left><Left><Left>| "  search case sensitive

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


" TODO: clean up
" Toggle 'default' terminal
	nnoremap <M-`> :call ChooseTerm("term-slider", 1)<CR>
	" Start terminal in current pane
	nnoremap <M-CR> :call ChooseTerm("term-pane", 0)<CR>
	
	function! ChooseTerm(termname, slider)
			let pane = bufwinnr(a:termname)
			let buf = bufexists(a:termname)
			if pane > 0
					" pane is visible
					if a:slider > 0
							:exe pane . "wincmd c"
					else
							:exe "e #"
					endif
			elseif buf > 0
					" buffer is not in pane
					if a:slider
							:exe "belowright split"
					endif
					:exe "buffer " . a:termname
			else
					" buffer is not loaded, create
					if a:slider
							:exe "belowright split"
					endif
					:terminal
					:exe "f " a:termname
			endif
	endfunction


augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END
