local util = require('utils')
local execute = vim.api.nvim_command
local fn = vim.fn



return {

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
	},
	-- 'williamboman/nvim-lsp-installer'
	{ 'onsails/lspkind-nvim' },
	{ 'ray-x/lsp_signature.nvim' }, -- for symbols in completion

	-- ============ COMPLETION PLUGINS ============================
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'rafamadriz/friendly-snippets' },
	-- === Completion Sources for CMP
	{ 'saadparwaiz1/cmp_luasnip' },
	-- Completion Source for luasnip
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

	-- Terminal ============================================
	{ 'akinsho/toggleterm.nvim', branch = 'main', config = function() require("toggleterm").setup() end},
	{ 'skywind3000/asyncrun.vim' },
	{ 'skywind3000/asynctasks.vim' },
	-- Browser Navigation Plugins =================================================
	{ 'tyru/open-browser.vim' },
	{ 'tyru/open-browser-github.vim' },
	-- Custom Pluggins ===========================================================
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
	{ 'matze/vim-move' }, -- Move lines up and down
	-- use 'justinmk/vim-sneak' -- Find words using s -- Using leap now
	{ 'ggandor/leap.nvim' },
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
	{ 'ellisonleao/glow.nvim' }, -- Preview Markdown files with :Glow
	{ 'uga-rosa/ccc.nvim' }, -- Color Picker
	{ 'anuvyklack/hydra.nvim' }, -- Hydra mode for creating new modes

	-- Language Specifics =====================================================================
	{ 'sophacles/vim-processing' }, -- Processing plugin helper
	-- LATEX ========
	{ 'lervag/vimtex' },
	{ 'matze/vim-tex-fold' },
	-- JSON ========
	{ 'gennaro-tedesco/nvim-jqx' }, -- Browse and preview json files
	-- GIT ========
	{ 'lewis6991/gitsigns.nvim' }, -- Super fast git decorations implemented purely in Lua/Teal
	{ 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim', }, -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
	-- UI Pluggins ===========================================================

	'rcarriga/nvim-notify',
	'karb94/neoscroll.nvim',
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
	-- ColorColumn ===========================
	{ 'xiyaowong/virtcolumn.nvim', lazy=true },
	-- ICONS THEMES==================================================
	{ 'ryanoasis/vim-devicons' },
	{ 'yamatsum/nvim-web-nonicons' },
	{ 'kyazdani42/nvim-web-devicons' },
	-- TREESITTER SUPORTED THEMES==================================================
	{'luisiacc/gruvbox-baby', branch = 'main'},
	{ 'Abstract-IDE/Abstract-cs' },
	{ 'Mofiqul/vscode.nvim' },
	{ 'ray-x/aurora' },
	{ 'ofirgall/ofirkai.nvim' },
	{ 'bluz71/vim-nightfly-guicolors' },
	{ 'bluz71/vim-moonfly-colors' },
	{ 'christianchiarulli/nvcode-color-schemes.vim' },
	{ 'sainnhe/sonokai' },
	{ 'sainnhe/gruvbox-material' },
	{ 'sainnhe/edge' },
	{ 'kyazdani42/blue-moon' },
	{ 'mhartington/oceanic-next' },
	{ 'Iron-E/nvim-highlite' },
	{'nxvu699134/vn-night.nvim'},
	'rockerBOO/boo-colorscheme-nvim',
	{ 'projekt0n/github-nvim-theme' },
	-- CLI Pluggins ===========================================================
	{ 'ianding1/leetcode.vim' },
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
  {
    'lervag/vimtex',
    enabled = function() return util.getOS() == "Linux" end
  },
  {
    'matze/vim-tex-fold',
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

