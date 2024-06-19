local util = require('utils')
local execute = vim.api.nvim_command
local fn = vim.fn

return {
  --   -- ============ SYNTAX PLUGINS ==============================
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'RRethy/nvim-treesitter-endwise'
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    'HiPhish/nvim-ts-rainbow2',
  },
  {
    'windwp/nvim-ts-autotag',
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
  },
  {
    'David-Kunz/markid',
    event = "VeryLazy"
  }, -- Tree-sitter plugin for correct colors of parameters
  {
    'olrtg/nvim-emmet',
    config = function()
      vim.keymap.set({ "n", "v" }, '<localleader>a', require('nvim-emmet').wrap_with_abbreviation)
    end,
  },

  --   -- ============ DEBUGGER PLUGINS ==============================
  --   -- ============ REPL PLUGINS ==============================
  {
    'milanglacier/yarepl.nvim',
    event = "VeryLazy",
    config = true,
  },
  --   -- ============ LSP PLUGINS ==============================
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    ft = "dart",
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({})
    end
  },
  -- Stops LSP that are not used and clean RAM
  {
    'zeioth/garbage-day.nvim',
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
    }
  },
  -- Separate cut from delete registers
  -- {
  --   "gbprod/cutlass.nvim",
  --   event = "VeryLazy",
  --   opts = { cut_key = "x" },
  -- },
  {
    'theHamsta/nvim-dap-virtual-text',
  }, -- Virtual text showing variables info
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
	    "mfussenegger/nvim-dap","nvim-neotest/nvim-nio"
    }
  }, -- UI out of the box
  {
    'williamboman/mason.nvim',
  },
  --   -- ============ CODE STYLING ====================================
  -- {
  --   'stevearc/conform.nvim',
  --   opts = {},
  --   config = function()
  --     require("conform").setup({
  --       formatters_by_ft = {
  --         lua = { "stylua" },
  --         -- Conform will run multiple formatters sequentially
  --         python = { "isort", "black" },
  --         -- Use a sub-list to run only the first available formatter
  --         javascript = { { "prettierd", "prettier" } },
  --       },
  --     })
  --   end
  -- },
  {
    'nvimtools/none-ls.nvim',
    event = "VeryLazy",
    opts = function()
      return require('dante/formatter') -- Formatter configurations plugins
    end,
  },
  -- ========================================================================
  {
    'williamboman/mason-lspconfig.nvim',
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'mfussenegger/nvim-dap',
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
  },
  {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { "mistricky/codesnap.nvim", build = "make" },
  --   -- ============ SERVER PLUGINS ==============================
  {
    'barrett-ruth/live-server.nvim',
    event = "VeryLazy",
    enabled = function() return util.getOS() == "Linux" end,
    config = true,
  },
  --   -- ============ COMPLETION PLUGINS ============================
  {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
    dependencies = {
      {
        'hrsh7th/cmp-nvim-lsp',
      },
      {
        'hrsh7th/cmp-buffer',
      },
      {
        'hrsh7th/cmp-path',
      },
      {
        'hrsh7th/cmp-nvim-lua',
      },
      {
        'hrsh7th/cmp-calc',
      },
      {
        'hrsh7th/cmp-emoji',
      },
      {
        'kdheepak/cmp-latex-symbols',
        ft = {"latex","tex"}
      },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    build = "make install_jsregexp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "evesdropper/luasnip-latex-snippets.nvim",
      },
      {
        "nvim-cmp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
      },
    }
  },
  -- -- ============  TELESCOPE PLUGINS & EXTENSIONS  ==============================
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'cljoly/telescope-repo.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
      { 'nvim-telescope/telescope-symbols.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'tsakirist/telescope-lazy.nvim' },
      { 'tamago324/telescope-openbrowser.nvim' },
      { 'benfowler/telescope-luasnip.nvim' },
      {'LinArcX/telescope-env.nvim'},
      {'GustavoKatel/telescope-asynctasks.nvim'},
      {'nvim-telescope/telescope-live-grep-args.nvim'},
    }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  -- Terminal ==================================================================
  { 'akinsho/toggleterm.nvim',   branch = 'main', config = function() require("toggleterm").setup() end },
  { 'skywind3000/asyncrun.vim' },
  { 'skywind3000/asynctasks.vim' },
  -- Browser Navigation Plugins ==================================================
  {
    'xiyaowong/link-visitor.nvim',
    config = function()
      require('link-visitor').setup()
    end
  },
  {
    'tyru/open-browser.vim',
    event = "VeryLazy",
  },
  {
    'tyru/open-browser-github.vim',
    event = "VeryLazy",
    dependencies = {
      'tyru/open-browser.vim'
    }
  },
  -- Custom Pluggins =============================================================
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require 'oil'.setup()
    end,
  },
  {
    's1n7ax/nvim-window-picker',
    event = "VeryLazy",
    config = function()
      require 'window-picker'.setup()
    end,
  },
  { 'wesq3/vim-windowswap' }, -- Exchange Windows

  { 'folke/todo-comments.nvim' },
  -- The both plugin are for highligting indentation
  -- { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({})
    end
  },
  { 'arnamak/stay-centered.nvim' }, -- autocmds for always stay centered
  -- Bundle of mini modules [Using for mini-align]
  {
    'echasnovski/mini.nvim',
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
      },
    },
    config = function()
      require("mini.align").setup()
      require("mini.cursorword").setup()
      require("mini.ai").setup()
      require("mini.hipatterns").setup()
      require("mini.comment").setup({
        options = {
          custom_commentstring = function()
            return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
          end,
        },
      })
      -- require("mini.clue").setup() -- Using Hydra
      -- require("mini.indentscope").setup()
      -- require("mini.animate").setup()
    end,
  },
  { 'tommcdo/vim-exchange' }, -- Easy text exchange operator for Vim
  { 'ggandor/leap.nvim' },
  {
    "fedepujol/move.nvim",
    config = function()
      require('move').setup({
        line = {
            enable = true, -- Enables line movement
            indent = true  -- Toggles indentation
          },
          block = {
            enable = true, -- Enables block movement
            indent = true  -- Toggles indentation
          },
          word = {
            enable = true, -- Enables word movement
          },
          char = {
            enable = true -- Enables char movement
          }
      })
      local opts = { noremap = true, silent = true }
    end,
  },
  {
    'ggandor/flit.nvim',
    config = function()
      require('flit').setup({ labeled_modes = "nv" })
    end
  },
  { 'vim-scripts/ReplaceWithRegister' }, -- Replace with gr
  { 'foosoft/vim-argwrap' },             -- Strenght argument wrapping and unwrapping
  { 'AckslD/nvim-trevJ.lua', },          -- Opposite of J
  {
    'kylechui/nvim-surround',
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }, -- Change surroundings Not tpope anymore
  {
    'altermo/ultimate-autopair.nvim',
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      --Config goes here
    },
  },
  -- { 'windwp/nvim-autopairs' }, -- Auto close () [] {} <Tags>
  { 'bkad/camelcasemotion' },          -- Plugin for movin in camelcase with localleader
  { 'propet/toggle-fullscreen.nvim' }, -- Toggle fullScreen with <leader>z
  {
    'folke/zen-mode.nvim',
    event = "VeryLazy",
  }, -- Distraction Free
  {
    'folke/twilight.nvim',
    event = "VeryLazy",
  }, -- Dim buffers

  {
    'uga-rosa/ccc.nvim',
    keys={
      {"<leader>cc", "<cmd>CccPick<CR>",desc="Color picker"},
    },
    config = function()
      -- create hydras in here
      require('ccc').setup({
        ccc_option_highlighter_auto_enable = true,
      })
    end
  }, -- Color Picker
  {
    "nvimtools/hydra.nvim",
    config = function()
      -- create hydras in here
    end
  },

  -- Language Specifics ==========================================================
  -- Processing ========
  {
    'sophacles/vim-processing',
    ft = 'pde',
  }, -- Processing plugin helper
  -- LATEX ========
  -- The recomandations to use this plugin tells that
  -- it should be not lazy loaded
  {
    'lervag/vimtex',
    ft = "tex",
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    'matze/vim-tex-fold',
    ft = "tex",
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    'aspeddro/pandoc.nvim',
    event = "VeryLazy",
    config = function()
      require 'pandoc'.setup()
    end
  },
  -- HTTP ========
  {
    'BlackLight/nvim-http',
    keys = {
      {"<localleader>r",
    ":Http<CR>",
  desc = "Executes http request from http file"}
    },
    ft = "http",
  }, -- Run HTTP request directly in your editor
  -- JSON ========
  {
    'gennaro-tedesco/nvim-jqx',
    event = "VeryLazy",
  }, -- Browse and preview json files
  -- GIT ========
  {'ThePrimeagen/git-worktree.nvim'},
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('harpoon').setup({})
      vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<leader>ha", function() harpoon.list():add() end)
    end
  },
  {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    event = "VeryLazy",
    config = function()
      require('neogit').setup({})
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup{

      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)
        map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hu', gitsigns.undo_stage_hunk)
        map('n', '<leader>hR', gitsigns.reset_buffer)
        map('n', '<leader>hp', gitsigns.preview_hunk)
        map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>hd', gitsigns.diffthis)
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
        map('n', '<leader>td', gitsigns.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
      }
    end
  }, -- Super fast git decorations implemented purely in Lua/Teal
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },                             -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  -- Java ========
  { 'mfussenegger/nvim-jdtls' }, -- Java JDTLS helpers
  -- Typescript ========
  { 'neoclide/vim-jsx-improve' }, -- Synteax Highlight for jsx and Better indent to
  -- C++ ========
  { 'p00f/clangd_extensions.nvim' }, -- C++ clangd lsp defaults
  {
    'madskjeldgaard/cppman.nvim',    -- Interface for the cppman cli tool
    event = "VeryLazy",
    dependencies = {
      { 'MunifTanjim/nui.nvim' }
    },
    enabled = function() return util.getOS() == "Linux" end,
    config = function()
      local cppman = require "cppman"
      cppman.setup()
      vim.keymap.set("n", "<leader>cm", function() cppman.open_cppman_for(vim.fn.expand("<cword>")) end)
      vim.keymap.set("n", "<leader>cn", function() cppman.input() end)
    end

  },
  -- DATABASE Specifics =========================================================
  { 'tpope/vim-dadbod' }, -- Vim plugin to interact with databases {Mongo,JQ,Postgre}
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  { 'kristijanhusak/vim-dadbod-completion' }, -- Completion for dadbod
  -- CLI Pluggins ===============================================================
  -- {
  --   'ianding1/leetcode.vim',
  --   event = "VeryLazy",
  --   lazy = true,
  -- },
  -- UI Pluggins ===========================================================
  -- PREVIEWERS
  -- MARKDOWN
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn["mkdp#util#install"]() end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
  },
  -- LATEX

  -- BUFFERS
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    -- lazy = true
  },
  { 'onsails/lspkind-nvim' },
  { 'ray-x/lsp_signature.nvim' },  -- for symbols in completion
  {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
    },
    event = "LspAttach",
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = "BufRead",
    config = function()
      require('ufo').setup()
    end
  },
  -- { 'ElPiloto/significant.nvim' }, -- Animate columnSigns Nothing good with this
  {
    'luukvbaal/statuscol.nvim',
    config = function()
      local builtin = require("statuscol.builtin")
      require('statuscol').setup(
        {
          relculright = true,
          segments = {
            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
            { text = { "%s" },                  click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" }
          },
          -- foldfunc = "builtin",
          -- setopt = true
        }
      )
    end
  },
  {
    'j-hui/fidget.nvim',
    tag = "legacy",
    config = function()
      require('fidget').setup({
        sources = {
          ["jdtls"] = {
            ignore = true,
          },
        },
      })
    end
  }, -- Lsp progress handler
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end
  },
  {
    'rcarriga/nvim-notify',
    lazy = false,
    priority = 1000,
    config = function()
      require('notify').setup({
        background_colour = "#FFFFFF88"
      })
    end
  },
  {
    'nvim-zh/colorful-winsep.nvim',
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require('colorful-winsep').setup()
    end
  },
  { 'shortcuts/no-neck-pain.nvim' },
  { 'LunarVim/bigfile.nvim' },
  -- THEMES =====================================================================
  -- Dashboard ===========================
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = {
    }
  },
  -- ColorColumn ===========================
  { 'xiyaowong/virtcolumn.nvim' },
  { 'm4xshen/smartcolumn.nvim' },
  -- {
  --   'mawkler/modicator.nvim',
  --   init = function()
  --     -- These are required for Modicator to work
  --     vim.o.cursorline = true
  --     vim.o.number = true
  --     vim.o.termguicolors = true
  --   end,
  --   opts = {
  --     -- Warn if any required option above is missing. May emit false positives
  --     -- if some other plugin modifies them, which in that case you can just
  --     -- ignore. Feel free to remove this line after you've gotten Modicator to
  --     -- work properly.
  --     show_warnings = true,
  --   }
  -- },
  -- ICONS THEMES==================================================
  { 'ryanoasis/vim-devicons' },
  { 'yamatsum/nvim-web-nonicons' },
  { 'nvim-tree/nvim-web-devicons' },
  -- TREESITTER SUPORTED THEMES==================================================
  {
      "vague2k/huez.nvim",
      -- if you want registry related features, uncomment this
      branch = "stable",
      event = "UIEnter",
      import = "huez-manager.import",
      config = function()
          require("huez").setup({})
      end,
  },
  -- My Pluggins ===========================================================
  {
    '~/dev/projects/lua/neovim/project-creator',
    dev = true,
    enabled = function() return util.getOS() == "Linux" end
  },
  -- {
  --   '~/dev/projects/lua/neovim/nepsAcademyIntegration',
  --   dev = true,
  -- },
  -- {
  --   '~/dev/projects/lua/neovim/nomodor',
  --   dev = true,
  --   enabled = function() return util.getOS() == "Linux" end
  -- },
  -- STATUS LINE PLUGINS ========================================================
  {'pysan3/pathlib.nvim'},
  { 'nvim-lualine/lualine.nvim' },
  {
    'SmiteshP/nvim-navic',
    dependencies = "neovim/nvim-lspconfig",
  },
  {
    'christoomey/vim-tmux-navigator',
    -- enabled = function() return util.getOS() == 'Linux' end
    enabled = function() return not (vim.fn.executable('tmux') and string.find(vim.fn.expandcmd('$TERM'), 'xterm-kitty')) end
  },
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
  {
    'preservim/vimux',
    enabled = function() return vim.fn.executable('tmux') end
  },
  --{ 'vimpostor/vim-tpipeline' }, Tmux status line with vim
  -- AI PLUGINS ================================================================
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    config = function ()
      local chat = require("CopilotChat")
      chat.setup{
        prompts = {
          Explain = {
              mapping = '<leader>ae',
              description = 'AI Explain',
          },
          Review = {
              mapping = '<leader>ar',
              description = 'AI Review',
          },
          Tests = {
              mapping = '<leader>at',
              description = 'AI Tests',
          },
          Fix = {
              mapping = '<leader>af',
              description = 'AI Fix',
          },
          Optimize = {
              mapping = '<leader>ao',
              description = 'AI Optimize',
          },
          Docs = {
              mapping = '<leader>ad',
              description = 'AI Documentation',
          },
          CommitStaged = {
              mapping = '<leader>ac',
              description = 'AI Generate Commit',
          },
        }
      }
      require("copilot").setup{{}}
      vim.keymap.set({ 'n', 'v' }, '<leader>ai', chat.toggle, { desc = 'AI Toggle' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ax', chat.reset, { desc = 'AI Reset' })
    end
    -- See Commands section for default commands if you want to lazy load on them
  },
  -- NOTE TAKING PLUGINS =======================================================
  {
    'nvim-neorg/neorg',
    tag = "v7.0.0",
    build = ":Neorg sync-parsers",
    keys = {"<localleader>ln"},
    dependencies = {
      {"nvim-neorg/neorg-telescope"}
    },
    ft = "norg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                study = "~/Notes/study",
                work = "~/Notes/work",
                prog = "~/Notes/prog",
              },
              default_workspace = "prog",
            }
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
              name = "[Neorg]",
            },
          },
          ["core.keybinds"]={
            config = {
              hook = function(keybinds)
                keybinds.map("norg","n","<localleader>c", '<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>')
              end
            }
          },
          ["core.integrations.telescope"] = {},
        },
      }
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
      local neorg_callbacks = require("neorg.core.callbacks")

      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
          -- Map all the below keybinds only when the "norg" mode is active
          keybinds.map_event_to_mode("norg", {
              n = { -- Bind keys in normal mode
                  { "<C-s>", "core.integrations.telescope.find_linkable" },
              },

              i = { -- Bind in insert mode
                  { "<C-l>", "core.integrations.telescope.insert_link" },
              },
          }, {
              silent = true,
              noremap = true,
          })
      end)
    end
  },
}

