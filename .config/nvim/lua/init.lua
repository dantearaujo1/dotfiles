if vim.g.vscode then

else
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
	  vim.fn.system({
	    "git",
	    "clone",
	    "--filter=blob:none",
	    "https://github.com/folke/lazy.nvim.git",
	    "--branch=stable", -- latest stable release
	    lazypath,
	  })
	end
	vim.opt.rtp:prepend(lazypath)

	require('lazy').setup("plugins")

  -- Custom Plugins Configurations
  require('dante/nvim-autopairs') -- For completing pairs


  require('dante/cmp') -- This is a completion system to use with lsp and sources
  require('dante/nvim-lspconfig') -- Language System Protocol -- Universal
  require('dante/nvim-dap') -- Another debugger Debug Adapter Protocol -- Universal
  -- require('dante/null-ls') -- Another debugger Debug Adapter Protocol -- Universal
  require('dante/snippets') -- Custom Snippets created by me
  require('dante/telescope') -- Like a file explorer or FZF
  require('dante/treesitter') -- ColorHighlight for a lot of languages
  require('dante/todo-comments') -- Highligh todo comments and show in a specific place
  require('dante/lualine') -- A fast but not fastest status line for neovim
  require('dante/comment') -- Comment plugin
  require('dante/indent-blankline') -- Show Indentation plugins
  require('stay-centered') -- Always make text centered
  require('dante/toggleterm') -- Terminal inside nvim
  require('dante/latex')
  require('dante/notify') -- Notify UI of plugins
  require('dante/emmet') -- Emmet for html and css
  require('dante/asynctasks')
  require('dante/git')
  -- require('dante/firenvim') -- Browser Configurations for Firenvim


  require('dante/others') -- Some custom plugins configurations

  -- User Lua Configs
  require('utils')
  require('settings')
  require('keymappings')
  require('variables')
  require('autocmd')
  require('colors')
  require('dante/hydra')

  -- Dante Plugins
  require('dante/processing')

end



-- So there are some enviroment configurations to set the nvim path
-- We have the variable where neovim folder is located and its called: XDG_CONFIG_HOME
-- There is a variable where our data folder is located at and its called: XDG_DATA_HOME
-- To retrieve these paths we should call vim.fn.stdpath('place') place being config or data
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- util.map('n','<leader>fm', ':lua require("telescope").extensions.media_files.media_files()<CR>', {noremap = true})
