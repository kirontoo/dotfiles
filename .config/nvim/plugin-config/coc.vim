"
"   ____  ____   ____
" _/ ___\/  _ \_/ ___\
" \  \__(  <_> )  \___
"  \___  >____/ \___  >
"      \/           \/

" COC extensions
let g:coc_global_extensions=[
				\'coc-json',
				\'coc-tsserver',
				\'coc-emmet',
				\'coc-tslint',
				\'coc-html',
				\'coc-css',
				\'coc-explorer',
			\]

let g:coc_disable_startup_warning = 1

"~~~~~~~~~~ COC PLUGIN~~~~~~~~
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)|                      " go to definition
nmap <silent> gy <Plug>(coc-type-definition)|                 " go to type definition
nmap <silent> gi <Plug>(coc-implementation)|                  " go to implementation
nmap <silent> gr <Plug>(coc-references)|                      " go to reference

" show documentation in preview window
nnoremap <silent> <leader>cd :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

nmap <leader>cr <Plug>(coc-rename)                           " Remap for rename current word

autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight on symbol under cursor
command! -nargs=? Fold :call     CocAction('fold', <f-args>) " Add :Fold command to fold buffer
command! -nargs=? OR :call CocAction('runCommand, 'editor.action.organizeImport')
set shortmess+=c

nmap <silent> gp <Plug>(coc-diagnostic-prev)         " prev diagnostic
nmap <silent> gn <Plug>(coc-diagnostic-next)         " next diagnostic

nnoremap <silent> <leader>ce  :<C-u>CocList diagnostics<cr>    " Show all diagnostics
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>     " Manage extensions
nnoremap <silent> <leader>cz  :<C-u>CocList commands<cr>       " Show commands
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>        " Find symbol of current document
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>     " Search workspace symbols

nnoremap <silent> <leader>ca  :<Plug>(coc-codeaction)          " Apply code actoin to current line
nnoremap <silent> <leader>cf  :<Plug>(coc-fix-current)         " Autofix a problem on the current line
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>                " Do default action for next item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>                " Do default action for previous item.
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>          " Resume latest coc list

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" ~~~~~~~ COC-EXPLORER ~~~~~~~~~~~~~~~~~~~
nmap <silent><leader>et :CocCommand explorer <CR>
nmap <silent><leader>ef :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
let g:coc_explorer_global_presets = {
			\   '.vim': {
			\      'root-uri': '~/.vim',
			\   },
			\   'floating': {
			\      'position': 'floating',
			\      'floating-width': 100,
			\      'floating-height': 30
			\   },
			\   'floatingLeftside': {
			\      'position': 'floating',
			\      'floating-position': 'left-center',
			\      'floating-width': 20,
			\   },
			\   'floatingRightside': {
			\      'position': 'floating',
			\      'floating-position': 'left-center',
			\      'floating-width': 20,
			\   },
			\   'simplify': {
			\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
			\   }
			\ }

