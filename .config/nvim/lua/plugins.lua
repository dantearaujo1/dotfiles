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
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { keymaps = {useDefault = true} },
  },
  {
    'HiPhish/nvim-ts-rainbow2',
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
        require('nvim-ts-autotag').setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true
            }
        })
    end
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
    -- ============ CODE STYLING ====================================
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
    'nvitools/none-ls.nvim',
    event = "VeryLazy",
  },
  {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
      },
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
    "olacin/telescope-gitmoji.nvim",
    config = function()
        require("telescope").load_extension("gitmoji")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
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
  -- Utils Pluggins =============================================================
  {
    "OXY2DEV/helpview.nvim",
    lazy = false
  },
  -- {
  --   'cche/todo-txt.nvim',
  --   dependencies = {
  --       'hrsh7th/nvim-cmp'
  --   },
  --   config = function()
  --       require('todo-txt').setup()
  --   end
  -- },
  -- {
  --   'arnarg/todotxt.nvim',
  --   dependencies = {'MunifTanjim/nui.nvim'},
  -- },
  {
      "jake-stewart/multicursor.nvim",
      branch = "1.0",
      config = function()
          local mc = require("multicursor-nvim")

          mc.setup()

          local set = vim.keymap.set

          -- Add or skip cursor above/below the main cursor.
          set({"n", "v"}, "<up>",
              function() mc.lineAddCursor(-1) end)
          set({"n", "v"}, "<down>",
              function() mc.lineAddCursor(1) end)
          set({"n", "v"}, "<localleader><up>",
              function() mc.lineSkipCursor(-1) end)
          set({"n", "v"}, "<localleader><down>",
              function() mc.lineSkipCursor(1) end)

          -- Add or skip adding a new cursor by matching word/selection
          set({"n", "v"}, "<localleader>n",
              function() mc.matchAddCursor(1) end)
          set({"n", "v"}, "<localleader>s",
              function() mc.matchSkipCursor(1) end)
          set({"n", "v"}, "<localleader>N",
              function() mc.matchAddCursor(-1) end)
          set({"n", "v"}, "<localleader>S",
              function() mc.matchSkipCursor(-1) end)

          -- Add all matches in the document
          set({"n", "v"}, "<localleader>A", mc.matchAllAddCursors)

          -- You can also add cursors with any motion you prefer:
          -- set("n", "<right>", function()
          --     mc.addCursor("w")
          -- end)
          -- set("n", "<leader><right>", function()
          --     mc.skipCursor("w")
          -- end)

          -- Rotate the main cursor.
          set({"n", "v"}, "<left>", mc.nextCursor)
          set({"n", "v"}, "<right>", mc.prevCursor)

          -- Delete the main cursor.
          set({"n", "v"}, "<localleader>x", mc.deleteCursor)

          -- Add and remove cursors with control + left click.
          set("n", "<c-leftmouse>", mc.handleMouse)

          -- Easy way to add and remove cursors using the main cursor.
          set({"n", "v"}, "<c-q>", mc.toggleCursor)

          -- Clone every cursor and disable the originals.
          set({"n", "v"}, "<localleader><c-q>", mc.duplicateCursors)

          set("n", "<esc>", function()
              if not mc.cursorsEnabled() then
                  mc.enableCursors()
              elseif mc.hasCursors() then
                  mc.clearCursors()
              else
                  -- Default <esc> handler.
              end
          end)

          -- bring back cursors if you accidentally clear them
          set("n", "<localleader>gv", mc.restoreCursors)

          -- Align cursor columns.
          set("n", "<localleader>a", mc.alignCursors)

          -- Split visual selections by regex.
          set("v", "S", mc.splitCursors)

          -- Append/insert for each line of visual selections.
          set("v", "I", mc.insertVisual)
          set("v", "A", mc.appendVisual)

          -- match new cursors within visual selections by regex.
          set("v", "M", mc.matchCursors)

          -- Rotate visual selection contents.
          set("v", "<localleader>t",
              function() mc.transposeCursors(1) end)
          set("v", "<localleader>T",
              function() mc.transposeCursors(-1) end)

          -- Jumplist support
          set({"v", "n"}, "<c-i>", mc.jumpForward)
          set({"v", "n"}, "<c-o>", mc.jumpBackward)

          -- Customize how cursors look.
          local hl = vim.api.nvim_set_hl
          hl(0, "MultiCursorCursor", { link = "Cursor" })
          hl(0, "MultiCursorVisual", { link = "Visual" })
          hl(0, "MultiCursorSign", { link = "SignColumn"})
          hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
          hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
          hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
      end
  },
  {
    "phrmendes/todotxt.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("todotxt").setup({
            todotxt = "/home/dante/todo.txt",
            donetxt = "/home/dante/done.txt",
        })
    end
  },
  {
    "mizlan/iswap.nvim",
    event = "VeryLazy"
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup()
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show Harpoon Menu" })
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add File to Harpoon" })
      vim.keymap.set("n", "<leader>hj", function() harpoon:list():next() end, { desc = "Go to the next File on Harpoon" })
      vim.keymap.set("n", "<leader>hk", function() harpoon:list():prev() end, { desc = "Go to the previous File on Harpoon" })
      vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Select entry (1)" })
      vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Select entry (2)" })
      vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Select entry (3)" })
      vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Select entry (4)" })
    end
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
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
  {
    'wesq3/vim-windowswap',
    event = "VeryLazy",
  }, -- Exchange Windows
  {
    'folke/todo-comments.nvim',
  },
  {
      "atiladefreitas/dooing",
      config = function()
          require("dooing").setup({
              -- your custom config here (optional)
          })
      end,
  },
  -- The both plugin are for highligting indentation
  -- { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({})
    end
  },
  {
    'arnamak/stay-centered.nvim',
    config = function()
      require('stay-centered') -- Always make text centered
    end
  }, -- autocmds for always stay centered
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
      -- require("mini.animate").setup()
      require("mini.ai").setup()
      require("mini.hipatterns").setup()
      require("mini.indentscope").setup()
      require("mini.comment").setup({
        options = {
          custom_commentstring = function()
            return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
          end,
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      preset = "helix",
      icons = {
          breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
          separator = "➜", -- symbol used between a key and it's label
          group = " ", -- symbol prepended to a group
          ellipsis = "…",
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    'tommcdo/vim-exchange',
  }, -- Easy text exchange operator for Vim
  {
    'ggandor/leap.nvim',
    -- Flit requires this
    -- config = function()
    --   require('leap').create_default_mappings()
    -- end
  },
  {
    "hinell/duplicate.nvim",
  },
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
  {
    'vim-scripts/ReplaceWithRegister',
  }, -- Replace with gr
  {
    'foosoft/vim-argwrap',
  },             -- Strenght argument wrapping and unwrapping
  {
    'AckslD/nvim-trevJ.lua',
  },          -- Opposite of J
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
  {
    'bkad/camelcasemotion',
  },          -- Plugin for movin in camelcase with localleader
  {
    'propet/toggle-fullscreen.nvim',
    event = "VeryLazy",
  }, -- Toggle fullScreen with <leader>z
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
  -- {
  --   "nvimtools/hydra.nvim",
  -- },

  -- Language Specifics ==========================================================
  -- Documentation ---------------------------------------------------------------
  {
    "kkoomen/vim-doge",
    config = function ()
      vim.g.doge_enable_mappings = 0
      vim.g.doge_mappings = '<Leader>dg'
      vim.g.doge_filetype_aliases = {
        javascript = { 'javascript.jsx','javascriptreact','javascript.tsx' }
      }
    end
  }, -- Create documentation with leader dg
  -- Processing ------------------------------------------------------------------
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
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   config = true,
  --   opts = {
  --     rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
  --   }
  -- },
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     require("rest-nvim").setup()
  --   end,
  -- },
  -- JSON ========
  {
    'gennaro-tedesco/nvim-jqx',
    event = "VeryLazy",
  }, -- Browse and preview json files
  -- GIT ========
  -- lazy.nvim
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = true,
  },
  {
    "moyiz/git-dev.nvim",
    event = "VeryLazy",
    keys = {
        {
          "<leader>go",
          function()
            local repo = vim.fn.input "Repository name / URI: "
            if repo ~= "" then
              require("git-dev").open(repo)
            end
          end,
          desc = "[O]pen a remote git repository",
        }
    },
    opts = {},
  },

  {
    "dlvhdr/gh-blame.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>gh", "<cmd>GhBlameCurrentLine<cr>", desc = "GitHub Blame Current Line" },
    },
  },
  {
    "Juksuu/worktrees.nvim",
    config = function()
        require("worktrees").setup()
    end,
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
  },-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.

  -- Java ========

  -- {
  --   'mfussenegger/nvim-jdtls',
  --   ft = 'java',
  -- }, -- Java JDTLS helpers

    -- [1] Up and Running Java
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
    opts = {
      notifications = {
        dap = false,
      }
    },
  },
  -- {
  --   "JavaHello/spring-boot.nvim",
  --   ft = "java",
  --   dependencies = {
  --     "nvim-java/nvim-java", -- or nvim-java, nvim-lspconfig
  --   },
  -- },

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
  {
    "ramilito/kubectl.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require("kubectl").setup()
      vim.keymap.set("n", "<leader>kk", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true , desc = "Toggler Kubectl"})
    end,
  },
  -- UI Pluggins ===========================================================
  -- {
  --   "sphamba/smear-cursor.nvim",
  --   opts = {},
  -- }, -- This will make the cursor more animated
  -- PREVIEWERS
  -- MARKDOWN
  {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
        -- You will not need this if you installed the
        -- parsers manually
        -- Or if the parsers are in your $RUNTIMEPATH
        "nvim-treesitter/nvim-treesitter",

        "nvim-tree/nvim-web-devicons"
    }
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
  -- {
  --   'ray-x/lsp_signature.nvim',
  --   event = "VeryLazy",
  --   opts = {},
  --   config = function(_, opts) require("lsp_signature").setup(opts) end
  -- },  -- for symbols in completion
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require("dante/lspsaga")
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
        background_colour = "#55555500"
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
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup({
        extra_groups = {
          "FoldColumn",
          "lualine_b_normal",
          "lualine_x_filetype_DevIconLua_normal",
          "lualine_x_filetype_DevIconJs_normal",
          "lualine_x_filetype_DevIconDefault_normal",
          "lualine_c_normal",
          "StatusLine",
          "CmpItemAbbr",
          "CmpDocumentationBorder",
          "CmpDocumentation",
          "NotifyBackground",
          "LspFloatWinNormal",
          "SagaBorder",
          "SagaNormal",
          "TelescopeNormal",
          "TelescopeResultsTitle",
          "TelescopePromptNormal",
          "TelescopePromptPrefix",
          "TelescopeBorder",
          "TelescopePromptBorder",
          -- "Normal",
          -- "FloatBorder",
          -- "NormalFloat",
        },
        exclude_groups = {
          'WhichKeyTitle'
        }
      })
    end
  },
  { 'shortcuts/no-neck-pain.nvim' },
  {
    'LunarVim/bigfile.nvim',
    config = function()
      require('bigfile').setup()
    end
  },
  -- THEMES =====================================================================
  -- Dashboard ===========================
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
      { 'juansalvatore/git-dashboard-nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    config = function()
      require('dante/dashboard')
    end
  },
  -- ColorColumn ===========================
  { 'xiyaowong/virtcolumn.nvim' },
  {
    'm4xshen/smartcolumn.nvim',
    config = function()
      require('dante/smartcolumn')
    end
  },
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
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end
  },
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
  -- {
  --   '~/dev/projects/lua/neovim/project-creator',
  --   dev = true,
  --   enabled = function() return util.getOS() == "Linux" end
  -- },
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
    enabled = function() return vim.fn.executable('tmux') end,
    config = function ()
      vim.g.VimuxOrientation = "v"
    end
  },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },
  --{ 'vimpostor/vim-tpipeline' }, Tmux status line with vim
  -- AI PLUGINS ================================================================
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function ()
      local chat = require("CopilotChat")
      chat.setup{
        debug = false, -- Enable debugging
        show_help = "yes",
        disable_extra_info = 'no',
        window = {
          layout = 'float',
        },
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
        },
        mappings = {
          submit_prompt = {
            normal = '<CR>',
            insert = '<C-m>'
          }
        }
      }
      require("copilot").setup{{
        suggestions = {
          auto_trigger = true,
        },
        cmp = {
          enabled = false,
        },
        panel = {
          enabled = false,
        },
        filetypes = {
          markdown = false,
        },
        server_opts_overrides = {
          settings = {
            advanced = {
              inlineSuggestionCount = 3,
            },
          },
        },
      }}
      vim.keymap.set({ 'n', 'v' }, '<leader>ai', chat.toggle, { desc = 'AI Toggle' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ax', chat.reset, { desc = 'AI Reset' })
      vim.keymap.set({ 'n'  }, "<leader>aaq",
          function()
            local input = vim.fn.input("Quick Chat: ")
            if input ~= "" then
              require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
            end
          end,
          {desc = "CopilotChat - Quick chat"}
      )
    end
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
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

