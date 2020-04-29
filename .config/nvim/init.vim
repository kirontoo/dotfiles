"  __   .__                      __
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
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo '~/.local/share/nvim/site/autoload/plug.vim' --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

	call plug#begin('~/.local/share/nvim/pugged')
endif

" Plugin: Colorschemes
Plug 'aswathkk/DarkScene.vim'
Plug 'artanikin/vim-synthwave84'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'dracula/vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ntk148v/vim-horizon'
Plug 'stillwwater/vim-nebula'
Plug 'tjammer/blayu.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-airline/vim-airline-themes'
Plug 'wadackel/vim-dogrun'

" Plugin: NerdFonts
" Plug 'https://github.com/ryanoasis/nerd-fonts.git', { 'do': './install.sh' }

" Plugin: Packages
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['typescript', 'javascript']}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'sheerun/vim-polyglot', { 'for': [ 'typescript', 'javascript', 'i3', 'html5', 'cpp' ] }
Plug 'takac/vim-hardtime'
Plug 'thaerkh/vim-indentguides'
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'

call plug#end()

" COC extensions
let g:coc_global_extensions=[ 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-tslint', 'coc-html', 'coc-css', 'coc-omnisharp', 'coc-explorer' ]

filetype plugin indent on

" For terminal true color
if (has("termguicolors"))
	set termguicolors
endif

if !has('gui_running')
	set t_Co=256
endif

" Basic configurations
set nocompatible                 " prevent remapping to make plugins compatible
set ttyfast                      " Speed up scrolling in Vim
set path+=**                     " Search down into subfolders & provide tab-completion
set wildmenu                     " Display all matching files when tab-complete
set wildignore+=*/node_modules/* " ignore folders to search
set updatetime=100               " lower updatetime to 100ms from 4000
set lazyredraw

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set signcolumn=yes               " Enable sign column

" Syntax Color Scheme / Theme
colorscheme challenger_deep
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
hi! Normal ctermbg=NONE guibg=NONE

" NOTE: needs to be called before colorscheme
syntax on                        " Turn on syntax highlighting

" ~Tab indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set smarttab
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


" FIXME
" hi Pmenu guibg=bg

" undrline cursorlone instead of highlight
augroup CustomCursorLine
	au!
	au ColorScheme * :hi clear CursorLine
	au ColorScheme * :hi! CursorLine gui=underline cterm=underline
augroup END

set wildmode=list:longest        " Auto complete

set showcmd                      " show command
set hlsearch                     " highlight search terms
set incsearch                    " show search matches as you type
set ignorecase                   " Ignore case

" OS CLIPBOARD
set clipboard+=unnamed

" Disable automatic comment on newline
set formatoptions-=cro

" Mode Cursor Settings
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor/iCursor
set guicursor+=i:hor20-Cursor/iCursor
set guicursor+=r:hor20-Cursor/rCursor-blinkwait300-blinkoff200-blinkon150

"~set command timeout
set timeoutlen=2000

"~source file for tags
set tags+=tags

" Folding syntax
set foldmethod=manual
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let typeScript_fold=1					" Typescript
let csharp_fold=1             " C#
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script

"~~~~~~~ AUTOMACTIC SETTINGS ~~~~~~~~
autocmd FileType cs,js,css,jsx,ts,tsx autocmd BufWritePre <buffer> %s/\s\+$//e        " automatically remove all trailing whitespace
autocmd CursorMoved * if (expand('<cword>') =~ @/) | set hlsearch | else | set nohlsearch | endif         " unhighligt for search
autocmd bufenter * if (winnr("$") == 1 && exists( " b:NERDTree " ) && b:NERDTree.isTabTree()) | q | endif " Exit Nerd Tree on exit vim
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o        " prevent comment on new newline

set nolist                                        " show trailing whitespaces
set showbreak=↪\
" set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:§
autocmd filetype html,xml set listchars-=tab:>. " disable trailing whitspace for html/xml

" highlight trailing whitespaces in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Airline (Powerline) Themes and Config
let g:airline_theme='challenger_deep'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='short_path'
let g:airline#extensions#tabline#buffer_nr_show=1 " buffer number
let g:airline#extensions#tabline#buffer_nr_format='%s: ' " buffer number
let g:airline_left_sep=''
let g:airline_right_sep=''

" Font
" set guifont=space\ mono:h14
" set guifont=envy\ code\ r:h12
" set guifont=terminessttf\ nf:h12
set guifont=source\ code\ pro\ for\ powerline:h15
" set guifont=iosevka:h16

" Vim-Swoop Config
let g:defaultWinSwoopHeight=15

" NERD Tree Config
let g:NERDTreeShowHidden=1

" Configure Goyo
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

" For typescript syntax colors
let g:polyglot_disabled=['jsx']


" FZF Config
" let $FZF_DEFAULT_COMMAND="find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
	let buf = nvim_create_buf(v:false, v:true)
	call setbufvar(buf, '&signcolumn', 'no')
	let height = float2nr(22)
	let width = float2nr(110)
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = float2nr((&lines - height) / 2)
	let opts = {
				\ 'relative': 'editor',
				\ 'row': vertical,
				\ 'col': horizontal,
				\ 'width': width,
				\ 'height': height,
				\ }
	call nvim_open_win(buf, v:true, opts)
endfunction
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Keyword'],
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

" Hardtime Config
let g:hardtime_default_on=1
let g:hardtime_showmsg=1
let g:hardtime_ignore_buffer_patterns=[ "coc-explorer", "help" ]

" Startify Config
let g:startify_session_peristence=1
let g:startify_session_number=5
let g:startify_change_to_vcs_root=1
let g:startify_files_number=5
let g:startify_custom_header =
			\ 'startify#center(startify#fortune#cowsay())'
let g:startify_custom_footer =
			\ ['', "          Kironto", '']
let g:startify_lists = [
			\ { 'type': 'commands',  'header': ['   Commands']       },
			\ { 'type': 'sessions',  'header': ['   Sessions']       },
			\ { 'type': 'files',     'header': ['   MRU']            },
			\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ ]
if has("win32") || has("win16")
	let g:startify_commands = [ { 's': [ 'open init.vim', 'e C:\Users\amynd\AppData\Local\nvim\init.vim']}, { 'c': [ 'open coc settings', ':CocConfig' ] } ]
else
	let g:startify_commands = [ { 's': [ 'open init.vim', 'e ~/.config/nvim/init.vim']}, { 'c': [ 'open coc settings', ':CocConfig' ] }]
endif
"
" Signify Config
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE

" Lightline Config
set laststatus=2
set noshowmode
" set showtabline=2
let g:lightline = {
			\ 'enable': { 'statusline': 0, 'tabline': 0 },
			\ 'colorscheme': 'seoul256',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly' ],
			\							[ 'bufnum', 'absolutepath', 'modified' ] ],
			\		'right': [ [ 'currentfunction', 'cocstatus' ],
			\							 [ 'percent', 'lineinfo' ],
			\							 [ 'filetype', 'fileformat' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead',
			\		'cocstatus': 'coc#status',
			\		'currentfunction': 'CocCurrentFunction'}}
let g:lightline.tabline = {
			\ 'left': [ [ 'buffers' ] ],
			\ 'right': [ [ 'close' ] ] }
let g:lightline.tab = {
			\ 'active': [ 'tabnum', 'filename', 'modified' ],
			\ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
let g:lightline.component_type = { 'buffers': 'tabsel' }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline#bufferline#show_number=1
let g:lightline#bufferline#clickable=1
let g:lightline#bufferline#shorten_path=0
let g:lightline.component_raw = {'buffers': 1}
let g:lightline.mode_map = {
			\ 'n' : 'NORMAL',
			\ 'i' : 'INSERT',
			\ 'r' : 'REPLACE',
			\ 'R' : 'REPLACE',
			\ 'v' : 'VISUAL',
			\ 'V' : 'V-LINE',
			\ "\<C-v>": 'V-BLOCK',
			\ 'c' : 'COMMAND',
			\ 's' : 'SELECT',
			\ 'S' : 'S-LINE',
			\ "\<C-s>": 'S-BLOCK',
			\ 't': 'TERMINAL',
			\ }

" CSharp settings
let g:OmniSharp_highlight_groups = {
			\ 'csUserIdentifier': [
			\   'constant name', 'enum member name', 'field name', 'identifier',
			\   'local name', 'parameter name', 'property name', 'static symbol'],
			\ 'csUserInterface': ['interface name'],
			\ 'csUserMethod': ['extension method name', 'method name'],
			\ 'csUserType': ['class name', 'enum name', 'namespace name', 'struct name']
			\}

" vim-rooter config
let g:rooter_silent_chdir=1       " silence echoing the project dir

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

"~~~~~~~~~~ FILES AND NAVIGATION ~~~~~~~~
noremap <leader>fev :e  $MYVIMRC<CR>|                        " edit vimrc
noremap <leader>feg :e  $MYVIMRC<CR>|                        " edit fvim gui vimrc
noremap <leader>fer :source $MYVIMRC<CR>|                    " reload vimrc

noremap <leader>fi gg=G|                                     " fix file indents

"~~~~~~~~~~ NERD TREE PLUGIN~~~~~~~~~
" noremap <leader>ft :NERDTreeToggle ~/<CR>
" noremap <leader>tf :NERDTreeFocus<CR>
" noremap <leader>pt :NERDTreeVCS<CR>
" noremap <leader>tc :NERDTreeClose<CR>

"~~~~~~~~~~ FZF PLUGIN  ~~~~~~~~~
noremap <leader>fp :GFiles <CR>|                             "  Search file in current git Directory
noremap <leader>fd :FZF    <CR>|                             "  Search file in current Directory
noremap <leader>ff :Files $HOME<CR>|                         "  Search file in Home Directory
noremap <leader>fh :History <CR>|                            "  command history


"~~~~~~~~~~ COLOR SCHEMES ~~~~~~~~~~~~
noremap <leader>tt :Colors<CR>|
noremap <leader>ts :call Solarized()<CR>
function! Solarized()
	colorscheme solarized8_high
	let g:airline_theme='solarized'
	set background=light
endfunction

noremap <leader>tg :call Gruvbox()<CR>
function! Gruvbox()
	colorscheme gruvbox
	let g:airline_theme='gruvbox'
endfunction

noremap <leader>ta :call Dracula()<CR>
function! Dracula()
	colorscheme dracula
	let g:airline_theme='dracula'
	set background=dark
endfunction

"~~~~~~~~~~ FILES ~~~~~~~~~
noremap <leader>fs :w <CR>|                                  "  save file
noremap <leader>fq :q <CR>|                                  "  quit file

"~~~~~~~~~~ INCSEARCH-EASYMOTION PLUGIN  ~~~~~~~~~
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg <Plug>(incsearch-easymotion-stay)|                    "  search within view buffer

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

"~~~~~~~~~~ YANK LINES ~~~~~~~~~
nnoremap Y y$                                                " yank to end of line

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

"~~~~~~~~~~ DIRECTORY ~~~~~~~~~
nnoremap <leader>de :e %:h/|                                 " edit another file in same directory
nnoremap <leader>ds :split %:h/|
nnoremap <leader>dv :vsplit %:h/|

"~~~~~~~~~~ FUGITIVE PLUGIN~~~~~~~~
nnoremap <leader>gs :Gstatus<CR>|                            "  git status
nnoremap <leader>gc :Gcommit<CR>|                            "  git commit
nnoremap <leader>gd :Gdiff<CR>|                              "  git diff
nnoremap <leader>gf :Gpull<CR>|                              "  git pull
nnoremap <leader>gp :Gpush<CR>|                              "  git push
nnoremap <leader>gm :Gmerge<CR>|                             "  git merge

"~~~~~~~~~~ COC PLUGIN~~~~~~~~
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
command! -nargs=? Fold :call     CocAction('fold', <f-args>) " Add :Fold command to fold buffer
command! -nargs=? OR :call CocAction('runCommand, 'editor.action.organizeImport')
set shortmess+=c

nmap <silent> gp <Plug>(coc-diagnostic-prev)         " prev diagnostic
nmap <silent> gn <Plug>(coc-diagnostic-next)         " next diagnostic

nnoremap <silent> <leader>ce  :<C-u>CocList diagnostics<cr>    " Show all diagnostics
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>     " Manage extensions
nnoremap <silent> <leader>cz  :<C-u>CocList commands<cr>       " Show commands
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>        " Find symbol of current document
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>     " Search workspace symbols

nnoremap <silent> <leader>ca  :<Plug>(coc-codeaction)          " Apply code actoin to current line
nnoremap <silent> <leader>cf  :<Plug>(coc-fix-current)         " Autofix a problem on the current line
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>                " Do default action for next item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>                " Do default action for previous item.
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>          " Resume latest coc list

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" coc-explorer
nmap <silent><leader>et :CocCommand explorer <CR>
nmap <silent><leader>ef :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
let g:coc_explorer_global_presets = {
			\   '.vim': {
			\      'root-uri': '~/.vim',
			\   },
			\   'floating': {
			\      'position': 'floating',
			\      'floating-width': 100,
			\      'floating-height': 30
			\   },
			\   'floatingLeftside': {
			\      'position': 'floating',
			\      'floating-position': 'left-center',
			\      'floating-width': 20,
			\   },
			\   'floatingRightside': {
			\      'position': 'floating',
			\      'floating-position': 'left-center',
			\      'floating-width': 20,
			\   },
			\   'simplify': {
			\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
			\   }
			\ }

"~~~~~~~~~~ TAGBAR PLUGIN~~~~~~~~
map <leader><leader>w <Plug>(easymotion-overwin-w)
map <leader><leader>e <Plug>(easymotion-bd-e)
map <leader><leader>t <Plug>(easymotion-bd-t)
map <leader><leader>s <Plug>(easymotion-overwin-f)

"~~~~~~~~~~ TAGBAR PLUGIN~~~~~~~~
" nnoremap <silent> <leader>tt :TagbarToggle<CR>|              "  toggle tag bar
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

"~~~~~~~~~~ BACKGROUND TOGGLE ~~~~~~~~~
nnoremap <leader>bg :call ToggleBackground()<cr>
function! ToggleBackground()
	if &background == "dark"
		set background=light
	else
		set background=dark
	endif
endfunction

"~~~~~~~~~~ STARTIFY PLUGIN ~~~~~~~~~
nnoremap <leader>ss :SSave <CR>
nnoremap <leader>sc :SClose <CR>
nnoremap <leader>sl :SLoad <TAB>

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

" center cursor to middle of screen
augroup VCenterCursor
	au!
	au BufEnter,WinEnter,WinNew,VimResized *,*.*
				\ let &scrolloff=winheight(win_getid())/2
augroup END

