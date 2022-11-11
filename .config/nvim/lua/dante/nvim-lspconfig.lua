local navic = require("nvim-navic")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

local options = { noremap=true, silent=true  }
vim.keymap.set('n', '[d', vim.diagnostic.goto_next, options)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, options)
vim.keymap.set('n', '<localleader>d', vim.diagnostic.open_float, options)
vim.keymap.set('n', '<localleader>q', vim.diagnostic.setloclist, options)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  if client.server_capabilities.documentSymbolProvider then
      navic.attach(client,bufnr)
  end
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<localleader>d', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<localleader>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<localleader>h', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, bufopts)
  -- -- Workspace keymaps
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  vim.keymap.set('n', '<localleader>f', vim.lsp.buf.format, bufopts)
end

local MASON_LSP_DEFAULT_SETTINGS = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {'tsserver','sumneko_lua','clangd'},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
}
require("mason").setup()
require("mason-lspconfig").setup(MASON_LSP_DEFAULT_SETTINGS)
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
    ["sumneko_lua"] = function ()
        require("lspconfig").sumneko_lua.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
              },
              diagnostics = {
                globals = {'vim','use', 'require'},
              },
              workspace = {
                -- maxPreload = 100000,
                -- preloadFileSize = 100000,
                library = {
                  vim.api.nvim_get_runtime_file("",true),
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/love2d"] = true,
                  -- [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/Jass"] = false,
                  -- [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/OpenResty"] = false,
                  -- [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/example"] = false,
                  -- [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/Cocos4.0"] = false,
                },
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            }
          }
        }
    end
}



vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- virtual_text = {
    --   prefix = ">>",
    --   spacing = 2
    -- },
    virtual_text = false,
    checkCurrentLine = true,
    signs = true,
    update_in_insert = false,
 }
)


