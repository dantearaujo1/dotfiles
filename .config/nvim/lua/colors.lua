local cmd = vim.cmd -- Execute Vim Commands
local g = vim.g -- Access Global Variables
local o = vim.o -- For Global Options
local w = vim.wo -- For Window Local Options


o.guifont = 'Hack Nerd Font Mono:h12'       -- Set GUI Font
g.termguicolors = true
o.termguicolors = true
w.cursorline = true
w.signcolumn = 'yes'				-- Set a Column before numbers

cmd('colorscheme vscode')                    -- Setting the theme
vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
vim.cmd('hi NonText ctermbg=NONE guibg=NONE')
vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
vim.cmd('hi FoldColumn ctermbg=NONE guibg=NONE')
vim.cmd('hi WinBar ctermbg=NONE guibg=NONE')
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
vim.cmd('hi NormalNC ctermbg=NONE guibg=NONE')
-- vim.cmd('hi StatusLineNC ctermbg=NONE guibg=NONE')
-- vim.cmd('hi StatusLine ctermbg=NONE guibg=NONE')
-- vim.cmd('hi CursorLine ctermbg=NONE guibg=NONE')
-- vim.cmd('hi CursorLineNr ctermbg=NONE guibg=NONE')
-- vim.g.gruvbox_baby_background_color = 'dark'
-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_transparent_mode = 1
-- --------------------------------------------------------------------------


