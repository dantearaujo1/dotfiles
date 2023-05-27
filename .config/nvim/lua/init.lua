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

  vim.g.mapleader = ' ' -- Lazy is asking to define leader before loading lazy
	require('lazy').setup("plugins",
    {
      dev = {
        path = '~/dev/projects/lua/neovim/'
    }})

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
   require('dante/minis') --
   require('dante/latex')
   require('dante/notify') -- Notify UI of plugins
   require('dante/emmet') -- Emmet for html and css
   require('dante/asynctasks')
   require('dante/git')
   require('dante/dashboard')
   require('dante/smartcolumn')

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

