local cmd = vim.cmd -- Execute Vim Commands
local g = vim.g -- Access Global Variables
local o = vim.o -- For Global Options
local w = vim.wo -- For Window Local Options


o.termguicolors = true
g.termguicolors = true
o.guifont = 'Hack Nerd Font Mono:h12'       -- Set GUI Font
w.cursorline = true
w.signcolumn = 'yes'				-- Set a Column before numbers
o.colorcolumn = '80'                            -- Set the Color of Column
--
-- --------------------------------------------------------------------------
-- Colorscheme
-- --------------------------------------------------------------------------
-- require('nvim-tundra').setup({
--   transparent_background = false,
--   editor = {
--     search = {},
--     substitute = {},
--   },
--   syntax = {
--     booleans = { bold = true, italic = true },
--     comments = { bold = true, italic = true },
--     conditionals = {},
--     constants = { bold = true },
--     functions = {},
--     keywords = {},
--     loops = {},
--     numbers = { bold = true },
--     operators = { bold = true },
--     punctuation = {},
--     strings = {},
--     types = { italic = true },
--   },
--   diagnostics = {
--     errors = {},
--     warnings = {},
--     information = {},
--     hints = {},
--   },
--   plugins = {
--     lsp = true,
--     treesitter = true,
--     cmp = true,
--     context = true,
--     dbui = true,
--     gitsigns = true,
--     telescope = true,
--   },
--   overwrite = {
--     colors = {},
--     highlights = {},
--   },
-- })

-- cmd('colorscheme aurora')                    -- Setting the last used theme
vim.opt.background = 'dark'
cmd('colorscheme dracula')                    -- Setting the theme
-- --------------------------------------------------------------------------

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

