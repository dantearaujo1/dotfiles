local navic = require("nvim-navic")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

local options = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, options)
vim.keymap.set('n', '<localleader>q', vim.diagnostic.setloclist, options)

local signature_setup = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  verbose = false, -- show debug line number
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  noice = false, -- set to true if you using noice to render markdown
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  floating_window_off_x = 1, -- adjust float windows x position.
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "👉", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none, or a table of borders
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = ' ', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = 100, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = '<M-x>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

  select_signature_key = '<M-n>', -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

local on_attach = function(client, bufnr)
  require "lsp_signature".on_attach(signature_setup, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<localleader>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<localleader>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>DS', require('telescope.builtin').lsp_document_symbols, bufopts)
  vim.keymap.set('n', '<leader>WS', require('telescope.builtin').lsp_dynamic_workspace_symbols, bufopts)
  -- -- Workspace keymaps
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  vim.keymap.set('n', '<localleader>f', vim.lsp.buf.format, bufopts)
end

local MASON_LSP_DEFAULT_SETTINGS = {
  ensure_installed = {
    "emmet_language_server",
    "clangd",
    "rust_analyzer@nightly",
    "gopls",
    "clangd",
    "tailwindcss",
    "eslint",
  },
  automatic_installation = false,
}
require("mason").setup()
require("mason-lspconfig").setup(MASON_LSP_DEFAULT_SETTINGS)
require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ["clangd"] = function()
    require("lspconfig").clangd.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      require("clangd_extensions").setup()
    }
  end,
  ["html"] = function()
    require("lspconfig").html.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html" },
    }
  end,
  ["ltex"] = function()
    require("lspconfig").html.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "mail", "text" }
    }
  end,
  ["emmet_language_server"] = function()
    require("lspconfig").emmet_language_server.setup ({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "css", "html","javascript", "javascripreact", "less","sass","scss", "svelte","typescriptreact"},
        init_options = {
          --- @type table<string, any> https://docs.emmet.io/customization/preferences/
          preferences = {},
          --- @type "always" | "never" defaults to `"always"`
          showexpandedabbreviation = "always",
          --- @type boolean defaults to `true`
          showabbreviationsuggestions = true,
          --- @type boolean defaults to `false`
          showsuggestionsassnippets = true,
          --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
          syntaxprofiles = {},
          --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
          variables = {},
          --- @type string[]
          excludelanguages = {},
        },
    })
  end,
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup { }
  end,
  ["jdtls"] = function()
    -- require("java").setup()
    require("lspconfig").jdtls.setup { }
  end,
  ["omnisharp"] = function ()
  require("lspconfig").omnisharp.setup {
    cmd = { "dotnet", ".local/share/nvim/mason/packages/omnisharp-mono/omnisharp/OmniSharp.Extensions.LanguageServer.dll" },

    settings = {
      FormattingOptions = {
        -- Enables support for reading code style, naming convention and analyzer
        -- settings from .editorconfig.
        EnableEditorConfigSupport = true,
        -- Specifies whether 'using' directives should be grouped and sorted during
        -- document formatting.
        OrganizeImports = nil,
      },
      MsBuild = {
        -- If true, MSBuild project system will only load projects for files that
        -- were opened in the editor. This setting is useful for big C# codebases
        -- and allows for faster initialization of code navigation features only
        -- for projects that are relevant to code that is being edited. With this
        -- setting enabled OmniSharp may load fewer projects and may thus display
        -- incomplete reference lists for symbols.
        LoadProjectsOnDemand = nil,
      },
      RoslynExtensionsOptions = {
        -- Enables support for roslyn analyzers, code fixes and rulesets.
        EnableAnalyzersSupport = nil,
        -- Enables support for showing unimported types and unimported extension
        -- methods in completion lists. When committed, the appropriate using
        -- directive will be added at the top of the current file. This option can
        -- have a negative impact on initial completion responsiveness,
        -- particularly for the first few completion sessions after opening a
        -- solution.
        EnableImportCompletion = nil,
        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
        -- true
        AnalyzeOpenDocumentsOnly = nil,
      },
      Sdk = {
        -- Specifies whether to include preview versions of the .NET SDK when
        -- determining which version to use for project loading.
        IncludePrereleases = true,
      },
    },
  }
  end
}
require("mason-null-ls").setup({
  ensure_installed = {

  },
  handlers = {

  },
  automatic_installation = true
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- Anything not supported by mason
  },
})
