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
vim.cmd([[colorscheme kanagawa-wave]])

vim.api.nvim_set_hl(0, 'Comment', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SnacksPickerDir', {  link = 'SnacksPickerFile',fg= '#c5c8c6' })

-- WinBar Colors
-- vim.api.nvim_set_hl(0, 'SagaWinbarFileName', { fg = '#c5c8c6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SagaWinbarFolderName', { fg = '#c5c8c6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SagaWinbarSep', { fg = '#c5c8c6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SagaText', { fg = '#c5c8c6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SagaFileName', { fg = '#ffffc6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SagaFolderName', { fg = '#c5c8c6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SagaDetail', { fg = '#c5c8c6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SagaSep', { fg = '#c5c8c6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SagaToggle', { fg = '#c5c8c6', bg = 'none' })
--
-- vim.api.nvim_set_hl(0, 'WhichKeySeparator', { fg = '#c5c8c6', bg = 'none' })


