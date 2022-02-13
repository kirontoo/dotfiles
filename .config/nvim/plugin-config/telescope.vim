lua <<EOF

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

-- totally optional to use setup
require('telescope').setup ({
defaults = {
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
        height = 0.35,
        prompt_position = "top",
        mirror = false,
        preview_title = "",
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
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    file_ignore_patterns = { ".git", "node_modules" },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 10,
    border = {},
    -- borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
    borderchars = {
        "z",
        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
        results = { " " },
        -- results = { "a", "b", "c", "d", "e", "f", "g", "h" },
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└"},
    },
    show_line = false,
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  },

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
})

require("telescope").load_extension("session-lens")

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF

highlight TelescopeBorder         guifg=#a1efd3
highlight TelescopePromptBorder   guifg=#a1efd3
highlight TelescopeResultsBorder  guifg=#a1efd3
highlight TelescopePreviewBorder  guifg=#a1efd3

nnoremap <leader><space> <cmd>Telescope find_files hidden=true<cr>
" nnoremap <leader><space> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy(), {hidden=false})<cr>
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').file_browser(require('telescope.themes').get_ivy())<cr>
nnoremap <leader>ff <cmd>Telescope file_browser hidden=true<cr>
nnoremap <leader>fh <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ht <cmd>Telescope help_tags<cr>

" nnoremap <leader>, <cmd>Telescope buffers previewer=false layouts.prompt_position="top"<cr>
nnoremap <leader>, <cmd>Telescope buffers<cr>
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
nnoremap <leader>ce <cmd>Telescope diagnostics<cr>
" nnoremap <leader>cE <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>cs <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>cS <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>cT :lua require('telescope.builtin').treesitter()<CR>
nnoremap <leader>gr <cmd>Telescope lsp_references<cr>
nnoremap gD <cmd>Telescope lsp_definitions<cr>
nnoremap gi <cmd>Telescope lsp_implementations<cr>

