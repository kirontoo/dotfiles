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

" Plugin: NerdFonts
" Plug 'https://github.com/ryanoasis/nerd-fonts.git', { 'do': './install.sh' }

" Plugin: Packages
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot', { 'for': [ 'typescript', 'javascript', 'i3', 'html5', 'cpp' ] }
Plug 'takac/vim-hardtime'
Plug 'thaerkh/vim-indentguides'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

