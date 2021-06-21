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
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'
Plug 'tyrannicaltoucan/vim-deep-space'

" Plugin: NerdFonts
" Plug 'https://github.com/ryanoasis/nerd-fonts.git', { 'do': './install.sh' }


" Plugin: Packages

" UI
" Plug 'itchyny/lightline.vim'
" Plug 'mhinz/vim-signify'
Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Utility
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-rooter'
Plug 'alvan/vim-closetag'
Plug 'folke/which-key.nvim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'mcchrish/nnn.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'

" Files and Projects
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP And Syntax
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'pangloss/vim-javascript'
" Plug 'sheerun/vim-polyglot', { 'for': [ 'typescript', 'javascript', 'i3', 'html5', 'cpp', 'markdown', 'jsx' ] }
Plug 'ap/vim-css-color'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'liuchengxu/vista.vim'
Plug 'mattn/emmet-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'vim-test/vim-test'

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

call plug#end()

