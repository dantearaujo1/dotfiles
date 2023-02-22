local util = require('utils')
local execute = vim.api.nvim_command
local fn = vim.fn

return {

	-- ============ SPEED UP PLUGINS ==============================
	{ 'nathom/filetype.nvim' }, -- New method of filetype that is faster
	-- ============ SYNTAX PLUGINS ==============================
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ 'JoosepAlviste/nvim-ts-context-commentstring' }, -- Know comment based on context
	{ 'yioneko/nvim-yati' }, -- Better indent tree-sitter plugin
	{ 'p00f/nvim-ts-rainbow' },
	{ 'windwp/nvim-ts-autotag' },
	{ 'David-Kunz/markid' }, -- Tree-sitter plugin for correct colors of parameters
	{ 'mattn/emmet-vim' },

	-- ============ DEBUGGER PLUGINS ==============================


	-- ============ LSP PLUGINS ==============================
	{ 'theHamsta/nvim-dap-virtual-text' }, -- Virtual text showing variables info
	{ 'rcarriga/nvim-dap-ui' }, -- UI out of the box
	{ 'nvim-telescope/telescope-dap.nvim' }, -- Telescope to find variables
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'mfussenegger/nvim-dap' },
	{ 'jayp0521/mason-nvim-dap.nvim' },
	{ 'jose-elias-alvarez/null-ls.nvim' },
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = {
      'nvim-telescope/telescope-dap.nvim', -- Telescope to find variables
      'theHamsta/nvim-dap-virtual-text', -- Virtual text showing variables info
      'rcarriga/nvim-dap-ui' -- UI out of the box
    },
	-- 'williamboman/nvim-lsp-installer'
  },
	{ 'onsails/lspkind-nvim' },
	{ 'ray-x/lsp_signature.nvim' }, -- for symbols in completion

	-- ============ COMPLETION PLUGINS ============================
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'rafamadriz/friendly-snippets' },
	-- === Completion Sources for CMP
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
	{ 'cljoly/telescope-repo.nvim' },
	{ 'xiyaowong/telescope-emoji.nvim' },
	{ 'dhruvmanila/telescope-bookmarks.nvim' },
	{ 'nvim-telescope/telescope-symbols.nvim' },
	{ 'nvim-telescope/telescope-project.nvim' },
	{ 'nvim-telescope/telescope-file-browser.nvim' },
	{ 'LinArcX/telescope-env.nvim' },
	{ 'GustavoKatel/telescope-asynctasks.nvim' },
	{
    'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},
	{ "nvim-telescope/telescope-live-grep-args.nvim" },

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
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	},

	{
    's1n7ax/nvim-window-picker',
		config = function()
			require'window-picker'.setup()
		end,
	},
	{ 'folke/todo-comments.nvim' },
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'arnamak/stay-centered.nvim' }, -- autocmds for always stay centered
	-- Bundle of mini modules [Using for mini-align]
	{
    'echasnovski/mini.nvim',
    config = function()
			  require("mini.align").setup()
			  require("mini.cursorword").setup()
			  require("mini.ai").setup()
		end,
	},
	{ 'ntpeters/vim-better-whitespace' }, -- Shows and trailling whitespace
	{ 'foosoft/vim-argwrap' }, -- Strenght argument wrapping and unwrapping
	{ 'tommcdo/vim-exchange' }, -- Easy text exchange operator for Vim
  {
    'booperlv/nvim-gomove',
    config = function()
      require('gomove').setup{}
    end
  }, -- Move lines up and down
	{ 'ggandor/leap.nvim' },
	{
    'ggandor/flit.nvim',
    config = function()
      require('flit').setup({})
    end
  },
	{ 'vim-scripts/ReplaceWithRegister' }, -- Find words with label using s or gs
	{
    'AckslD/nvim-trevJ.lua', -- Do the oposite of J in neovim
    config = 'require("trevj").setup()',
	},
	{ 'wesq3/vim-windowswap' }, -- Exchange Windows with <leader>ww
	{ 'numToStr/Comment.nvim' }, -- Better comment than tpope
	{ 'tpope/vim-surround' }, -- Change surroundings (parentheses, brackets ...)
	{ 'windwp/nvim-autopairs' }, -- Auto close () [] {} <Tags>
	{ 'bkad/camelcasemotion' }, -- Plugin for movin in camelcase with localleader
	{ 'propet/toggle-fullscreen.nvim' }, -- Toggle fullScreen with <leader>m
	{
    'iamcco/markdown-preview.nvim',
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{ 'folke/zen-mode.nvim' }, -- Distraction Free
	{ 'folke/twilight.nvim' }, -- Dim buffers
	{
    'ellisonleao/glow.nvim',
    enabled = function() return util.getOS() == "Linux" end,
		config = true ,
    cmd = "Glow",
  }, -- Preview Markdown files with :Glow
	{ 'uga-rosa/ccc.nvim' }, -- Color Picker
	{ 'anuvyklack/hydra.nvim' }, -- Hydra mode for creating new modes

	-- Language Specifics ==========================================================
	-- Processing ========
	{ 'sophacles/vim-processing' }, -- Processing plugin helper
	-- LATEX ========
  {
    'lervag/vimtex',
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    'matze/vim-tex-fold',
    enabled = function() return util.getOS() == "Linux" end
  },
	-- JSON ========
	{ 'gennaro-tedesco/nvim-jqx' }, -- Browse and preview json files
	-- GIT ========
	{ 'lewis6991/gitsigns.nvim' }, -- Super fast git decorations implemented purely in Lua/Teal
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
	-- CLI Pluggins ===========================================================
	{ 'ianding1/leetcode.vim', lazy=true  },
	-- UI Pluggins ===========================================================
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
      require('statuscol').setup(
        {
          foldfunc = "builtin",
          setopt = true
        }
      )
    end
  },
  {
    'j-hui/fidget.nvim',
		config = function ()
			require('fidget').setup()
		end
  }, -- Lsp progress handler
  { 'karb94/neoscroll.nvim' },
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

	-- -- Using nvim inside browser WHAT????
	-- {
	--   'glacambre/firenvim',
	--   build = function() vim.fn['firenvim#install'](0) end
	-- }

	--  {
  -- 'folke/noice.nvim',
	-- config = function ()
  --require("noice").setup()
	--end,
	--dependencies = {
	  --"MunifTanjim/nui.nvim",
	  --"rcarriga/nvim-notify",
	--}
	--   }

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
	-- ICONS THEMES==================================================
	{ 'ryanoasis/vim-devicons' },
	{ 'yamatsum/nvim-web-nonicons' },
	{ 'kyazdani42/nvim-web-devicons' },
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
	--'~/dev/projects/lua/neovim/project-creator',
	-- STATUS LINE PLUGINS ========================================================
	{ 'nvim-lualine/lualine.nvim' },
	{'SmiteshP/nvim-navic', dependencies = "neovim/nvim-lspconfig"},
  {
    'christoomey/vim-tmux-navigator',
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    'preservim/vimux',
    enabled = function() return util.getOS() == "Linux" end
  },
  -- { 'vimpostor/vim-tpipeline' }, Tmux status line with vim
  {
    'nvim-telescope/telescope-media-files.nvim',
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    'nvim-neorg/neorg',
      ft ="norg",
      config = {"require('dante/neorg')"},
      enabled = function() return util.getOS() == "Linux" end,
      dependencies = {
        { 'max397574/neorg-contexts' },
        { 'max397574/neorg-kanban' },
        { 'nvim-neorg/neorg-telescope' },
        {"nvim-treesitter"},
      },
  },
}

