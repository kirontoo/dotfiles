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
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'tyrannicaltoucan/vim-deep-space'

" Plugin: NerdFonts
" Plug 'https://github.com/ryanoasis/nerd-fonts.git', { 'do': './install.sh' }

" Plugin: Packages

" UI
Plug 'Pocco81/TrueZen.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'
" Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'Yggdroot/indentLine'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ray-x/lsp_signature.nvim'
Plug 'ryanoasis/vim-devicons'

" Fix for fern plugin
Plug 'antoinemadec/FixCursorHold.nvim'
" File Explorer
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'

" Utility
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-rooter'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'alvan/vim-closetag'
Plug 'fatih/vim-go'
Plug 'folke/twilight.nvim',
Plug 'folke/which-key.nvim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'lambdalisue/fern.vim'
Plug 'pwntester/octo.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-test/vim-test'
Plug 'vimwiki/vimwiki'
Plug 'windwp/nvim-autopairs'

" Files, Projects, Sessions
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'mhinz/vim-startify'

Plug 'glepnir/dashboard-nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'

" LSP And Syntax
Plug 'ap/vim-css-color'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'liuchengxu/vista.vim'
Plug 'mattn/emmet-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate', 'branch': 'master' }

" Debugger Plugins
Plug 'puremourning/vimspector'

call plug#end()

