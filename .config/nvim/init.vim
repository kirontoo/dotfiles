"  __   .__                      __
" |  | _|__|______  ____   _____/  |_  ____   ____
" |  |/ /  \_  __ \/  _ \ /    \   __\/  _ \ /  _ \
" |    <|  ||  | \(  <_> )   |  \  | (  <_> |  <_> )
" |__|_ \__||__|   \____/|___|  /__|  \____/ \____/
"  \/  \/

if has('win32')
	let $VIMPATH=$HOME . '/AppData/Local/nvim'
else
	let $VIMPATH=$HOME . '/.config/nvim'
endif

source $VIMPATH/vim-plug/plugins.vim
source $VIMPATH/general/settings.vim
source $VIMPATH/general/keymaps.vim
source $VIMPATH/general/netrw.vim

source $VIMPATH/general/custom.vim
source $VIMPATH/general/startup.vim
" source $VIMPATH/general/statusline.vim
" source $VIMPATH/general/galaxyline.vim
source $VIMPATH/general/lualine.vim
source $VIMPATH/general/tabline.vim

" colorscheme configs
" source $VIMPATH/themes/dracula.vim
source $VIMPATH/themes/gruvbox.vim
source $VIMPATH/themes/catppuccin.vim
source $VIMPATH/themes/solarized.vim

" load colorscheme
source $VIMPATH/themes/themes.vim

" plugin configs
" source $VIMPATH/plugin-config/coc.vim
" source $VIMPATH/plugin-config/fzf.vim
" source $VIMPATH/plugin-config/gitgutter.vim
" source $VIMPATH/plugin-config/lightline.vim
" source $VIMPATH/plugin-config/maximize.vim
" source $VIMPATH/plugin-config/nerdtree.vim
" source $VIMPATH/plugin-config/nnn.vim
" source $VIMPATH/plugin-config/nvimtree.vim
" source $VIMPATH/plugin-config/startify.vim
source $VIMPATH/plugin-config/auto-session.vim
source $VIMPATH/plugin-config/autopairs.vim
source $VIMPATH/plugin-config/closetag.vim
source $VIMPATH/plugin-config/dashboard.vim
source $VIMPATH/plugin-config/devicons.vim
source $VIMPATH/plugin-config/diagnosticls.vim
source $VIMPATH/plugin-config/emmet.vim
source $VIMPATH/plugin-config/fern.vim
source $VIMPATH/plugin-config/fugitive.vim
source $VIMPATH/plugin-config/gitsigns.vim
source $VIMPATH/plugin-config/harpoon.vim
source $VIMPATH/plugin-config/incsearch.vim
source $VIMPATH/plugin-config/indent-guide.vim
source $VIMPATH/plugin-config/lspsaga.vim
source $VIMPATH/plugin-config/lua-lsp.vim
source $VIMPATH/plugin-config/nvim-bufferline.vim
source $VIMPATH/plugin-config/nvim-cmp.vim
source $VIMPATH/plugin-config/nvim-lspconfig.vim
source $VIMPATH/plugin-config/polyglot.vim
source $VIMPATH/plugin-config/rooter.vim
source $VIMPATH/plugin-config/session-lens.vim
source $VIMPATH/plugin-config/splitjoin.vim
source $VIMPATH/plugin-config/tabular.vim
source $VIMPATH/plugin-config/telescope.vim
source $VIMPATH/plugin-config/todo-comments.vim
source $VIMPATH/plugin-config/treesitter.vim
source $VIMPATH/plugin-config/trouble.vim
source $VIMPATH/plugin-config/true-zen.vim
source $VIMPATH/plugin-config/vim-test.vim
source $VIMPATH/plugin-config/vimplug.vim
source $VIMPATH/plugin-config/vimspector.vim
source $VIMPATH/plugin-config/vimwiki.vim
source $VIMPATH/plugin-config/vista.vim
source $VIMPATH/plugin-config/symbols-outline.vim
source $VIMPATH/plugin-config/whichkey.vim
