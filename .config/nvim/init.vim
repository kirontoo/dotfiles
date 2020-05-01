"  __   .__                      __
" |  | _|__|______  ____   _____/  |_  ____   ____
" |  |/ /  \_  __ \/  _ \ /    \   __\/  _ \ /  _ \
" |    <|  ||  | \(  <_> )   |  \  | (  <_> |  <_> )
" |__|_ \__||__|   \____/|___|  /__|  \____/ \____/
" \/                     \/

" .__       .__  __          .__
" |__| ____ |__|/  |_  ___  _|__| _____
" |  |/    \|  \   __\ \  \/ /  |/     \
" |  |   |  \  ||  |    \   /|  |  Y Y  \
" |__|___|  /__||__|     \_/ |__|__|_|  /
"         \/                          \/

if has("win32")
	let $VIMPATH=$HOME . "/AppData/Local/nvim"
else
	let $VIMPATH=$HOME . ".config/nvim"
endif

source $VIMPATH/vim-plug/plugins.vim
source $VIMPATH/general/settings.vim

" TODO: test this out on linux
" source <sfile>:h/general/settings.vim
" exec "source " . $VIMPATH . "/general/settings.vim"

source $VIMPATH/general/keymaps.vim
source $VIMPATH/general/custom.vim

" colorscheme configs
source $VIMPATH/Themes/themes.vim
source $VIMPATH/themes/dracula.vim
source $VIMPATH/themes/gruvbox.vim
source $VIMPATH/themes/solarized.vim

" plugin configs
source $VIMPATH/plugin-config/airline.vim
source $VIMPATH/plugin-config/coc.vim
source $VIMPATH/plugin-config/ctrlp.vim
source $VIMPATH/plugin-config/devicons.vim
source $VIMPATH/plugin-config/easymotion.vim
source $VIMPATH/plugin-config/fugitive.vim
source $VIMPATH/plugin-config/fzf.vim
source $VIMPATH/plugin-config/gitgutter.vim
source $VIMPATH/plugin-config/goyo.vim
source $VIMPATH/plugin-config/hardtime.vim
source $VIMPATH/plugin-config/lightline.vim
source $VIMPATH/plugin-config/nerdtree.vim
source $VIMPATH/plugin-config/omnisharp.vim
source $VIMPATH/plugin-config/rooter.vim
source $VIMPATH/plugin-config/signify.vim
source $VIMPATH/plugin-config/startify.vim
source $VIMPATH/plugin-config/tabular.vim
source $VIMPATH/plugin-config/vimplug.vim
