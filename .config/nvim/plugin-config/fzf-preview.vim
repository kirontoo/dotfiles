nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> <leader>g					 :<C-u>CocCommand fzf-preview.GitFiles<CR>
nnoremap <silent> <space><space>     :<C-u>CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <silent> <leader>,				   :<C-u>CocCommand fzf-preview.Buffers<CR>

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]gp    :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru directory<CR>
nnoremap <silent> [fzf-p]j		 :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>

nnoremap <silent> [fzf-p]ce :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 2
