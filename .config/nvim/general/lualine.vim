lua <<EOF
local colors = require('lualine.themes.embark')

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
  theme = 'embark',
  -- section_separators = {'', ''},
  -- component_separators = {'', ''},
  section_separators = {'', ''},
  component_separators = {'│', '│'},
},
sections = {
  lualine_a = {'mode'},
  lualine_b = {{'filename', file_status = true, path = 1}},
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
        condition = conditions.hide_in_width
      },
    {
        'filetype',
        condition = conditions.hide_in_width
    },
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

