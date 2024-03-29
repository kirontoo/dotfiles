" Toggle 'default' terminal
nnoremap <M-`> :call ChooseTerm("term-slider", 1)<CR>
" Start terminal in current pane
nnoremap <M-CR> :call ChooseTerm("term-pane", 0)<CR>

function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
	" pane is visible
	if a:slider > 0
	    :exe pane . "wincmd c"
	else
	    :exe "e #"
	endif
    elseif buf > 0
	" buffer is not in pane
	if a:slider
	    :exe "belowright split"
	endif
	:exe "buffer " . a:termname
    else
	" buffer is not loaded, create
	if a:slider
	    :exe "belowright split"
	endif
	:terminal
	:exe "f " a:termname
    endif
endfunction

function! ToggleBackground()
    if &background == "dark"
	set background=light
    else
	set background=dark
    endif

    if exists('#lightline')
	call lightline#enable()
    endif
endfunction

" center cursor to middle of screen
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END


fun LastMod()
    if line("$") > 20
      	let l = 20
    else
      	let l = line("$")
    endif
    	exe "1," . l . "g/modified: /s/modified: .*/modified: " .
    	\ strftime("%FT%T%z")
endfun

augroup SkeletonGroup
    autocmd!
    autocmd BufNewFile *.svelte  0r $VIMPATH/snippets/svelte/boilerplate.svelte
    " autocmd BufNewFile $HOME/vimwiki/**/*.md 0r $VIMPATH/snippets/md/skeleton.md
augroup END

" Format json data
command FormatJson :%!jq .
command UnformatJson :%!jq -c .
