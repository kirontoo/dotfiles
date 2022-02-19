" let g:fern#renderer = "devicons"
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1

" Keymaps

nnoremap <leader>tds <cmd>Fern %:h -opener=split<cr>
nnoremap <leader>tdv <cmd>:Fern %:h -opener=vsplit<cr>
nnoremap <leader>t. <cmd>:Fern %:h<cr>
nnoremap <leader>tp <cmd>:Fern .<cr>

nnoremap <leader>tt <cmd>Fern . -drawer -toggle<cr>
nnoremap <leader>tf <cmd>Fern . -drawer -reveal=%<cr>
" nnoremap <leader>tr <cmd>Fern . -drawer -toggle -reveal=%<cr>
nnoremap <leader>tr <Plug>(fern-action-reload)

function! FernInit() abort
    nmap <buffer> N <Plug>(fern-action-new-path)
    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> X <Plug>(fern-action-remove)
    nmap <buffer> <C-x> <Plug>(fern-action-open:split)
    nmap <buffer> <C-v> <Plug>(fern-action-open:vsplit)
    nmap <buffer> <nowait> < <Plug>(fern-action-leave)
    nmap <buffer> <nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
    autocmd!
    autocmd Filetype fern call FernInit()
augroup END
