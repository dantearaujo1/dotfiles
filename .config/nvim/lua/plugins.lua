local util = require('utils')
local execute = vim.api.nvim_command
local fn = vim.fn

return {
	-- ============ ETC PLUGINS ==============================
  {
      "andweeb/presence.nvim",
      cond = vim.env.TERMUX_VERSION == nil, -- do not load on Termux as it is useless
      event = "VeryLazy",
      opts = {
        main_image = "file",
        neovim_image_text = "Break my pinky? No thanks, I'm more of breaking my editor config",
        enable_line_number = true,
      },
      config = function(_, opts) require("presence"):setup(opts) end,
    },
	-- ============ SPEED UP PLUGINS ==============================
	-- { 'nathom/filetype.nvim' }, -- New method of filetype that is faster NOT WORKING
	-- ============ SYNTAX PLUGINS ==============================
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
  { 'JoosepAlviste/nvim-ts-context-commentstring' }, -- Know comment based on context
  -- { 'HiPhish/nvim-ts-rainbow2' },
	{
    'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup()
      end,
  },
	{ 'David-Kunz/markid' }, -- Tree-sitter plugin for correct colors of parameters
	-- { 'mattn/emmet-vim' },
  {
    'olrtg/nvim-emmet',
    config = function()
      vim.keymap.set({ "n", "v" }, '<localleader>a', require('nvim-emmet').wrap_with_abbreviation)
    end,
  },

	-- ============ DEBUGGER PLUGINS ==============================


	-- ============ REPL PLUGINS ==============================
  { 'milanglacier/yarepl.nvim', config = true },
	-- ============ LSP PLUGINS ==============================
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
    }
  },
  --- Separate cut from delete registers
  {
    "gbprod/cutlass.nvim",
    event = "VeryLazy",
    opts = { cut_key = "x" },
  },
  { 'theHamsta/nvim-dap-virtual-text' }, -- Virtual text showing variables info
  { 'rcarriga/nvim-dap-ui' }, -- UI out of the box
  { 'nvim-telescope/telescope-dap.nvim' }, -- Telescope to find variables
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'mfussenegger/nvim-dap' },
  { 'jay-babu/mason-nvim-dap.nvim' },
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = {
      'nvim-telescope/telescope-dap.nvim', -- Telescope to find variables
      'theHamsta/nvim-dap-virtual-text', -- Virtual text showing variables info
      'rcarriga/nvim-dap-ui' --
    },
  },

  {
    'folke/neodev.nvim',
    event = "VeryLazy",
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
	-- ============ SERVER PLUGINS ==============================
  {
    'barrett-ruth/live-server.nvim',
    enabled = function() return util.getOS() == "Linux" end,
		config = true ,
  },
	-- ============ COMPLETION PLUGINS ============================
  { 'hrsh7th/nvim-cmp' },
  {
    'L3MON4D3/LuaSnip',
    event = 'VeryLazy' ,
  },
  { 'rafamadriz/friendly-snippets' },
	-- -- -- === Completion Sources for CMP
   { 'saadparwaiz1/cmp_luasnip' }, -- Completion Source for luasnip
   { 'hrsh7th/cmp-nvim-lsp' },
   { 'hrsh7th/cmp-buffer' },
   { 'hrsh7th/cmp-path' },
   { 'hrsh7th/cmp-nvim-lua' },
   { 'hrsh7th/cmp-calc' },
   { 'hrsh7th/cmp-emoji' },
   { 'kdheepak/cmp-latex-symbols' },
	-- ============  TELESCOPE PLUGINS & EXTENSIONS  ==============================
	{
    'nvim-telescope/telescope.nvim',
		dependencies = {
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
		}
	},

	-- Plugins
	{
    'cljoly/telescope-repo.nvim',
    event = "VeryLazy",
  },
	{
    'xiyaowong/telescope-emoji.nvim',
    event = "VeryLazy",
  },
	{
    'dhruvmanila/telescope-bookmarks.nvim',
    event = "VeryLazy",
  },
	{
    'nvim-telescope/telescope-symbols.nvim',
    event = "VeryLazy",
  },
	{
    'nvim-telescope/telescope-project.nvim',
    event = "VeryLazy",
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
      }
    end
  },
	{ 'nvim-telescope/telescope-file-browser.nvim' },
  { 'tsakirist/telescope-lazy.nvim' },

	{
    'LinArcX/telescope-env.nvim',
    event = "VeryLazy",
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
    event = "VeryLazy",
    enabled = function() return util.getOS() == "Linux" end
  },
	{
    'GustavoKatel/telescope-asynctasks.nvim',
    event = "VeryLazy",
  },
	{
    'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},
	{
    'nvim-telescope/telescope-live-grep-args.nvim',
    event = "VeryLazy",
  },

	-- Terminal ==================================================================
	{ 'akinsho/toggleterm.nvim', branch = 'main', config = function() require("toggleterm").setup() end},
	{ 'skywind3000/asyncrun.vim' },
	{ 'skywind3000/asynctasks.vim' },
	-- Browser Navigation Plugins ==================================================
	{
    'xiyaowong/link-visitor.nvim',
    config = function()
      require('link-visitor').setup()
    end
  },
	{ 'tyru/open-browser.vim' },
	{
    'tyru/open-browser-github.vim',
    dependencies = {
      'tyru/open-browser.vim'
    }
  },
	-- Custom Pluggins =============================================================
	{
    "nvim-neo-tree/neo-tree.nvim",

    keys = {
      {"<leader>e","<cmd>NeoTreeShowToggle<CR>"}
    },
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	},
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require'oil'.setup()
    end,
  },
	{
    's1n7ax/nvim-window-picker',
		config = function()
			require'window-picker'.setup()
		end,
	},
	{ 'wesq3/vim-windowswap' }, -- Exchange Windows
	{ 'folke/todo-comments.nvim' },
	{ 'lukas-reineke/indent-blankline.nvim', main='ibl' },
	{ 'arnamak/stay-centered.nvim' }, -- autocmds for always stay centered
	-- Bundle of mini modules [Using for mini-align]
	{
    'echasnovski/mini.nvim',
    config = function()
			  require("mini.align").setup()
			  require("mini.cursorword").setup()
			  require("mini.ai").setup()
			  require("mini.hipatterns").setup()
			  -- require("mini.indentscope").setup()
			  -- require("mini.animate").setup()
		end,
	},
  { 'ntpeters/vim-better-whitespace' }, -- Shows and trailling whitespace
	{ 'tommcdo/vim-exchange' }, -- Easy text exchange operator for Vim
  {
    'booperlv/nvim-gomove',
    config = function()
      require('gomove').setup{}
    end
  }, -- Move lines up and down
  {'ggandor/leap.nvim'},
	{
    'ggandor/flit.nvim',
    config = function()
      require('flit').setup({labeled_modes="nv"})
    end
  },
	{ 'vim-scripts/ReplaceWithRegister' }, -- Replace with gr
	{ 'foosoft/vim-argwrap' }, -- Strenght argument wrapping and unwrapping
	{ 'AckslD/nvim-trevJ.lua', }, -- Opposite of J
	{
    'numToStr/Comment.nvim',
  }, -- Better comment than tpope
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
	-- { 'windwp/nvim-autopairs' }, -- Auto close () [] {} <Tags>
  {
    "altermo/ultimate-autopair.nvim",
    event={"InsertEnter","CmdlineEnter"},
    opts={
      --Config goes here
    },
  },
	-- { 'windwp/nvim-autopairs' }, -- Auto close () [] {} <Tags>
	{ 'bkad/camelcasemotion' }, -- Plugin for movin in camelcase with localleader
	{ 'propet/toggle-fullscreen.nvim' }, -- Toggle fullScreen with <leader>z
	{
    'iamcco/markdown-preview.nvim',
		build = function() vim.fn["mkdp#util#install"]() end,
    event = "VeryLazy",
	},
	{
    'folke/zen-mode.nvim',
    event = "VeryLazy",
  }, -- Distraction Free
	{
    'folke/twilight.nvim',
    event = "VeryLazy",
  }, -- Dim buffers
	{
    'ellisonleao/glow.nvim',
    enabled = function() return util.getOS() == "Linux" end,
		config = true ,
    event = "VeryLazy",
    cmd = "Glow",
  }, -- Preview Markdown files with :Glow
	{ 'uga-rosa/ccc.nvim' }, -- Color Picker
	{ 'anuvyklack/hydra.nvim' }, -- Hydra mode for creating new modes

	-- Language Specifics ==========================================================
	-- Processing ========
	{
    'sophacles/vim-processing',
    ft='pde',
  }, -- Processing plugin helper
	-- LATEX ========
  {
    'lervag/vimtex',
    event = "VeryLazy",
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    'matze/vim-tex-fold',
    event = "VeryLazy",
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    'aspeddro/pandoc.nvim' ,
    config = function ()
      require'pandoc'.setup()
    end
  },
	-- HTTP ========
	{
    'BlackLight/nvim-http',
    event = "VeryLazy",
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
    event="VeryLazy",
    config = function()
      require('neogit').setup()
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
	{ 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim', }, -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
	-- Java ========
  {'mfussenegger/nvim-jdtls'}, -- Java JDTLS helpers
	-- C++ ========
  { 'p00f/clangd_extensions.nvim' }, -- C++ clangd lsp defaults
  {
    'madskjeldgaard/cppman.nvim', -- Interface for the cppman cli tool
    dependencies = {
      { 'MunifTanjim/nui.nvim' }
    },
    enabled = function () return util.getOS() == "Linux" end,
    config = function()
      local cppman = require"cppman"
      cppman.setup()
      vim.keymap.set("n","<leader>cm", function() cppman.open_cppman_for(vim.fn.expand("<cword>")) end )
      vim.keymap.set("n","<leader>cn", function() cppman.input() end )
    end

  },
	-- DATABASE Specifics =========================================================
  {'tpope/vim-dadbod'},-- Vim plugin to interact with databases {Mongo,JQ,Postgre}
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
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
  {'kristijanhusak/vim-dadbod-completion'},-- Completion for dadbod
	-- CLI Pluggins ===============================================================
	{
    'ianding1/leetcode.vim',
    event = "VeryLazy",
    lazy=true,
  },
	-- UI Pluggins ===========================================================
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup()
    end
  },
   { 'onsails/lspkind-nvim' },
	{ 'ray-x/lsp_signature.nvim' }, -- for symbols in completion
	{ 'ElPiloto/significant.nvim' }, -- Animate columnSigns
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    -- config = function()
    --     require("dante/lspsaga")
    -- end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "nacro90/numb.nvim",
    config = function ()
      require('numb').setup()
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function ()
      require('ufo').setup()
    end
  },
  {
    'luukvbaal/statuscol.nvim',
    config = function ()
      local builtin = require("statuscol.builtin")
      require('statuscol').setup(
        {
          relculright = true,
          segments = {
            {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
            {text = {"%s"}, click = "v:lua.ScSa"},
            {text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa"}
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
		config = function ()
			require('fidget').setup()
		end
  }, -- Lsp progress handler
  {
    'karb94/neoscroll.nvim',
    config = function ()
      require('neoscroll').setup()
    end
  },
	{
    'rcarriga/nvim-notify',
    lazy = false,
    priority = 1000,
  },
	{
    "nvim-zh/colorful-winsep.nvim",
		config = function ()
			require('colorful-winsep').setup()
		end
	},
	{"shortcuts/no-neck-pain.nvim"},


	-- THEMES =====================================================================
	-- Dashboard ===========================
	{
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup{}
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
	{'luisiacc/gruvbox-baby', branch = 'main', lazy=true },
	{ 'Abstract-IDE/Abstract-cs', lazy=true },
	{ 'Mofiqul/vscode.nvim', lazy=true },
	{ 'ray-x/aurora', lazy=true },
	{ 'ofirgall/ofirkai.nvim', lazy=true },
	{ 'bluz71/vim-nightfly-guicolors', lazy=true },
	{ 'bluz71/vim-moonfly-colors', lazy=true },
	{ 'christianchiarulli/nvcode-color-schemes.vim', lazy=true },
	{ 'sainnhe/sonokai', lazy=true },
	{ 'sainnhe/gruvbox-material', lazy=true },
	{ 'sainnhe/edge', lazy=true },
	{ 'kyazdani42/blue-moon', lazy=true },
	{ 'mhartington/oceanic-next', lazy=true },
	{ 'Iron-E/nvim-highlite', lazy=true },
	{ 'nxvu699134/vn-night.nvim', lazy=true },
  { 'rockerBOO/boo-colorscheme-nvim', lazy=true },
	{ 'projekt0n/github-nvim-theme', lazy=true },
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
	-- { 'nvim-lualine/lualine.nvim' },
	{
    'MunifTanjim/nougat.nvim',
  },
	{'SmiteshP/nvim-navic', dependencies = "neovim/nvim-lspconfig"},
  {
    'christoomey/vim-tmux-navigator',
    -- enabled = function() return util.getOS() == 'Linux' end
    enabled = function() return not (vim.fn.executable('tmux') and string.find(vim.fn.expandcmd('$TERM'),'xterm-kitty')) end
  },
  {
    'preservim/vimux',
    enabled = function() return vim.fn.executable('tmux') end
  },
  -- Not working
  {
    'knubie/vim-kitty-navigator',
    build = {'cp ./*.py ~/.config/kitty/'},
    enabled = function() return not string.find(vim.fn.expandcmd('$TERM'), 'xterm-kitty')end
  },
  -- { 'vimpostor/vim-tpipeline' }, Tmux status line with vim
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
      run = ":Neorg sync-parsers",
      ft ="norg",
      opts = {
        load = {
          ["core.defaults"] = {},
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
          ["core.concealer"] = {},
        },
      },
  },
}

