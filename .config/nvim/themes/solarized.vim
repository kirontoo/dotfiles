"              .__               .__                  .___
"   __________ |  | _____ _______|__|_______ ____   __| _/
"  /  ___/  _ \|  | \__  \\_  __ \  \___   // __ \ / __ |
"  \___ (  <_> )  |__/ __ \|  | \/  |/    /\  ___// /_/ |
" /____  >____/|____(____  /__|  |__/_____ \\___  >____ |
"      \/                \/               \/    \/     \/_

noremap <leader>Ts :call Solarized()<CR>
function! Solarized()
	colorscheme solarized8_high
	let g:airline_theme='solarized'
	set background=light
endfunction

