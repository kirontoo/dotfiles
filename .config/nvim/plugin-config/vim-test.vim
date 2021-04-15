"       .__                    __                   __
" ___  _|__| _____           _/  |_  ____   _______/  |_
" \  \/ /  |/     \   ______ \   __\/ __ \ /  ___/\   __\
"  \   /|  |  Y Y  \ /_____/  |  | \  ___/ \___ \  |  |
"   \_/ |__|__|_|  /          |__|  \___  >____  > |__|
"                \/                     \/     \/

nnoremap <silent> <leader>rts :TestSuite<CR>|    " run test suite
nnoremap <silent> <leader>rtn :TestNearest<CR>|  " run nearest test to cursor
nnoremap <silent> <leader>rtf :TestFile<CR>|     " run test file
nnoremap <silent> <leader>rtl :TestLast<CR>|     " run last test that was ran
nnoremap <silent> <leader>rtv :TestVisit<CR>|    " open the last run test in the current buffer
