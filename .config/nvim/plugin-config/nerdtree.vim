"                         .___   __
"   ____   ___________  __| _/ _/  |________   ____   ____
"  /    \_/ __ \_  __ \/ __ |  \   __\_  __ \_/ __ \_/ __ \
" |   |  \  ___/|  | \/ /_/ |   |  |  |  | \/\  ___/\  ___/
" |___|  /\___  >__|  \____ |   |__|  |__|    \___  >\___  >
"      \/     \/           \/                     \/     \/

" Exit Nerd Tree on exit vim
autocmd bufenter * if (winnr("$") == 1 && exists( " b:NERDTree " ) && b:NERDTree.isTabTree()) | q | endif


" NERD Tree Config
let g:NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags=1
let g:NERDTreeIgnore = [ '^node_modules$', '\.meta$']
let g:webdevicons_conceal_nerdtree_brackets=1
" let g:NERDTreeStatusline=-1
let NERDTreeStatusline="%8*%=%7*NERD%8*%="
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "left"

"~~~~~~~~~~ NERD TREE PLUGIN~~~~~~~~~
noremap <leader>tt :NERDTreeToggle<CR>
noremap <leader>tv :NERDTreeToggleVCS<CR>
noremap <leader>tf :NERDTreeFocus<CR>
noremap <leader>tr :NERDTreeRefreshRoot<CR>
noremap <leader>tc :NERDTreeClose<CR>
