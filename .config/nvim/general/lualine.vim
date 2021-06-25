lua <<EOF
local colors = require('lualine.themes.embark')
require('lualine').setup({
options = {
  icons_enabled = true,
  theme = 'embark',
  section_separators = {'', ''},
  component_separators = {'', ''}
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
      -- Is it me or the symbol for modified us really weird
      colored = true,
      symbols = {added = ' ', modified = '柳', removed = ' '},
      color_removed = colors.insert.a.bg,
      color_modified = colors.visual.a.bg,
      color_added = colors.replace.a.bg,
    },
    'encoding', 'bo:shiftwidth','fileformat', 'filetype'
  },
  lualine_y = {'branch'},
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
extensions = {}
})
EOF
