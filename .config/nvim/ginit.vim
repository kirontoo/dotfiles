if exists('g:fvim_loaded')
	nnoremap <F11> :FVimToggleFullScreen<CR>
	FVimCursorSmoothBlink v:true
	FVimFontAntialias v:true
	FVimFontLigature v:true
	FVimFontSubpixel v:true
	FVimFontAutoSnap v:true
	set guifont=Iosevka:h15
endif

if exists('g:GuiLoaded')
	GuiPopupmenu 0
	GuiTabline 0
	nnoremap <silent> <c-w>f :call GuiWindowFullScreen((g:GuiWindowFullScreen + 1) % 2)<cr>
endif

