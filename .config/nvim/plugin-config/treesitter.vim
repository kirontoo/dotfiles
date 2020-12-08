lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- Modules and its options go here
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = { enable = true },
	incremental_selection = { enable = true }, textobjects = { enable = true },
	indent = { enable = true }
}
EOF

set foldexpr=nvim_treesitter#foldexpr()
