"   _____            .__  __  .__
" _/ ____\_ __  ____ |__|/  |_|__|__  __ ____
" \   __\  |  \/ ___\|  \   __\  \  \/ // __ \
"  |  | |  |  / /_/  >  ||  | |  |\   /\  ___/
"  |__| |____/\___  /|__||__| |__| \_/  \___  >
"            /_____/                        \/

"~~~~~~~~~~ FUGITIVE PLUGIN~~~~~~~~
nnoremap <leader>gc <cmd>:Git commit<CR>|                       "  git commit
nnoremap <leader>gd <cmd>:Gvdiffsplit<CR>|                      "  git diff
nnoremap <leader>gr <cmd>:Gremove<CR>|                          "  git diff
nnoremap <leader>gl <cmd>:Git pull<CR>|                         "  git pull
nnoremap <leader>gm <cmd>:Git merge<CR>|                        "  git merge
nnoremap <leader>gp <cmd>:Git push<CR>|                         "  git push
nnoremap <leader>gs <cmd>:Git <CR>|                             "  git status

nnoremap <leader>gmu :Git merge upstream/
nnoremap <leader>gfu <cmd>Git fetch upstream<CR>

" FROM fzf-checkout.vim
" nnoremap <leader>gc :GCheckout<CR>
