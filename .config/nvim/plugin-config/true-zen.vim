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
  },
  ataraxis = {
    just_do_it_for_me = true,
    keep_default_fold_fillchars = true,
    custome_bg = "",
    bg_configuration = true,
    affected_higroups = {NonText = {}, FoldColumn = {}, ColorColumn = {}, VertSplit = {}, StatusLine = {}, StatusLineNC = {}, SignColumn = {}}
  },
  misc = {
    ui_elements_commands = true
  },
  integrations = {
    nvim_bufferline = true,
    tmux = true,
    lualine = false
  }
})

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
