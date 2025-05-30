local cmd = vim.cmd -- Execute Vim Commands
local fn = vim.fn -- Call Vim functions
local g = vim.g -- Access Global Variables
local opt = vim.opt -- to vim.o.Options
local o = vim.o -- For Global Options
local w = vim.wo -- For Window Local Options
local b = vim.bo -- For the Buffer local options

local utils = require('utils')

-- --------------------------------------------------------------------------
-- Tabs, Indents
-- --------------------------------------------------------------------------
o.tabstop= 2                    -- number of visual spaces per TAB
o.softtabstop= 2                -- number of spaces in tab when editing
o.shiftwidth= 2                 -- number of spaces to use for autoindent
o.smarttab= false
o.expandtab = true              -- expand tab to spaces so that tabs are spaces
o.smartindent = true            -- Indent lines automaticly with newlines and other options
o.autoindent = true             -- Indent lines automaticly with newlines and other options

o.hidden = true                 -- Don't hide abandoned buffers
o.splitbelow = true             -- When split put window below the current one
o.splitright = true             -- When split vertical put window to right

o.completeopt = 'menuone,noselect,noinsert' -- Completion Options
o.shortmess = 'caoOtI'               -- Don't show completion messages
o.matchpairs = '<:>,?:?,(:),{:},[:]'        -- Match these pairs with highlight
o.ignorecase = true
o.smartcase = true
o.compatible = false
--
-- -- --------------------------------------------------------------------------
-- -- Lateral Information
-- -- --------------------------------------------------------------------------
w.number = true
w.relativenumber = true
--
o.showmode = false
o.timeoutlen = 500
o.updatetime = 2000
o.clipboard = 'unnamedplus'
w.linebreak = true              -- Will wrap long lines at a character
o.showbreak = '@'               -- This simbol will be shown in a break
o.textwidth = 80                -- Size of line we can write in a buffer
o.scrolloff = 5                 -- How many lines from bottom to start scroll
o.history = 500
o.autowrite = true
o.swapfile = false
o.undofile = true
if(require("utils").getOS() == "Linux")then
  o.undodir = fn.expand('~/.config/nvim/undodir')
else
  o.undodir= fn.expand('~/.config/nvim/undodir')
end
o.pumheight = 15  -- Maximum number of items to show in popup menu
o.pumblend = 5  -- Psudo blend effect for popup menu
o.shiftround = true
o.virtualedit = 'block'
o.tildeop = true
o.joinspaces = false            -- Don't autoinsert two spaces after '.', '?'..
-- b.formatoptions = 'mM' 		    -- Format options for buffer
b.formatoptions = 'tcqlmM' 		    -- Format options for buffer
o.confirm = true

o.wildmode = 'full'
o.wildignore = o.wildignore  .. '*.o,*.obj,*.bin,*.dll,*.exe'
o.wildignore = o.wildignore  .. '*.\'*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**'
o.wildignore = o.wildignore  .. '*.\'*.pyc'
o.wildignore = o.wildignore  .. '*.\'*.DS_Store'
o.wildignore = o.wildignore  .. '*.*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf'
o.wildmenu = true
o.wildignorecase = true

o.title = true
o.inccommand='split'          -- Shows the effects of a command in a window

-- -- --------------------------------------------------------------------------
-- -- Memory, CPU
-- -- --------------------------------------------------------------------------
b.synmaxcol = 240
o.lazyredraw = false
o.syntax = 'enable'
--
--
-- -- --------------------------------------------------------------------------
-- -- Folding
-- -- --------------------------------------------------------------------------
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.o.foldmethod = 'expr'
--
o.guicursor ="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
o.laststatus = 3
o.cmdheight = 1

vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "context:12",
  "algorithm:histogram",
  "linematch:200",
  "indent-heuristic",
  "iwhite" -- I toggle this one, it doesn't fit all cases.
}
