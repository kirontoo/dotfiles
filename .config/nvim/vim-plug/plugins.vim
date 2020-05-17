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
Plug 'dracula/vim'
Plug 'franbach/miramare'
Plug 'haishanh/night-owl.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'
Plug 'stillwwater/vim-nebula'
Plug 'tjammer/blayu.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'vim-airline/vim-airline-themes'

" Plugin: NerdFonts
" Plug 'https://github.com/ryanoasis/nerd-fonts.git', { 'do': './install.sh' }

" Plugin: Packages
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot', { 'for': [ 'typescript', 'javascript', 'i3', 'html5', 'cpp' ] }
Plug 'thaerkh/vim-indentguides'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

