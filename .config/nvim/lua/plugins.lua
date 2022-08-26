local util = require('utils')
local execute = vim.api.nvim_command
local fn = vim.fn

-- So there are some enviroment configurations to set the nvim path
-- We have the variable where neovim folder is located and its called: XDG_CONFIG_HOME
-- There is a variable where our data folder is located at and its called: XDG_DATA_HOME
-- To retrieve these paths we should call vim.fn.stdpath('place') place being config or data
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local packer = nil
packer = require('packer')

packer.startup({
  function(use)
		use 'wbthomason/packer.nvim'

-- ============ SYNTAX PLUGINS ==============================
	 use {'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
      }
  use { 'nvim-treesitter/nvim-treesitter-textobjects',
        requires = {
          'nvim-treesitter/nvim-treesitter', -- Text objects for ts
        }
      }
  use { 'p00f/nvim-ts-rainbow',
        requires = {
          'nvim-treesitter/nvim-treesitter', -- Raibow parenthesis for ts
        }
      }
  use { 'windwp/nvim-ts-autotag',
        requires = {
          'nvim-treesitter/nvim-treesitter', -- Auto tag for html,javascript...
        }
      }
	use 'mattn/emmet-vim'
	use { 'nvim-neorg/neorg' }

-- ============ DEBUGGER PLUGINS ==============================

    use {'mfussenegger/nvim-dap', -- Nvim Debbuger adapter
      requires = {
        use 'nvim-telescope/telescope-dap.nvim', -- Telescope to find variables
        use 'theHamsta/nvim-dap-virtual-text', -- Virtual text showing variables info
        use 'rcarriga/nvim-dap-ui' -- UI out of the box
      }
    }
    use { 'Pocco81/dap-buddy.nvim', module = 'dap-install' }

-- ============ LSP PLUGINS ==============================
		use { 'neovim/nvim-lspconfig',
      requires = {

      }
    }
    use { 'williamboman/nvim-lsp-installer',
      requires = {
        'neovim/nvim-lspconfig'
      }

    }
    use 'onsails/lspkind-nvim' -- for symbols in completion
    use 'ray-x/lsp_signature.nvim' -- for symbols in completion
    use 'jose-elias-alvarez/null-ls.nvim' -- for symbols in completion


-- ============ COMPLETION PLUGINS ============================
	use 'hrsh7th/nvim-cmp'
    use { 'L3MON4D3/LuaSnip',
    }  -- Pluggin for snippets
    use { 'rafamadriz/friendly-snippets'}

    -- === Completion Sources for CMP
    use { 'saadparwaiz1/cmp_luasnip', -- Completion Source for luasnip
    }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer',
    }
    use { 'hrsh7th/cmp-path',
    }
    use { 'hrsh7th/cmp-nvim-lua',
    }
    use { 'hrsh7th/cmp-calc',
    }
    use { 'hrsh7th/cmp-emoji',
    }
    use { 'kdheepak/cmp-latex-symbols',
    }

-- ============  TELESCOPE PLUGINS & EXTENSIONS  ==============================

		use {'nvim-telescope/telescope.nvim',
      requires = {
        use 'nvim-lua/popup.nvim',
        use 'nvim-lua/plenary.nvim',
        }
		}
    -- Plugins
    use 'nvim-telescope/telescope-packer.nvim' -- require('telescope').extensions.packer.plugins(opts)
    use 'cljoly/telescope-repo.nvim' -- This is to look for gh repos readme in telescope
    use 'xiyaowong/telescope-emoji.nvim' -- :Telescope emoji
    use 'dhruvmanila/telescope-bookmarks.nvim' -- Open browser favorites inside neovim
    use 'nvim-telescope/telescope-symbols.nvim' -- :Telescope symbols
    use 'nvim-telescope/telescope-project.nvim' -- Switch between projects
    use 'nvim-telescope/telescope-file-browser.nvim' -- File Browser Extension
    use 'LinArcX/telescope-env.nvim' -- File Browser Extension
    use {'nvim-telescope/telescope-fzf-native.nvim',
run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
}
    if (utils.getOS() == 'Linux') then
      use 'nvim-telescope/telescope-media-files.nvim' --  See media in telescope
      utils.map('n','<leader>fm', ':lua require("telescope").extensions.media_files.media_files()<CR>', {noremap = true})
    end

-- Terminal ============================================

    if utils.getOS() == 'Linux' then
      use 'christoomey/vim-tmux-navigator' -- This is for using nvim with tmux
      use 'preservim/vimux' -- Send commands to tmux from nvim
      use 'vimpostor/vim-tpipeline' -- Tmux status line with vim
    end
    use { 'akinsho/toggleterm.nvim' ,branch = 'main', config = function() require("toggleterm").setup() end}
		use 'skywind3000/asyncrun.vim' -- Make background activitys

-- Browser Navigation Plugins =================================================
		use 'tyru/open-browser.vim'
		use 'tyru/open-browser-github.vim' -- Open github page in browser <leader>og

-- Custom Pluggins ===========================================================
    use({ "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        }
    }) -- File explorer
    use {
      's1n7ax/nvim-window-picker',
      tag = 'v1.*',
      config = function()
          require'window-picker'.setup()
      end,
    }
    use 'folke/todo-comments.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use "arnamak/stay-centered.nvim" -- autocmds for always stay centered

		use 'foosoft/vim-argwrap' -- Strenght argument wrapping and unwrapping
		use 'ntpeters/vim-better-whitespace' -- Shows and trailling whitespace
		use 'tommcdo/vim-exchange' -- Easy text exchange operator for Vim
		use 'matze/vim-move' -- Move lines up and down
		use 'justinmk/vim-sneak' -- Find words using s
		use 'wesq3/vim-windowswap' -- Exchange Windows with <leader>ww

    use 'numToStr/Comment.nvim' -- Better comment than tpope
    use 'tpope/vim-surround' -- Change surroundings (parentheses, brackets ...)
    use 'windwp/nvim-autopairs'

use 'bkad/camelcasemotion' -- Plugin for movin in camelcase with localleader
    use 'propet/toggle-fullscreen.nvim' -- Toggle fullScreen with <leader>m

    use {'iamcco/markdown-preview.nvim',
          run = function() vim.fn["mkdp#util#install"]() end,
    }
		use 'junegunn/goyo.vim'
		use 'junegunn/limelight.vim'
    use 'ellisonleao/glow.nvim' -- Preview Markdown files with :Glow


-- LANGUAGE SPECIFCS =====================================================================
    use 'sophacles/vim-processing' -- Processing plugin helper
    use 'ixru/nvim-markdown' -- Fork of vim-markdown with extra functionality
    -- LATEX ========
    if utils.getOS() == 'Linux' then
      use 'lervag/vimtex'
      use 'matze/vim-tex-fold'
    end
-- UI Pluggins ===========================================================
    if (utils.getOS() == 'Linux') then
      use { 'RRethy/vim-hexokinase',
            run = 'make hexokinase'
          } -- Put some color in textcolor
    else
      use { 'RRethy/vim-hexokinase',
            run = 'mingw32-make hexokinase'
          } -- Put some color in textcolor
    end
    use 'rcarriga/nvim-notify' -- A notify menu for various things (Debug best)
-- THEMES =====================================================================
    -- Winbar ===========================
		use 'fgheng/winbar.nvim'

    -- ColorColumn ===========================
		use 'xiyaowong/virtcolumn.nvim'

		use 'lifepillar/vim-gruvbox8'
		use 'morhetz/gruvbox'
		use 'sjl/badwolf'
		use 'ajmwagar/vim-deus'
		use 'YorickPeterse/happy_hacking.vim'
		use 'lifepillar/vim-solarized8'
		use 'sickill/vim-monokai'
		use 'whatyouhide/vim-gotham'
		use 'rakr/vim-one'
		use 'kaicataldo/material.vim'
		use 'Lokaltog/vim-monotone'
		use 'AlessandroYorba/Alduin'
		use 'bignimbus/pop-punk.vim'
		use 'yassinebridi/vim-purpura'
		use 'hachy/eva01.vim'
		use 'cocopon/iceberg.vim'
		use 'Rigellute/rigel'
		use 'CreaturePhil/vim-handmade-hero'
		use 'EdenEast/Revolution.vim'
		use 'Heorhiy/VisualStudioDark.vim'

		use 'ryanoasis/vim-devicons'
		use 'yamatsum/nvim-web-nonicons'
		use 'kyazdani42/nvim-web-devicons'

-- TREESITTER SUPORTED THEMES==================================================

		use 'bluz71/vim-nightfly-guicolors'
		use 'bluz71/vim-moonfly-colors'
		use 'christianchiarulli/nvcode-color-schemes.vim'
		use 'sainnhe/sonokai'
		use 'kyazdani42/blue-moon'
		use 'mhartington/oceanic-next'
		use 'Iron-E/nvim-highlite'

-- STATUS LINE PLUGINS ========================================================
		use 'hoob3rt/lualine.nvim'
    use {'SmiteshP/nvim-gps', requires = "nvim-treesitter/nvim-treesitter"}
	end,
    config = {
        display = {
            open_fn = function()
            return require('packer.util').float({ border = 'single' })
            end
        }
    }
})

