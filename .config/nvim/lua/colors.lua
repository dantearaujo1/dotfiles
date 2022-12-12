local cmd = vim.cmd -- Execute Vim Commands
local g = vim.g -- Access Global Variables
local o = vim.o -- For Global Options
local w = vim.wo -- For Window Local Options


g.termguicolors = true
g.virtcolumn_char = '▕'
g.virtcolumn_priority = 10
o.colorcolumn = '81'                            -- Set the Color of Column
o.guifont = 'Hack Nerd Font Mono:h12'       -- Set GUI Font
o.termguicolors = true
w.cursorline = true
w.signcolumn = 'yes'				-- Set a Column before numbers
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
vim.g.Hexokinase_highlighters = {'virtual','backgroundfull'}
cmd('colorscheme gruvbox8_hard')                    -- Setting the theme
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

-- require("virt-column").setup()
