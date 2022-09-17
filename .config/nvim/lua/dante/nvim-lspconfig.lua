local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gH', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '[D', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<localleader>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_installer = require("nvim-lsp-installer")

-- ATTENTION PUTH ALL PATHS WITH \\ in WINDOWS
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "clangd" then
      opts.on_attach = on_attach
      opts.capabilities = capabilities
    elseif server.name == "omnisharp" then
      opts.on_attach = on_attach
      opts.capabilities = capabilities
    elseif server.name == "cmake" then
      opts.on_attach = on_attach
      opts.capabilities = capabilities
      opts.initial_options = {
        buildDirectory="build",
      }
    elseif server.name == "sumneko_lua" then
      opts.on_attach = on_attach
      opts.capabilities = capabilities
      opts.settings = {
        Lua = {
              runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
              },
              diagnostics = {
                globals = {'vim'},
              },
              workspace = {
                maxPreload = 100000,
                preloadFileSize = 100000,
                library = {
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/love2d"] = true,
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/Jass"] = false,
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/OpenResty"] = false,
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/example"] = false,
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/Cocos4.0"] = false,
                },
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            }
      }
    elseif server.name == "jdtls" then
      opts.on_attach = on_attach
      opts.capabilities = capabilities
      opts.filetypes = {'java'}
    elseif server.name == "tsserver" then
      opts.on_attach = on_attach
      opts.capabilities = capabilities
    else
      opts.on_attach = on_attach
      opts.capabilities = capabilities
    end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- virtual_text = {
      -- prefix = ">>",
      -- spacing = 2
    -- },
    virtual_text = false,
    checkCurrentLine = true,
    signs = true,
    update_in_insert = false,
  }
)


