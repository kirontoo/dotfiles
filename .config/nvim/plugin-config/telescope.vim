lua <<EOF

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

-- totally optional to use setup
require('telescope').setup ({
defaults = {
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--files',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--follow',
      '--ignore'
    },
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    layout_config = {
      horizontal = {
        preview_width = 0.6,
        mirror = false,
      },
      bottom_pane = {
        height = 0.4,
        prompt_position = "bottom",
        mirror = true,
      },
      vertical = {
        mirror = false,
      },
      preview_cutoff = 120,
      prompt_position = "bottom",
    },
    path_display = {
      "tail",
      "shorten",
      "absolute"
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { ".git", "node_modules" },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 10,
    border = {},
    borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
    show_line = false,
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  }
})

require("telescope").load_extension("session-lens")

EOF

highlight TelescopeBorder         guifg=#a1efd3
highlight TelescopePromptBorder   guifg=#a1efd3
highlight TelescopeResultsBorder  guifg=#a1efd3
highlight TelescopePreviewBorder  guifg=#a1efd3

" nnoremap <leader><space> <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader><space> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy(), {hidden=false})<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').file_browser(require('telescope.themes').get_ivy())<cr>
" nnoremap <leader>ff <cmd>Telescope file_browser hidden=true<cr>
nnoremap <leader>fh <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ht <cmd>Telescope help_tags<cr>

nnoremap <leader>, <cmd>Telescope buffers previewer=false layouts.prompt_position="top"<cr>
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>?k <cmd>Telescope keymaps<cr>
nnoremap <leader>Tc <cmd>Telescope colorscheme<cr>
nnoremap <leader>hc <cmd>Telescope command_history<cr>
nnoremap <leader>jj <cmd>Telescope jumplist<cr>
nnoremap <leader>mk <cmd>Telescope marks<cr>

" GIT
nnoremap <leader>g? <cmd>Telescope git_status<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gl <cmd>Telescope git_commits<cr>
nnoremap <leader>gst <cmd>Telescope git_stash<cr>

" for emojis
nnoremap <leader>ej <cmd>Telescope symbols<cr>

" LSP
" nnoremap <leader>ca <cmd>Telescope lsp_code_actions<cr>
nnoremap <leader>ce <cmd>Telescope lsp_document_diagnostics previewer=false<cr>
nnoremap <leader>cE <cmd>Telescope lsp_workspace_diagnostics previewer=false<cr>
nnoremap <leader>cs <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>cS <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>cT :lua require('telescope.builtin').treesitter()<CR>
nnoremap <leader>gr <cmd>Telescope lsp_references<cr>
nnoremap <leader>gD <cmd>Telescope lsp_definitions<cr>
nnoremap gi <cmd>Telescope lsp_implementations<cr>

