local cmd = vim.cmd -- Execute Vim Commands
local g = vim.g -- Access Global Variables
local o = vim.o -- For Global Options
local w = vim.wo -- For Window Local Options
local utils = require('utils')

o.guifont = 'Hack Nerd Font Mono:h12'       -- Set GUI Font
g.termguicolors = true
o.termguicolors = true
w.cursorline = true
o.signcolumn = 'no'				-- Set a Column before numbers

-- vim.api.nvim_set_hl(0, 'Comment', { bg = 'none' })


