" Autoinstall package manager

" Plugin Calls
if has("win32") || has("win16")
	let $PLUGVIM = $HOME . '\AppData\Local\nvim\autoload\plug.vim'
	let $PLUGGEDPATH = $HOME . '\AppData\Local\nvim\autoload\plugged'
else
	let $PLUGVIM = $HOME . '/.local/share/nvim/site/autoload/plug.vim'
	let $PLUGGEDPATH = $HOME . '/.local/share/nvim/plugged'
endif

if empty(glob( $PLUGVIM ))
	silent !curl -fLo $PLUGVIM --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin( $PLUGGEDPATH )

" Plugin: Colorschemes
Plug 'aswathkk/DarkScene.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'franbach/miramare'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'zefei/cake16'

" Plugin: NerdFonts
" Plug 'https://github.com/ryanoasis/nerd-fonts.git', { 'do': './install.sh' }

" Plugin: Packages

" UI
" Plug 'thaerkh/vim-indentguides'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Utility
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-rooter'
Plug 'alvan/vim-closetag'
Plug 'brooth/far.vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'mcchrish/nnn.vim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'stsewd/fzf-checkout.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'

" Files and Projects
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'

" LSP and Git
" Plug 'sheerun/vim-polyglot', { 'for': [ 'typescript', 'javascript', 'i3', 'html5', 'cpp', 'markdown', 'jsx' ] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-test/vim-test'

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Syntax
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'

" Extras
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

