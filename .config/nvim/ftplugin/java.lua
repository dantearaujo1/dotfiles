local utils = require('utils')
local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = ''
local java_bin = ''
local runtime_one = {}
local runtime_two = {}
if utils.getOS() == 'Linux' then
  config_dir = jdtls_dir .. '/config_linux'
  java_bin = '/usr/bin/java'
  runtime_one =  { name = 'JavaSE-17' , path = '/usr/lib/jvm/java-17-openjdk-amd64/' }
  runtime_two = { name = 'JavaSE-11' , path = '/usr/lib/jvm/java-11-openjdk-amd64/' }
else
  config_dir = jdtls_dir .. '/config_win'
  runtime_one =  { name = '' , path = '' }
  runtime_two = { name = '' , path = '' }
  java_bin = ''
end

local plugins_dir = jdtls_dir .. '/plugins/'
local path_to_jar = plugins_dir .. 'org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local lombok_path = jdtls_dir .. "/lombok.jar"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. 'site/java/workspace-root/' .. project_name
os.execute("mkdir " .. workspace_dir)

-- Main Config
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    java_bin,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. lombok_path,
    '-Xms1G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', path_to_jar,
    '-configuration', config_dir,
    '-data', workspace_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      home = runtime_one.path,
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = runtime_two.name,
            path = runtime_two.path,
          }
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },

    },
    signatureHelp = { enabled = true },
    contentProvider = { preferred = 'fernflower'},
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org"
      },
    },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      hashCodeEquals = {
        useJava7Objects = true,
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {},
  },
}

config['on_attach'] = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>oi', ':lua require("jdtls").organize_imports()<CR>')
  vim.keymap.set('n', '<leader>jc', ':lua require("jdtls").compile("incremental")<CR>')
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<localleader>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<localleader>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, bufopts)
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
  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window_above_cur_line = false,
    padding = '',
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)

  vim.keymap.set('n', '<leader>ev', ':lua require("jdtls").extract_variable()<CR>', bufopts)
  vim.keymap.set('n', '<leader>ec', ':lua require("jdtls").extract_constant()<CR>', bufopts)
  vim.keymap.set('v', '<leader>em', ':lua require("jdtls").extract_method(true)<CR>', bufopts)
  vim.keymap.set('v', '<leader>ca', ':lua vim.lsp.buf.range_code_action()<CR>', bufopts)
end
--
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)


