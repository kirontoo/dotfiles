"                __    __  .__
"   ______ _____/  |__/  |_|__| ____    ____  ______
"  /  ___// __ \   __\   __\  |/    \  / ___\/  ___/
"  \___ \\  ___/|  |  |  | |  |   |  \/ /_/  >___ \
" /____  >\___  >__|  |__| |__|___|  /\___  /____  >
"      \/     \/                   \//_____/     \/

" Leader key
map <Space> <leader>
filetype plugin indent on

" For terminal true color
if (has("termguicolors"))
	set termguicolors
	hi! Normal ctermbg=NONE guibg=NONE
endif

if !has('gui_running')
	set t_Co=256
endif

" Basic configurations
set nocompatible                                                                                   "  prevent remapping to make plugins compatible
set ttyfast                                                                                        "  Speed up scrolling in Vim
set path+=**                                                                                       "  Search down into subfolders & provide tab-completion
set wildmenu                                                                                       "  Display all matching files when tab-complete
set wildignore+=*/node_modules/*                                                                   "  ignore folders to search
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>

set updatetime=100                                                                                 "  lower updatetime to 100ms from 4000
set lazyredraw

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set laststatus=2
set noshowmode
set signcolumn=yes                                                                                 "  Enable sign column

" ~Tab indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set smarttab
set shiftround                                                                                     "  use multiple of shiftwidth when indenting with '<' and '>'

set splitbelow splitright                                                                          "  Splits window below and right
set mouse=""                                                                                       "  disable mouse usage
set hidden                                                                                         "  hide buffers
set autoindent                                                                                     "  always set autoindenting on
set number relativenumber                                                                          "  Line Numbers

" ~Line Wrap
set tw=80
set nowrap linebreak
set textwidth=0
set wrapmargin=0

set colorcolumn=80,120
" let &colorcolumn="80,".join(range(120,256),",")

set nolist                                                                                         "  show trailing whitespaces
" set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:§

" Font
" set guifont=space\ mono:h15
" set guifont=envy\ code\ r:h15
" set guifont=terminessttf\ nf:h16
" set guifont=source\ code\ pro\ for\ powerline:h15
set guifont=iosevka:h16
" set guifont=scientifica:h20

" FIXME
" hi Pmenu guibg=bg

set cursorline                                                                                     "  Show line highlight
" underline cursorline instead of highlight
augroup CustomCursorLine
	au!
	au ColorScheme * :hi clear CursorLine
	au ColorScheme * :hi! CursorLine gui=underline cterm=underline
augroup END

set wildmode=list:longest                                                                          "  Auto complete

set showcmd                                                                                        "  show command
set hlsearch                                                                                       "  highlight search terms
set incsearch                                                                                      "  show search matches as you type
set ignorecase                                                                                     "  Ignore case

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

"~set command timeout ( milliseconds )
set timeoutlen=700

"~source file for tags
set tags+=tags

" Folding syntax
set foldmethod=manual
set foldlevelstart=1

let javaScript_fold=1                                                                              "  JavaScript
let typeScript_fold=1                                                                              "  Typescript
let csharp_fold=1                                                                                  "  C#
let sh_fold_enabled=1                                                                              "  sh
let vimsyn_folding='af'                                                                            "  Vim script

"~~~~~~~ AUTOMACTIC SETTINGS ~~~~~~~~
" automatically remove all trailing whitespace
autocmd FileType cs,js,css,jsx,ts,tsx,vim,c autocmd BufWritePre <buffer> %s/\s\+$//e

" unhighligt for search
autocmd CursorMoved * if (expand('<cword>') =~ @/) | set hlsearch | else | set nohlsearch | endif

" prevent comment on new newline
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" highlight trailing whitespaces in red
highlight ExtraWhitespace ctermbg=red guibg=red

augroup ClearWhitespace
match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()
augroup END
