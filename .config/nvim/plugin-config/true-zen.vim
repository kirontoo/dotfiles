lua << EOF
local true_zen = require("true-zen")

true_zen.setup({
  modes = {
    ui = {
      bottom = {
        laststatus = 0,
        ruler = false,
        showmode = false,
        showcmd = false,
        cmdheight = 1,
      },
      top = {
        showtabline = 1,
      },
      left = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
      },
    },
    ataraxis = {
      left_padding = 32,
      right_padding = 32,
      top_padding = 1,
      bottom_padding = 1,
      ideal_writing_area_width = 120,
      just_do_it_for_me = true,
      keep_default_fold_fillchars = true,
      custome_bg = "",
      bg_configuration = true,
      affected_higroups = {NonText = {}, FoldColumn = {}, VertSplit = {}, StatusLine = {}, StatusLineNC = {}, SignColumn = {}}
    },
  },
  misc = {
    ui_elements_commands = true
  },
  integrations = {
    nvim_bufferline = true,
    tmux = true
  }
})

-- Dependency: folke/twilight
local twilight = require("twilight")

true_zen.after_mode_minimalist_on = function ()
  twilight.enable()
end

true_zen.after_mode_minimalist_off = function ()
  twilight.disable()
end

true_zen.after_mode_focus_on = function ()
  twilight.enable()
end

true_zen.after_mode_focus_off = function ()
  twilight.disable()
end

EOF

" Requirement: Plugin folke/twilight
" autocmd BufEnter TZAtaraxis lua require('twilight').enable()
" autocmd BufLeave TZAtaraxis lua require('twiglight').disable()

nnoremap <leader>tzh <cmd>TZLeft<cr>
nnoremap <leader>tzj <cmd>TZBottom<cr>
nnoremap <leader>tzk <cmd>TZTop<cr>
nnoremap <leader>tzm <cmd>TZMinimalist<cr>
nnoremap <leader>tzf <cmd>TZFocus<cr>
nnoremap <leader>tzx <cmd>TZAtaraxis<cr>
