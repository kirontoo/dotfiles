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
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'thaerkh/vim-indentguides'
Plug 'ap/vim-css-color'

" Utility
Plug 'airblade/vim-rooter'
Plug 'alvan/vim-closetag'
Plug 'brooth/far.vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mcchrish/nnn.vim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'vimwiki/vimwiki'

" Files and Projects
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mhinz/vim-startify'
Plug 'Xuyuanp/nerdtree-git-plugin'

" LSP and Git
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-test/vim-test'
" Plug 'sheerun/vim-polyglot', { 'for': [ 'typescript', 'javascript', 'i3', 'html5', 'cpp', 'markdown', 'jsx' ] }

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Telescope Dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Syntax
Plug 'pangloss/vim-javascript'

" Extras
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

