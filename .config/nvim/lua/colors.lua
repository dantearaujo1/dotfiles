local cmd = vim.cmd -- Execute Vim Commands
-- local fn = vim.fn -- Call Vim functions
local g = vim.g -- Access Global Variables
-- local opt = vim.opt -- to vim.o.Options
local o = vim.o -- For Global Options
local w = vim.wo -- For Window Local Options
-- local b = vim.bo -- For the Buffer local options

-- --------------------------------------------------------------------------
-- Colorscheme
-- --------------------------------------------------------------------------

o.termguicolors = true
g.termguicolors = true
o.guifont = 'Hack Nerd Font Mono:h12'       -- Set GUI Font
w.cursorline = true
w.signcolumn = 'yes'				-- Set a Column before numbers
o.colorcolumn = '80'                            -- Set the Color of Column
cmd('colorscheme aurora')                    -- Setting the theme


-- Diagnostics Signs
vim.fn.sign_define('DiagnosticSignError', { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define('DiagnosticSignWarning', { text = "", texthl = "DiagnosticWarning" })
vim.fn.sign_define('DiagnosticSignInfo', { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define('DiagnosticSignHint', { text = "", texthl = "DiagnosticHint" })

-- LSPSAGA Colors
vim.api.nvim_command [[autocmd ColorScheme * :hi DiagnosticError guifg=Red ctermfg=Red]]
vim.api.nvim_command [[autocmd ColorScheme * :hi DiagnosticWarning guifg=Yellow ctermfg=Yellow]]
vim.api.nvim_command [[autocmd ColorScheme * :hi DiagnosticInfo guifg=White ctermfg=White]]
vim.api.nvim_command [[autocmd ColorScheme * :hi DiagnosticHint guifg=Green ctermfg=Green]]

