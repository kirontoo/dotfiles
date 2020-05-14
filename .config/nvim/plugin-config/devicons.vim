"     .___          .__
"   __| _/_______  _|__| ____  ____   ____   ______
"  / __ |/ __ \  \/ /  |/ ___\/  _ \ /    \ /  ___/
" / /_/ \  ___/\   /|  \  \__(  <_> )   |  \\___ \
" \____ |\___  >\_/ |__|\___  >____/|___|  /____  >
"      \/    \/             \/           \/     \/

" DevIcons
let entry_format = "'   ['. index .']'. repeat(' ', (3 - strlen(index)))"
if exists('*WebDevIconsGetFileTypeSymbol')  " support for vim-devicons
	let entry_format .= ". WebDevIconsGetFileTypeSymbol(entry_path) .' '.  entry_path"
else
	let entry_format .= '. entry_path'
endif
