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
  require("lazy").setup({
    {
      "glepnir/lspsaga.nvim",
      event = "BufRead",
      config = function()
          require("dante/lspsaga")
      end,
      dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
      }
    },
  })
