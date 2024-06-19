local cmd = vim.cmd -- Execute Vim Commands
local g = vim.g -- Access Global Variables
local o = vim.o -- For Global Options
local w = vim.wo -- For Window Local Options


o.guifont = 'Hack Nerd Font Mono:h12'       -- Set GUI Font
g.termguicolors = true
o.termguicolors = true
w.cursorline = true
w.signcolumn = 'yes'				-- Set a Column before numbers

-- cmd('colorscheme vscode')                    -- Setting the theme
-- Applying transparency
vim.cmd('hi TabLine                  ctermbg=NONE guibg=NONE')
vim.cmd('hi TabLineSell              ctermbg=NONE guibg=NONE')
vim.cmd('hi TabLineFill              ctermbg=NONE guibg=NONE')
vim.cmd('hi WinSeparator             ctermbg=NONE guibg=NONE')
vim.cmd('hi VertSplit                ctermbg=NONE guibg=NONE')
vim.cmd('hi CursorLine               ctermbg=NONE guibg=NONE')
vim.cmd('hi CursorLineNr             ctermbg=NONE guibg=NONE')
vim.cmd('hi NonText                  ctermbg=NONE guibg=NONE')
vim.cmd('hi SignColumn               ctermbg=NONE guibg=NONE')
vim.cmd('hi FoldColumn               ctermbg=NONE guibg=NONE')
vim.cmd('hi WinBar                   ctermbg=RED  guibg=NONE')
vim.cmd('hi WinBarNC                 ctermbg=RED  guibg=NONE')
vim.cmd('hi LineNr                   ctermbg=NONE guibg=NONE')
vim.cmd('hi Normal                   ctermbg=NONE guibg=NONE')
vim.cmd('hi NormalNC                 ctermbg=NONE guibg=NONE')
vim.cmd('hi NormalFloat                 ctermbg=NONE guibg=NONE')
vim.cmd('hi FloatBorder              ctermbg=NONE guibg=NONE')
vim.cmd('hi CompeDocumentationBorder ctermbg=NONE guibg=NONE')
vim.cmd('hi CompeDocumentation       ctermbg=NONE guibg=NONE')
vim.cmd('hi TelescopePromptBorder    ctermbg=NONE guibg=NONE')

-- Fidget HI
-- vim.cmd('hi LspFloatWinNormal              ctermbg=NONE guibg=NONE')
-- vim.cmd('hi Constant              ctermbg=NONE guibg=NONE')
-- vim.cmd('hi WarningMsg              ctermbg=NONE guibg=NONE')
-- vim.cmd('hi Question              ctermbg=NONE guibg=NONE')
-- vim.cmd('hi Title              ctermbg=NONE guibg=NONE')
-- vim.cmd('hi Comment              ctermbg=NONE guibg=NONE')

-- vim.cmd('hi BufferTabpage      ctermbg=NONE guibg=NONE')
-- vim.cmd('hi BufferTabpages     ctermbg=NONE guibg=NONE')
-- vim.cmd('hi BufferTabpageFill  ctermbg=NONE guibg=NONE')
-- vim.cmd('hi BufferTabpagesFill ctermbg=NONE guibg=NONE')
-- vim.cmd('hi BufferCurrent      ctermbg=NONE guibg=NONE')
-- vim.cmd('hi BufferInactive     ctermbg=NONE guibg=NONE')
-- vim.g.gruvbox_baby_background_color = 'dark'
-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_transparent_mode = 1
-- --------------------------------------------------------------------------


