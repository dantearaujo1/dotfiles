-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/devdante/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/devdante/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/devdante/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/devdante/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/devdante/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Alduin = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/Alduin",
    url = "https://github.com/AlessandroYorba/Alduin"
  },
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Revolution.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/Revolution.vim",
    url = "https://github.com/EdenEast/Revolution.vim"
  },
  ["VisualStudioDark.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/VisualStudioDark.vim",
    url = "https://github.com/Heorhiy/VisualStudioDark.vim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  badwolf = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/badwolf",
    url = "https://github.com/sjl/badwolf"
  },
  ["blue-moon"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/blue-moon",
    url = "https://github.com/kyazdani42/blue-moon"
  },
  camelcasemotion = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/camelcasemotion",
    url = "https://github.com/bkad/camelcasemotion"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["elly.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/elly.vim",
    url = "https://github.com/ryuta69/elly.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["eva01.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/eva01.vim",
    url = "https://github.com/hachy/eva01.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["happy_hacking.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/happy_hacking.vim",
    url = "https://github.com/YorickPeterse/happy_hacking.vim"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/iceberg.vim",
    url = "https://github.com/cocopon/iceberg.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["material.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/material.vim",
    url = "https://github.com/kaicataldo/material.vim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim",
    url = "https://github.com/christianchiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-highlite"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-highlite",
    url = "https://github.com/Iron-E/nvim-highlite"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-markdown"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-markdown",
    url = "https://github.com/ixru/nvim-markdown"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-web-nonicons"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/nvim-web-nonicons",
    url = "https://github.com/yamatsum/nvim-web-nonicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["open-browser-github.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/open-browser-github.vim",
    url = "https://github.com/tyru/open-browser-github.vim"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pop-punk.vim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/pop-punk.vim",
    url = "https://github.com/bignimbus/pop-punk.vim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  rigel = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/rigel",
    url = "https://github.com/Rigellute/rigel"
  },
  sonokai = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["stay-centered.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/stay-centered.nvim",
    url = "https://github.com/arnamak/stay-centered.nvim"
  },
  ["telescope-bookmarks.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-bookmarks.nvim",
    url = "https://github.com/dhruvmanila/telescope-bookmarks.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-emoji.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-emoji.nvim",
    url = "https://github.com/xiyaowong/telescope-emoji.nvim"
  },
  ["telescope-env.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-env.nvim",
    url = "https://github.com/LinArcX/telescope-env.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggle-fullscreen.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/toggle-fullscreen.nvim",
    url = "https://github.com/propet/toggle-fullscreen.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\0028\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-argwrap"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-argwrap",
    url = "https://github.com/foosoft/vim-argwrap"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-deus"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-deus",
    url = "https://github.com/ajmwagar/vim-deus"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-gotham"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-gotham",
    url = "https://github.com/whatyouhide/vim-gotham"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-gruvbox8",
    url = "https://github.com/lifepillar/vim-gruvbox8"
  },
  ["vim-handmade-hero"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-handmade-hero",
    url = "https://github.com/CreaturePhil/vim-handmade-hero"
  },
  ["vim-monokai"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-monokai",
    url = "https://github.com/sickill/vim-monokai"
  },
  ["vim-monotone"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-monotone",
    url = "https://github.com/Lokaltog/vim-monotone"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors",
    url = "https://github.com/bluz71/vim-nightfly-guicolors"
  },
  ["vim-one"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-one",
    url = "https://github.com/rakr/vim-one"
  },
  ["vim-processing"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-processing",
    url = "https://github.com/sophacles/vim-processing"
  },
  ["vim-purpura"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-purpura",
    url = "https://github.com/yassinebridi/vim-purpura"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-solarized8"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-solarized8",
    url = "https://github.com/lifepillar/vim-solarized8"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tex-fold"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-tex-fold",
    url = "https://github.com/matze/vim-tex-fold"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-tpipeline"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-tpipeline",
    url = "https://github.com/vimpostor/vim-tpipeline"
  },
  ["vim-windowswap"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vim-windowswap",
    url = "https://github.com/wesq3/vim-windowswap"
  },
  vimtex = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  vimux = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/preservim/vimux"
  },
  ["winbar.nvim"] = {
    loaded = true,
    path = "/home/devdante/.local/share/nvim/site/pack/packer/start/winbar.nvim",
    url = "https://github.com/fgheng/winbar.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\0028\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
