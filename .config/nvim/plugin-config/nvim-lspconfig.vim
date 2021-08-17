lua << EOF
local nvim_lsp = require('lspconfig')
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

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { "pyright", "tsserver", "cssls", "html", "svls", "svelte", "dockerls", "diagnosticls", "gopls" }
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- for _, lsp in ipairs(servers) do
--     nvim_lsp[lsp].setup {
--         on_attach = function()
--             require'completion'.on_attach()
--             require'lsp_signature'.on_attach()
--             on_attach()
--         end,
--         capabilities = capabilities,
--     }
-- end

-- servers = html, css, typescript, svelte, bash
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
      on_attach = function()
          require'completion'.on_attach()
          require'lsp_signature'.on_attach()
          on_attach()
      end,
      capabilities = capabilities,
  }
end

EOF

" autocmd! CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })
