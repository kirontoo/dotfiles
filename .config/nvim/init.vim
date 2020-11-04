"  __   .__                      __
" |  | _|__|______  ____   _____/  |_  ____   ____
" |  |/ /  \_  __ \/  _ \ /    \   __\/  _ \ /  _ \
" |    <|  ||  | \(  <_> )   |  \  | (  <_> |  <_> )
" |__|_ \__||__|   \____/|___|  /__|  \____/ \____/
"  \/  \/

if has("win32")
	let $VIMPATH=$HOME . "/AppData/Local/nvim"
else
	let $VIMPATH=$HOME . "/.config/nvim"
endif

source $VIMPATH/vim-plug/plugins.vim
source $VIMPATH/general/settings.vim
source $VIMPATH/general/keymaps.vim

source $VIMPATH/general/custom.vim
source $VIMPATH/general/statusline.vim
" source $VIMPATH/general/tabline.vim

" For vscode
if exists('g:vscode')
	 source $VIMPATH/vscode/settings.vim
else

" colorscheme configs
source $VIMPATH/themes/dracula.vim
source $VIMPATH/themes/gruvbox.vim
source $VIMPATH/themes/solarized.vim
source $VIMPATH/themes/miramare.vim

" load colorscheme
source $VIMPATH/themes/themes.vim

" plugin configs
source $VIMPATH/plugin-config/coc.vim
source $VIMPATH/plugin-config/closetag.vim
source $VIMPATH/plugin-config/devicons.vim
" source $VIMPATH/plugin-config/easymotion.vim
source $VIMPATH/plugin-config/far.vim
source $VIMPATH/plugin-config/fugitive.vim
source $VIMPATH/plugin-config/fzf.vim
" source $VIMPATH/plugin-config/fzf-preview.vim
source $VIMPATH/plugin-config/gitgutter.vim
source $VIMPATH/plugin-config/goyo.vim
source $VIMPATH/plugin-config/hexokinase.vim
source $VIMPATH/plugin-config/incsearch.vim
source $VIMPATH/plugin-config/nerdtree.vim
" source $VIMPATH/plugin-config/neoterm.vim
source $VIMPATH/plugin-config/omnisharp.vim
source $VIMPATH/plugin-config/polyglot.vim
source $VIMPATH/plugin-config/rooter.vim
source $VIMPATH/plugin-config/startify.vim
source $VIMPATH/plugin-config/tabular.vim
source $VIMPATH/plugin-config/vimplug.vim
source $VIMPATH/plugin-config/vista.vim
source $VIMPATH/plugin-config/xtabline.vim

source $VIMPATH/plugin-config/treesitter.lua
source $VIMPATH/plugin-config/telescope.lua

endif
