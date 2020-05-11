"         __         .__
"   _____/  |________|  | ______
" _/ ___\   __\_  __ \  | \____ \
" \  \___|  |  |  | \/  |_|  |_> >
"  \___  >__|  |__|  |____/   __/
"      \/                 |__|

" CTRLP Configuration
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
