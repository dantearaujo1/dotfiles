local cmd = vim.cmd -- Execute Vim Commands
local g = vim.g -- Access Global Variables
local o = vim.o -- For Global Options
local w = vim.wo -- For Window Local Options


o.guifont = 'Hack Nerd Font Mono:h12'       -- Set GUI Font
g.termguicolors = true
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
-- vim.opt.background = 'dark'
cmd('colorscheme gruvbox-baby')                    -- Setting the theme
vim.g.gruvbox_baby_background_color = 'dark'
vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 1
-- --------------------------------------------------------------------------

