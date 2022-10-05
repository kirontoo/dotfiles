lua << EOF
local catppuccin = require("catppuccin")
vim.g.catppuccin_flavour = "mocha"
catppuccin.setup({
	integrations = {
		aerial = false,
		barbar = false,
		beacon = false,
		cmp = true,
		coc_nvim = false,
		dashboard = true,
		fern = true,
		fidget = false,
		gitgutter = true,
		gitsigns = true,
		hop = false,
		illuminate = false,
		leap = false,
		lightspeed = false,
		lsp_saga = true,
		lsp_trouble = true,
		markdown = true,
		mini = false,
		neogit = true,
		notify = true,
		nvimtree = false,
		overseer = false,
		pounce = false,
		symbols_outline = true,
		telekasten = false,
		telescope = true,
		treesitter = true,
		treesitter_context = false,
		ts_rainbow = false,
		vim_sneak = false,
		vimwiki = false,
		which_key = true,

		-- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
		dap = {
			enabled = false,
			enable_ui = false,
		},
	},
})
EOF

nnoremap <leader>TC :call CatTheme()<CR>

function! CatTheme()
    colorscheme catppuccin
    set background=dark
    let g:lualinescheme="catppuccin"
    call MyLualine('catppuccin')
endfunction

