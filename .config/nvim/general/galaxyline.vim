lua << EOF

local gl = require('galaxyline')
local gls = gl.section
local fileinfo = require('galaxyline.provider_fileinfo')
local condition = require('galaxyline.condition')

gl.short_line_list = {'NvimTree','vista','dbui','packer', 'startify'}

-- local schema = require('colors').schema

local colors = {
  section_bg = '#2d2b40',
  bg = '#100e23',
  fg = '#cbe3e7',
  grey = '#8A889D',

  orange = '#f2b482';
  yellow = '#ffe6b3';
  green  = '#a1efd3';
  cyan   = '#76dfeb';
  blue   = '#91ddff';
  red    = '#f48fb1';
  teal   = '#63f2f1';
  purple = '#d4bfff';
}

local mode_color_schema = {
  n = colors.teal,
  i = colors.red,
  c = colors.orange,
  V = colors.yellow,
  [''] = colors.yellow,
  v = colors.yellow,
  R = colors.green,
}

local mode_color = function()
  return mode_color_schema[vim.fn.mode()]
end

local icons = {
    sep = {
        right = "",
        left = ""
    },
    diagnostic = {
        error = " ",
        warn = " ",
        info = " "
    },
    diff = {
        add = " ",
        modified = " ",
        remove = " "
    },
    git = "",
    file = {
      read_only = '',
      modified = '',
    }
}

local white_space = function() return ' ' end

local function file_name(is_active, highlight_group)
  normal_fg = is_active and colors.fg or colors.grey
  modified_fg = is_active and colors.red or colors.orange
  if vim.bo.modifiable then
    if vim.bo.modified then
      vim.api.nvim_command('hi ' .. highlight_group .. ' guifg='.. modified_fg)
    else
      vim.api.nvim_command('hi ' .. highlight_group .. ' guifg='.. normal_fg)
    end
  end
  return fileinfo.get_current_file_name(icons.file.modified, icons.file.read_only)
end

-- --------------------------------------Left side-----------------------------------------------------------
local i = 1
gls.left[i] = {
  FirstElement = {
    provider = function()
      vim.api.nvim_command('hi GalaxyFirstElement guifg='..mode_color())
      return icons.sep.right
    end,
  },
}

i = i + 1
gls.left[i] = {
  Logo = {
    provider = function()
      vim.api.nvim_command('hi GalaxyLogo guibg='..mode_color())
      -- vim.api.nvim_command('hi GalaxyLogo guibg='..mode_color())
      return ' '
    end,
    -- separator = icons.sep.left,
    separator_highlight = {mode_color(), colors.bg},
    highlight = { colors.bg, colors.section_bg },
    -- highlight = { colors.bg, colors.bg},
  },
}

i = i + 1
gls.left[i] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg, colors.bg},
  }
}

i = i + 1
gls.left[i] = {
  ViMode = {
    provider = function()
      local alias = {
        n       = 'NORMAL',
        i       = 'INSERT',
        c       = 'COMMAND',
        V       = 'VISUAL',
        ['']  = 'VISUAL',
        v       = 'VISUAL',
        R       = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color()..' gui=bold')
      -- vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color()..' gui=bold')
      return ' '..alias[vim.fn.mode()].. ' '
    end,
    highlight = { colors.bg, colors.bg },
    -- separator = icons.sep.left,
    -- separator_highlight = {colors.bg, colors.section_bg},
  },
}

i= i + 1
gls.left[i] = {
  ViModeSep = {
    provider = function()
      -- vim.api.nvim_command('hi GalaxyViModeSep guifg='..mode_color()..' guibg='..colors.section_bg)
      vim.api.nvim_command('hi GalaxyViModeSep guibg='..colors.section_bg..' guifg='..colors.bg)
      -- return ' ' .. icons.sep.left
      return ' ' .. icons.sep.left .. ' '
    end,
  },
}

i = i + 1
gls.left[i] ={
  FileIcon = {
    provider = {white_space, 'FileIcon'},
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}

i = i + 1
gls.left[i] = {
  MyFileName = {
    provider = function() return file_name(true, 'GalaxyMyFileName') end,
    highlight = { colors.fg, colors.section_bg },
    separator = icons.sep.left .. ' ',
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

i = i + 1
gls.left[i] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = icons.diagnostic.error,
    highlight = {colors.red, colors.bg}
  }
}

i = i + 1
gls.left[i] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg, colors.bg},
  }
}

i = i + 1
gls.left[i] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = icons.diagnostic.warn,
    -- highlight = {schema.diag.warning.fg, colors.bg},
    highlight = {colors.yellow, colors.bg},
  }
}

i = i + 1
gls.left[i] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg, colors.bg},
  }
}

i = i + 1
gls.left[i] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = icons.diagnostic.info,
    -- highlight = {schema.diag.info.fg, colors.bg},
    highlight = {colors.teal, colors.bg},
  }
}

-- ------------------------------------Right side-----------------------------------------------------
j = 1

gls.right[j] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = '  ',
    highlight = {colors.fg,colors.bg,'bold'},
    separator_highlight = {colors.purple, colors.bg}
  }
}

j = j + 1
gls.right[j] = {
  DiffAdd = {
    provider = 'DiffAdd',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
  }
}

j = j + 1
gls.right[j] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange,colors.bg},
  }
}

j = j + 1
gls.right[j] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

j = j + 1
gls.right[j] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' ',
    highlight = {colors.cyan , colors.bg, 'bold'},
    -- separator = ' ',
    -- separator_highlight = { colors.bg, colors.bg },
  }
}

j = j + 1
gls.right[j] = {
  RightSep = {
    provider = function()
      vim.api.nvim_command('hi GalaxyRightSep guibg='..colors.bg)
    	return icons.sep.right
    end,
    highlight = { colors.section_bg, colors.bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.bg },
  }
}

j = j + 1
gls.right[j] = {
  RightSepSpace = {
    provider = function()
      vim.api.nvim_command('hi GalaxyRightSepSpace guibg='..colors.section_bg)
    	return ' '
    end,
  }
}

j = j + 1
gls.right[j] = {
	FileEncode = {
    provider = 'FileEncode',
    highlight = {colors.grey, colors.section_bg},
  }
}

j = j + 1
gls.right[j] = {
	FileFormat = {
    provider = function()
      local fileformat = vim.bo.fileformat
      if fileformat == 'unix' then
        return 'LF'
      else
        return 'CRLF'
      end
    end,
    condition = checkwidth,
    separator = "|",
    separator_highlight = {colors.grey, colors.section_bg},
    highlight = {colors.grey, colors.section_bg}
  }
}

j = j + 1
gls.right[j] = {
  RightSpace = {
    provider = function()
      vim.api.nvim_command('hi GalaxyRightSpace guibg='..colors.section_bg)
    	return ' '
    end,
    highlight = { colors.section_bg, colors.section_bg },
  }
}

j = j + 1
gls.right[j] = {
  TabOrSpace = {
    provider = function()
      if vim.bo.expandtab
      then
        return '⯀'
      else
        return '⯈'
      end
    end,
    condition = condition.hide_in_width,
    highlight = {colors.purple, colors.section_bg}
  }
}

j = j + 1
gls.right[j] = {
  Tabstop = {
    provider = function()
      if vim.bo.expandtab
      then
        return vim.bo.shiftwidth..' '
      else
        return vim.bo.tabstop..' '
      end
    end,
    condition = condition.hide_in_width,
    highlight = {colors.fg, colors.section_bg},
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.section_bg },
	}
}

j = j + 1
gls.right[j] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.fg, colors.section_bg },
    separator = '',
    separator_highlight = { colors.grey, colors.section_bg },
  },
}

j = j + 1
gls.right[j] = {
  LastElement = {
    provider = function()
      vim.api.nvim_command('hi GalaxyLastElement guifg='..mode_color())
      return icons.sep.left
    end,
  },
}

-- -------------------------Short status line---------------------------------------
local k = 1
gls.short_line_left[k] = {
  SFirstElement = {
    provider = function() return icons.sep.right end,
    highlight = { colors.grey, 'NONE' },
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.bg},
  },
}

k = k + 1
gls.short_line_left[k] ={
  SFileIcon = {
    provider = 'FileIcon',
    highlight = { colors.grey, colors.bg },
  },
}

k = k + 1
gls.short_line_left[k] = {
  SMyFileName = {
    provider = function() return file_name(false, 'GalaxySMyFileName') end,
    highlight = {colors.grey, colors.bg},
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.bg}
  }
}

k = k + 1
gls.short_line_right[k] = {
  SLastElement = {
    provider = function() return icons.sep.left end,
    highlight = { colors.grey, 'NONE' }
  },
}
EOF
