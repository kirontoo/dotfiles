lua << EOF

require('bufferline').setup ({
  options = {
    view = "multiwindow",
    numbers = function(opts)
      return string.format('%s'), opts.id
    end,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      -- return " ("..count..")"
      return " " .. icon .. count
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
    -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
  highlights = {
    fill = {
      guibg = '#2D2B40',
      guifg = '#A1EFD3'
    },
    background = {
      guibg = '#100e23',
      guifg = '#8a889d'
    },
    tab = {
      guibg = '#100e23',
      guifg = '#8a889d'
    },
    tab_selected = {
      guifg = '#63F2F1',
      guibg = '#1e1c32'
    },

    buffer_selected = {
      guifg = '#cbe3e7',
      guibg = '#1e1c32',
      gui = 'bold'
    },
    buffer_visible = {
      guibg = '#100e23',
      guifg = '#8a889d'
    },

    close_button= {
      guibg = '#100e23',
      guifg = '#8a889d'
    },
    close_button_selected = {
      guibg = '#1e1c32',
      guifg = '#8a889d'
    },
    close_button_visible = {
      guibg = '#100e23',
      guifg = '#8a889d'
    },

    diagnostic = {
      guifg = '#D4BFFF',
      guibg = '#100e23'
    },
    diagnostic_selected = {
      guifg = '#1e1c32',
      guibg = '#d4bfff',
    },
    diagnostic_visible = {
      guibg = '#100e23',
      guifg = '#d4bfff',
    },

    error_visible = {
      guifg = '#F48FB1',
      guibg = '#100e23'
    },
    error_selected = {
      guifg = '#1e1c32',
      guibg = '#F48FB1'
    },
    error_diagnostic = {
      guifg = '#F48FB1',
      guibg = '#100e23'
    },
    error_diagnostic_selected = {
      guifg = '#1e1c32',
      guibg = '#F48FB1',
    },
    error_diagnostic_visible = {
      guibg = '#100e23',
      guifg = '#F48FB1'
    },

    info_visible = {
      guifg = '#91DDFF',
      guibg = '#100e23'
    },
    info_selected = {
      guibg = '#1e1c32',
      guifg = '#91DDFF'
    },
    info_diagnostic = {
      guifg = '#91DDFF',
      guibg = '#100e23'
    },
    info_diagnostic_selected = {
      guibg = '#1e1c32',
      guifg = '#91DDFF',
    },
    info_diagnostic_visible = {
      guibg = '#100e23',
      guifg = '#91DDFF'
    },

    warning_visible = {
      guifg = '#FFE6B3',
      guibg = '#100e23'
    },
    warning_selected = {
      guifg = '#1e1c32',
      guibg = '#FFE6B3'
    },
    warning_diagnostic = {
      guifg = '#FFE6B3',
      guibg = '#100e23'
    },
    warning_diagnostic_selected = {
      guifg = '#1e1c32',
      guibg = '#FFE6B3',
    },
    warning_diagnostic_visible = {
      guibg = '#100e23',
      guifg = '#FFE6B3'
    },

    separator = {
      guibg = '#100e23',
      guifg = '#2D2B40'
    },
    separator_selected = {
      guibg = '#1e1c32',
      guifg = '#2D2B40'
    },
    separator_visible = {
      guibg = '#100e23',
      guifg = '#2D2B40'
    },

    pick = {
      guifg = '#100e23',
      guibg = '#62D196'
    },
    pick_selected = {
      guifg = '#1e1c32',
      guibg = '#FFE6B3'
    },
    pick_visible = {
      guifg = '#100e23',
      guibg = '#62D196'
    },
  }
})

EOF

nnoremap <silent><Tab>       <cmd>BufferLineCycleNext<CR>
nnoremap <silent><S-Tab>     <cmd>BufferLineCyclePrev<CR>
nnoremap <silent><leader>bn  <cmd>BufferLineCycleNext<CR>
nnoremap <silent><leader>bp  <cmd>BufferLineCyclePrev<CR>
" nnoremap <silent><leader>bd  <cmd>bd<CR>
nnoremap <silent><leader>bD  <cmd>%bd<bar>e#<CR>|                           "  delete all buffers but current and previous one
nnoremap <silent>gb          <cmd>BufferLinePick<CR>
nnoremap <silent><leader>bl  <cmd>BufferLineCloseRight<CR>
nnoremap <silent><leader>bh  <cmd>BufferLineCloseLeft<CR>
