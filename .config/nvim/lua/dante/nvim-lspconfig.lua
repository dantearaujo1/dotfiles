local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.documentationFormat = {'markdown', 'plaintext'}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- print("Entered buffer: " .. bufnr)
  -- print("Server is: " .. client.name)

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gH', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', 'gsd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- -- These are Lspsaga keymappings that overwrite normal lsp bindings
  -- buf_set_keymap('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
  -- buf_set_keymap('v', '<leader>ca', '<c-u>Lspsaga code_action<CR>', opts)
  -- buf_set_keymap('n', '<leader>gd', ':Lspsaga preview_definition<cr>', opts)
  -- buf_set_keymap('n', '<leader>e', ':Lspsaga show_line_diagnostics<cr>', opts)
  -- buf_set_keymap('n', '<leader>ec', ':Lspsaga show_cursos_diagnostics<cr>', opts)
  -- buf_set_keymap('n', '<leader>rn', ':Lspsaga rename<cr>', opts)
  -- buf_set_keymap('n', '<leader>gf', ':Lspsaga lsp_finder<cr>', opts)
  -- buf_set_keymap('n', '<leader>gh', ':Lspsaga hover_doc<cr>', opts)
  -- buf_set_keymap('n', '<leader>[d', ':Lspsaga diagnostic_jump_next<CR>', opts)
  -- buf_set_keymap('n', '<leader>]d', ':Lspsaga diagnostic_jump_prev<CR>', opts)


  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

 -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)

    -- Show diagnostics to popup diagnostic
    -- nvim_command('autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()')

  end

end

local lsp_installer = require("nvim-lsp-installer")

-- ATTENTION PUTH ALL PATHS WITH \\ in WINDOWS
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "clangd" then
      opts.on_attach = on_attach
      opts.capabilities = capabilities
    --   opts.cmd = {
    --     "D:\\Code\\Configurations\\nvim\\nvim-data\\lsp_servers\\clangd\\clangd\\bin\\clangd.exe",
    --     "--background-index",
    --     "--pch-storage=memory",
    --     "--clang-tidy",
    --     "--query-driver=D:\\Code\\Compilers\\TDM-GCC-64\\bin\\gcc.exe",
    --     "--resource-dir=D:\\Code\\Compilers\\TDM-GCC-64\\lib\\gcc\\x86_64-w64-mingw32\\10.3.0\\",
    -- }
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
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
              },
              workspace = {
                maxPreload = 100000,
                preloadFileSize = 100000,
                -- Make the server aware of Neovim runtime files
                -- library = vim.api.nvim_get_runtime_file("", true),
                library = {
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/love2d"] = true,
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/Jass"] = false,
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/OpenResty"] = false,
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/example"] = false,
                  [vim.fn.expand"~/nvim/nvim-data/lsp_servers/sumneko_lua/extension/server/meta/3rd/Cocos4.0"] = false,
                },
                checkThirdParty = false,
              },
              -- Do not send telemetry data containing a randomized but unique identifier
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
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

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


