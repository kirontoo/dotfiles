"           __                 __  .__  _____
"   _______/  |______ ________/  |_|__|/ ____\__.__.
"  /  ___/\   __\__  \\_  __ \   __\  \   __<   |  |
"  \___ \  |  |  / __ \|  | \/|  | |  ||  |  \___  |
" /____  > |__| (____  /__|   |__| |__||__|  / ____|
"      \/            \/                      \/

"~~~~~~~~~~ STARTIFY PLUGIN ~~~~~~~~~
nnoremap <leader>ss :SSave <CR>
nnoremap <leader>sc :SClose <CR>
nnoremap <leader>sl :SLoad <space>


" Startify Config
let g:startify_session_peristence=1
let g:startify_session_number=5
let g:startify_change_to_vcs_root=1
let g:startify_files_number=5

let g:startify_custom_header =
			\ 'startify#center(startify#fortune#cowsay())'

let g:startify_custom_footer =
			\ ['', "          Kironto", '']

let g:startify_lists = [
			\ { 'type': 'commands',  'header': ['   Commands']       },
			\ { 'type': 'sessions',  'header': ['   Sessions']       },
			\ { 'type': 'files',     'header': ['   MRU']            },
			\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ ]

let g:startify_commands = [
			\ { 's': [ 'open init.vim', 'e $MYVIMRC']},
			\ { 'c': [ 'open coc settings', ':CocConfig' ] },
			\ { 'p': [ 'open plugin list', 'e $VIMPATH/vim-plug/plugins.vim' ] }
			\ ]