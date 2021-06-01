lua <<EOF
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
    prompt_position = "bottom",
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { ".git", "node_modules" },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 10,
    width = 0.55,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
		borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
})
EOF

nnoremap <leader><space> <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>ff <cmd>Telescope file_browser hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ht <cmd>Telescope help_tags<cr>

nnoremap <leader>mk <cmd>Telescope marks<cr>
nnoremap <leader>?  <cmd>Telescope keymaps<cr>
nnoremap <leader>Tc <cmd>Telescope colorscheme<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>g? <cmd>Telescope git_status<cr>
nnoremap <leader>hc <cmd>Telescope command_history<cr>
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>, <cmd>Telescope buffers<cr>
" nnoremap <leader>gr :lua require('telescope.builtin').treesitter()<CR>
