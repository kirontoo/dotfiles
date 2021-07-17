lua << EOF
require('session-lens').setup({
  prompt_title = 'CHANGE SESSION',
  path_display = {'shorten'},
  layout_strategy = "bottom_pane",
  theme_conf = {
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      -- results = { "a", "b", "c", "d", "e", "f", "g", "h" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└"},
      },
    },
  previewer = true
})
EOF

nnoremap <leader>st <cmd>SearchSession<CR>
