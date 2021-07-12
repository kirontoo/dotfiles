"   __  .__
" _/  |_|  |__   ____   _____   ____   ______
" \   __\  |  \_/ __ \ /     \_/ __ \ /  ___/
"  |  | |   Y  \  ___/|  Y Y  \  ___/ \___ \
"  |__| |___|  /\___  >__|_|  /\___  >____  >
"            \/     \/      \/     \/     \/

" Default theme
colorscheme embark
set background=dark

" NOTE: needs to be called after colorcheme
syntax on

nnoremap <leader>Tl :call LightScheme()<CR>

function! LightScheme()
	set background=light
	let g:gruvbox_contrast_light='hard'
	" colorscheme solarized8_high
	colorscheme gruvbox
	" lua require('lualine').setup({ options = { theme = 'gruvbox_light' } })

lua <<EOF
local colors = require('lualine.themes.gruvbox_light')

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

require('lualine').setup({
options = {
  icons_enabled = true,
  theme = 'gruvbox_light',
  section_separators = {'', ''},
  component_separators = {'', ''},
},
sections = {
  lualine_a = {'mode'},
  lualine_b = {'filename'},
  lualine_c = { {
      'diagnostics',
      sources = {'nvim_lsp'},
      symbols = {error = ' ', warn = ' ', info = ' '},
      color_error = colors.insert.a.bg,
      color_warn = colors.visual.a.bg,
      color_info = colors.command.a.bg
    }
  },
  lualine_x = { {
      'diff',
      colored = true,
      symbols = {added = ' ', modified = '柳', removed = ' '},
      color_removed = colors.insert.a.bg,
      color_modified = colors.visual.a.bg,
      color_added = colors.replace.a.bg,
    },
    { 'encoding', condition = conditions.hide_in_width },
      {
        function()
          if vim.bo.expandtab
            then
            return '⯀ '..vim.bo.shiftwidth
          else
            return '⯈ '..vim.bo.tabstop
          end
        end,
      },
      'filetype',
    {
      -- Lsp server name .
      function()
        local msg = ''
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return msg end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return ' '..client.name
          end
        end
        return msg
      end,
      color = {fg = colors.normal.a.bg, gui = 'bold'},
      condition = conditions.hide_in_width
    }
  },
  lualine_y = {{ 'branch', condition = conditions.check_git_workspace }},
  lualine_z = {'location'}
  },
inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {'filename'},
  lualine_x = {'location'},
  lualine_y = {},
  lualine_z = {}
  },
tabline = {},
extensions = { 'nvim-tree', 'fugitive' }
})
EOF

endfunction

highlight Pmenu guibg=bg guifg=fg                       " popup menu colors
highlight Comment gui=NONE cterm=italic                 " italic comments
" highlight Normal gui=none
highlight NonText guibg=none
" highlight clear SignColumn                              " use number color for sign column color
" hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
" autocmd ColorScheme * highlight VertSplit cterm=NONE    " split color
" hi NonText guifg=bg                                     " mask ~ on empty lines
" hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=#ff7480 cterm=bold,undercurl          " misspelled words
