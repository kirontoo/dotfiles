lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = false,
        signs = true,
        severity_sort = true,
        underline = true,
    }
)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n",  "<leader>fc",  "<cmd>lua  vim.lsp.buf.formatting()<CR>",                                  opts)
    buf_set_keymap('n',  '<C-k>',      '<cmd>lua  vim.lsp.buf.signature_help()<CR>',                              opts)
    -- buf_set_keymap('n',  '<space>ca',  '<cmd>lua  vim.lsp.buf.code_action()<CR>',                                 opts)
    -- buf_set_keymap('n',  '<space>ch',  '<Cmd>lua  vim.lsp.buf.hover()<CR>',                                       opts)
    -- buf_set_keymap('n',  '<space>cr',  '<cmd>lua  vim.lsp.buf.rename()<CR>',                                      opts)
    -- buf_set_keymap('n',  'gD',         '<cmd>lua  vim.lsp.buf.type_definition()<CR>',                             opts)
    buf_set_keymap('n',  '<leader>wl',  '<cmd>lua  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',  opts)
    -- buf_set_keymap('n',  '[d',         '<cmd>lua  vim.lsp.diagnostic.goto_prev()<CR>',                            opts)
    -- buf_set_keymap('n',  ']d',         '<cmd>lua  vim.lsp.diagnostic.goto_next()<CR>',                            opts)
    buf_set_keymap('n',  'gd',         '<Cmd>lua  vim.lsp.buf.definition()<CR>',                                 opts)


  -- formatting
  -- if client.resolved_capabilities.document_formatting then
    -- vim.api.nvim_command [[augroup Format]]
    -- vim.api.nvim_command [[autocmd! * <buffer>]]
    -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    -- vim.api.nvim_command [[augroup END]]
  -- end

  --protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
    require'lsp_signature'.on_attach()
    --- require("aerial").on_attach(client, bufnr)
end

nvim_lsp.flow.setup {
  on_attach = on_attach
}

nvim_lsp.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities
    }

    server:setup(opts)
end)

EOF

" autocmd! CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })
" Auto format code
nnoremap <leader>ff <cmd>EslintFixAll<cr>

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
