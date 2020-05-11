"         .__  __                 __    __
"    ____ |__|/  |_  ____  __ ___/  |__/  |_  ___________
"   / ___\|  \   __\/ ___\|  |  \   __\   __\/ __ \_  __ \
"  / /_/  >  ||  | / /_/  >  |  /|  |  |  | \  ___/|  | \/
"  \___  /|__||__| \___  /|____/ |__|  |__|  \___  >__|
" /_____/         /_____/                        \/

" Git Gutter Config
let g:gitgutoter_max_signs=200           "  change max signs shown
let g:gitgutter_enabled=1
" for windows only
if has("win32") || has("win16")
	let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
endif
