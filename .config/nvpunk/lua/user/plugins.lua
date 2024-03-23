return {
	{ 'tpope/vim-surround' },
	{ 'tpope/vim-unimpaired' },
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-repeat' },
	{ 'tpope/vim-sleuth' },
	{ 'airblade/vim-rooter' },
	{ 'embark-theme/vim',    as = 'embark' },
	{
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
	},
	{ 'godlygeek/tabular' },
	{
		'iamcco/markdown-preview.nvim',
		run = function()
			vim.fn['mkdp#util#install']()
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		--   "BufReadPre path/to/my-vault/**.md",
		--   "BufNewFile path/to/my-vault/**.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "mindmap",
					path = "~/Documents/mindmap",
					overrides = {
						notes_subdir = "03-Resources"
					}
				},
			},
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function
				substitutions = {},
			},
			new_notes_location = "notes_subdir",
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				end
				return tostring(os.date('%Y%m%d%H%M', os.time())) .. suffix
			end,

			-- see below for full list of options 👇
		},
	}
}
