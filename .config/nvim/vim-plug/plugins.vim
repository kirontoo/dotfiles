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
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'franbach/miramare'
Plug 'haishanh/night-owl.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'nice/sweater'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ntk148v/vim-horizon'
Plug 'tjammer/blayu.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'zefei/cake16'

" Plugin: NerdFonts
" Plug 'https://github.com/ryanoasis/nerd-fonts.git', { 'do': './install.sh' }

" Plugin: Packages

" UI
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-xtabline'
Plug 'mhinz/vim-signify'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'thaerkh/vim-indentguides'
Plug 'ap/vim-css-color'

" Utility
Plug 'airblade/vim-rooter'
Plug 'alvan/vim-closetag'
Plug 'brooth/far.vim'
" Plug 'easymotion/vim-easymotion'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'AndrewRadev/splitjoin.vim'

" Files and Projects
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'mhinz/vim-startify'
Plug 'Xuyuanp/nerdtree-git-plugin'

" LSP and Git
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot', { 'for': [ 'typescript', 'javascript', 'i3', 'html5', 'cpp', 'markdown', 'jsx' ] }
Plug 'tpope/vim-fugitive'

" Extras
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

