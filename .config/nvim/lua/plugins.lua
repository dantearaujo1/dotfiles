local util = require('utils')
local execute = vim.api.nvim_command
local fn = vim.fn

return {
  --   -- ============ SYNTAX PLUGINS ==============================
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
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
    config = function()
      require('nvim-ts-autotag').setup()
    end,
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
  {
    'nvimtools/none-ls.nvim',
    event = "VeryLazy",
    opts = function()
      return require('dante/formatter') -- Formatter configurations plugins
    end,
  },
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
    'folke/neodev.nvim',
    event = "VeryLazy",
    ft = {"lua"},
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
        },
      })
    end
  },
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
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            position = "left",
          })
        end,
        desc = "Buffers (root dir)",
      }
    },
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true,
          }
        }
      })
    end
  },
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
  -- { 'ntpeters/vim-better-whitespace' }, -- Shows and trailling whitespace (TOO SLOW)
  { 'tommcdo/vim-exchange' }, -- Easy text exchange operator for Vim
  {
    'booperlv/nvim-gomove',
    config = function()
      require('gomove').setup {}
    end
  }, -- Move lines up and down
  { 'ggandor/leap.nvim' },
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
    "altermo/ultimate-autopair.nvim",
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
  {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    event = "VeryLazy",
    config = function()
      require('neogit').setup({})
    end
  },
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  -- { 'lewis6991/gitsigns.nvim' }, -- Super fast git decorations implemented purely in Lua/Teal
  {
    'sindrets/diffview.nvim',
    event = "VeryLazy",
    dependencies = 'nvim-lua/plenary.nvim',
  },                             -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  -- Java ========
  { 'mfussenegger/nvim-jdtls' }, -- Java JDTLS helpers
  -- Typescript ========
  {"neoclide/vim-jsx-improve"}, -- Synteax Highlight for jsx and Better indent to
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   ft = {
  --     "ts",
  --     "tsx",
  --     "js",
  --     "jsx",
  --     "javascript",
  --     "javascriptreact",
  --     "typescript",
  --     "typescriptreact"
  --   },
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  --   config = function()
  --     require("typescript-tools").setup {
  --       settings = {
  --         tsserver_file_preferences = {
  --           includeInlayParameterNameHints = "all",
  --           includeCompletionsForModuleExports = true,
  --           quotePreference = "auto",
  --         },
  --       }
  --     }
  --   end
  -- },
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
    'ellisonleao/glow.nvim',
    enabled = function() return util.getOS() == "Linux" end,
    config = true,
    event = "VeryLazy",
    cmd = "Glow",
  }, -- Preview Markdown files with :Glow
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn["mkdp#util#install"]() end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
  },
  -- LATEX
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup()
    end,
    lazy = true

  },
  { 'onsails/lspkind-nvim' },
  { 'ray-x/lsp_signature.nvim' },  -- for symbols in completion
  { 'ElPiloto/significant.nvim' }, -- Animate columnSigns
  -- {
  --   "glepnir/lspsaga.nvim",
  --   event = "BufRead",
  --   -- config = function()
  --   --     require("dante/lspsaga")
  --   -- end,
  --   dependencies = {
  --     { "nvim-tree/nvim-web-devicons" },
  --     { "nvim-treesitter/nvim-treesitter" }
  --   }
  -- },
  {
    "nacro90/numb.nvim",
    config = function()
      require('numb').setup()
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = "BufRead",
    config = function()
      require('ufo').setup()
    end
  },
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
        background_colour = "#000000"
      })
    end
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require('colorful-winsep').setup()
    end
  },
  { "shortcuts/no-neck-pain.nvim" },
  { "LunarVim/bigfile.nvim" },
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
  -- ICONS THEMES==================================================
  { 'ryanoasis/vim-devicons' },
  { 'yamatsum/nvim-web-nonicons' },
  { 'nvim-tree/nvim-web-devicons' },
  -- TREESITTER SUPORTED THEMES==================================================
  { 'luisiacc/gruvbox-baby',                       branch = 'main' },
  { 'Abstract-IDE/Abstract-cs', },
  { 'Mofiqul/vscode.nvim', },
  { 'ray-x/aurora', },
  { 'ofirgall/ofirkai.nvim', },
  { 'bluz71/vim-nightfly-guicolors', },
  { 'bluz71/vim-moonfly-colors', },
  { 'christianchiarulli/nvcode-color-schemes.vim', },
  { 'sainnhe/sonokai', },
  { 'sainnhe/gruvbox-material', },
  { 'sainnhe/edge', },
  { 'kyazdani42/blue-moon', },
  { 'mhartington/oceanic-next', },
  { 'Iron-E/nvim-highlite', },
  { 'nxvu699134/vn-night.nvim', },
  {
    'projekt0n/github-nvim-theme',
    event = "VeryLazy",
  },
  -- My Pluggins ===========================================================
  {
    '~/dev/projects/lua/neovim/project-creator',
    dev = true,
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    '~/dev/projects/lua/neovim/nepsAcademyIntegration',
    dev = true,
  },
  {
    '~/dev/projects/lua/neovim/nomodor',
    dev = true,
    enabled = function() return util.getOS() == "Linux" end
  },
  -- STATUS LINE PLUGINS ========================================================
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
    'preservim/vimux',
    enabled = function() return vim.fn.executable('tmux') end
  },

  --{ 'vimpostor/vim-tpipeline' }, Tmux status line with vim
  -- {
  --   'hermitmaster/nvim-kitty-navigator',
  --   build = './install',
  --   enabled = function() return not string.find(vim.fn.expandcmd('$TERM'), 'xterm-kitty')end,
  --   lazy = false,
  --   config = function()
  --     require('nvim-kitty-navigator').setup {}
  --   end
  -- },
  -- {
  --   'edluffy/hologram.nvim',
  --   enabled = function() return not string.find(vim.fn.expandcmd('$TERM'), 'xterm-kitty')end,
  --   config = function()
  --     require('hologram').setup {
  --       auto_display = true
  --     }
  --   end
  -- },

  {
    'nvim-neorg/neorg',
    tag = "v7.0.0",
    build = ":Neorg sync-parsers",
    keys = {"<localleader>ln"},
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
          }
        },
      }
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end
  },
}
