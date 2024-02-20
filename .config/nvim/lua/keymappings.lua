local g = vim.g
local util = require('utils')

local function t(str)
    return vim.api_nvim_replace_termcodes(str, true, true, true)
end

g.mapleader = ' '
if util.getOS() == 'Windows' then
  -- g.maplocalleader = 'ç'
  g.maplocalleader = ','
else
  -- g.maplocalleader = '\\'
  g.maplocalleader = ','
end

local snore = { noremap = true , silent = true}
local sxnore = { noremap = true , silent = true, expr = true}
local nore = { noremap = true }
local plug = { expr = true, noremap = false }

-- MODIFIED KEYS ==============================================================

util.map('n', ';' , ':' , nore)
util.map('x', ';' , ':' , nore)
util.map('n', ':' , ';' , nore)
util.map('x', ':' , ';' , nore)
util.map('n', '<Tab>' , '%' , nore) --Jump to matching pairs easily in normal mode


-- Commands Shortcuts =========================================================
util.map('n', '<leader>ll' , ':luafile %<CR> <bar> :lua print("This file was sourced!")<CR>' , nore)
-- " Change current working directory locally and print cwd after that
util.map('n', '<leader>cd' , ':lcd %:p:h<CR>:pwd<CR>', nore)
util.map('n', '<leader>v' , '`[V`]' , snore) -- Reselect last pasted text
-- " Use sane regex expression (see `:h magic` for more info)
util.map('n', '/' , "/\\v" , nore)

-- Put ; in the end of line
util.map('n', '<leader>;' , 'A;' , nore)

-- Stay in visual mode after indenting with < or >
util.map("v", ">", ">gv")
util.map("v", "<", "<gv")

-- Turn off navigation with arrows
util.map('n', '<Up>' , '<nop>' , nore)
util.map('n', '<Down>' , '<nop>' , nore)
util.map('n', '<Left>' , '<nop>' , nore)
util.map('n', '<Right>' , '<nop>' , nore)
util.map('n', 'Q' , '<nop>' , nore)
-- " Move the cursor based on physical lines, not the actual lines.
util.map('n', 'j' , '(v:count == 0 ? "gj" : "j")' , sxnore)
util.map('n', 'k' , '(v:count == 0 ? "gk" : "k")' , sxnore)
util.map('n', '^' , 'g^' , snore)
util.map('n', '0' , 'g0' , snore)

util.map('n', 'U' , '<C-r>' , nore)
-- Yank to the end of line
util.map('n', 'Y' , 'y$' , nore)
util.map('n', '<leader>Y' , '"+y$' , nore) -- Yank line to system clipboard
util.map('n', '<leader>y' , '"+y' , nore) -- Yank to system clipboard
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
if(util.getOS() == "Linux") then
  util.map('v', '<leader>cp' , ':\'<,\'>w !clip.exe<CR>' , nore) -- Yank to system clipboard inside visual mode and wsl
end

-- Help files vertical split
util.map('n', '<F1>' , ':vert help ' , nore)

-- Go to start or end of line easier
util.map('n', 'H' , '^' , nore)
util.map('n', 'L' , 'g_' , nore)
util.map('x', 'H' , '^' , nore)
util.map('x', 'L' , 'g_' , nore)
-- Find and replace (like Sublime Text 3)
util.map('x', '<M-s>', ':%s/', nore)
util.map('n', '<M-s>', ':s/', nore)
util.map('n', '<C-S>', ':%s/', nore)

-- CTRL-O and CTRL-I Movements
util.map('n', '<leader>j', '<C-o>', nore)
util.map('n', '<leader>k', '<C-i>', nore)

--  Navigation in the location and quickfix list
util.map('n', '<localleader>q' , ':<C-u>call asyncrun#quickfix_toggle(10)<CR>' , nore)
util.map('n', ']L' , ':llast<CR>zv', nore)
util.map('n', '[L' , ':lfirst<CR>zv', nore)
util.map('n', '[Q' , ':cfirst<CR>zv', nore)
util.map('n', ']Q' , ':clast<CR>zv', nore)
util.map('n', ']c' , ':cnext<CR>zv', nore)
util.map('n', '[c' , ':cprevious<CR>zv', nore)
-- " Close a buffer and switching to another buffer, do not close the window
util.map('n', '<localleader>d' , ':bprevious <bar> bdelete #<CR>', nore)
util.map('n', '<localleader>( ' , ':bprevious <CR>', nore)
util.map('n', '<localleader> )' , ':bnext <CR>', nore)
-- " Toggle search highlight
util.map('n', '<Leader>hl' , '(&hls && v:hlsearch ? ":nohls" : ":set hls")."\n"', {expr = true, silent = true, noremap = true})
-- Open Command Window
util.map('n', 'q;' , 'q:', nore)
util.map('n','<F2>',':pu=strftime(\'%c\')<CR>', nore) -- Put time stamp

-- Window Operations ==========================================================
-- Tab Operation
util.map('n', '<leader>1' , 'gT', nore)
util.map('n', '<leader>2' , 'gt', nore)
util.map('n', '<leader>n' , ':tabnew<CR>', nore)
util.map('n', '<leader>c' , ':tabclose<CR>', nore)

-- Change focus
if(util.getOS() == "Linux") then
  if (util.getUser() == "devdante-archlinux-hd") then
    -- util.map('n', '<C-h>' , ':KittyNavigateLeft<CR>', snore)
    -- util.map('n', '<C-l>' , ':KittyNavigateRight<CR>', snore)
    -- util.map('n', '<C-j>' , ':KittyNavigateDown<CR>', snore)
    -- util.map('n', '<C-k>' , ':KittyNavigateUp<CR>', snore)
    util.map('n', '<C-h>' , ':TmuxNavigateLeft<CR>', snore)
    util.map('n', '<C-l>' , ':TmuxNavigateRight<CR>', snore)
    util.map('n', '<C-j>' , ':TmuxNavigateDown<CR>', snore)
    util.map('n', '<C-k>' , ':TmuxNavigateUp<CR>', snore)
    -- util.map('n', '<C-h>' , '<C-w>h', snore)
    -- util.map('n', '<C-l>' , '<C-w>l', snore)
    -- util.map('n', '<C-j>' , '<C-w>j', snore)
    -- util.map('n', '<C-k>' , '<C-w>k', snore)
  end
else
  util.map('n', '<C-h>' , '<C-w>h', snore)
  util.map('n', '<C-l>' , '<C-w>l', snore)
  util.map('n', '<C-j>' , '<C-w>j', snore)
  util.map('n', '<C-k>' , '<C-w>k', snore)
end

-- Terminal Operations ========================================================
util.map('n','<c-t>','<Cmd> exe v:count1 . "ToggleTerm"<CR>', nore)
util.map('i','<c-t>','<Esc><Cmd> exe v:count1 . "ToggleTerm"<CR>', nore)
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

if(util.getOS() == "Linux") then
  if(util.getUser() == "devdante-wsl-ubuntu") then
    util.map('n', '<leader>tc' , ':VimuxCloseRunner<CR>', nore)
    util.map('n', '<leader>to' , ':VimuxOpenRunner<CR>', nore)
  end
end


-- Plugins Keymaps ============================================================
-- =================================================================|AsyncRun|
util.map('n', '<F3>' , ':AsyncTask file-build<CR>', nore)
util.map('n', '<F4>' , ':AsyncTask file-run<CR>', nore)
util.map('n', '<F5>' , ':AsyncTask file-b&r<CR>', nore)
util.map('n', '<F6>' , ':AsyncTask project-b&r<CR>', nore)
util.map('n', '<F7>' , ':AsyncTask project-run<CR>', nore)
util.map('n', '<F8>' , ':AsyncTask project-init<CR>', nore)
-- =================================================================|LEAP|
-- require('leap').add_default_mappings()
-- ===============================================================|OpenBrowser|
util.map('n', '<leader>ob' , ':<C-u>call openbrowser#_keymap_smart_search("n")<CR>', nore)
util.map('n', '<leader>og' , 'yi\' :OpenGithubProject <C-R>"<CR>', nore)
util.map('v', '<leader>ob' , ':<C-u>call openbrowser#_keymap_smart_search("v")<CR>', nore)

-- ===========================================================|CamelCaseMotion|
util.map('n', '<localleader>w' , '"<Plug>CamelCaseMotion_w"', plug)
util.map('n', '<localleader>b' , '"<Plug>CamelCaseMotion_b"', plug)
util.map('n', '<localleader>e' , '"<Plug>CamelCaseMotion_e"', plug)
util.map('n', '<localleader>ge' , '"<Plug>CamelCaseMotion_ge"', plug)

util.map('o', '<localleader>w' , '"<Plug>CamelCaseMotion_iw"', plug)
util.map('x', '<localleader>w' , '"<Plug>CamelCaseMotion_iw"', plug)
util.map('o', '<localleader>b' , '"<Plug>CamelCaseMotion_ib"', plug)
util.map('x', '<localleader>b' , '"<Plug>CamelCaseMotion_ib"', plug)
util.map('o', '<localleader>e' , '"<Plug>CamelCaseMotion_ie"', plug)
util.map('x', '<localleader>e' , '"<Plug>CamelCaseMotion_ie"', plug)


  -- =======================================================================|DAP|
  util.map('n', '<leader>db' , ":lua require'dap'.toggle_breakpoint()<CR>", snore)
  util.map('n', '<leader>dc' , ":lua require'dap'.continue()<CR>", snore)
  util.map('n', '<leader>ds' , ":lua require'dap'.terminate()<CR>", snore)
  util.map('n', '<leader>dj' , ":lua require'dap'.step_into()<CR>", snore)
  util.map('n', '<leader>do' , ":lua require'dap'.step_over()<CR>", snore)
  util.map('n', '<leader>dk' , ":lua require'dap'.step_out()<CR>", snore)
  util.map('n', '<leader>du' , ":lua require'dapui'.toggle()<CR>", snore)

  util.map('n', '<leader>dK' , ":lua require'dap'.up()<CR>", snore)
  util.map('n', '<leader>dJ' , ":lua require'dap'.down()<CR>", snore)

  util.map('n', '<leader>d_' , ":lua require'dap'.run_last()<CR>", snore)
  util.map('n', '<leader>dr' , ":lua require'dap'.repl.open({}, 'vsplit')<CR><C-H>", snore)
  util.map('n', '<leader>di' , ":lua require'dap.ui.widgets'.hover()<CR>", snore)
  util.map('v', '<leader>di' , ":lua require'dap.ui.variables'.visual_hover()<CR>", snore)
  util.map('n', '<leader>d?' , ":lua require'dap.ui.variables'.scopes()<CR>", snore)
  util.map('n', '<leader>de' , ":lua require'dap'.set_exception_breakpoints({'all'})<CR>", snore)
-- end

-- ================================================================|PROCESSING|

if(util.getOS() == "Linux") then
  util.map('n', '<leader>r' , ":AsyncRun -mode=term -pos=tmux -close processing-java --sketch=$(VIM_FILEDIR) --output=/tmp/vim-processing/$(VIM_FILENOEXT) --force --run<CR>", { noremap = true, expr = false })
else
util.map('n', '<leader>r' , ":AsyncRun -mode=term -pos=bottom -close processing-java --sketch=%:p:h --output=" .. vim.fn.expand("$TEMP") .. "\\vim-processing/%:p:h:t --force --run<CR>", nore)
end
util.map('n', '<leader>R' , '"<Plug>(processing-run)"', plug)


-- ================================================================|MARKDOWN|
util.map('n', '<leader>p' , ':Glow<CR>', nore)
util.map('n', 'ml' , '<Plug>Markdown_CreateLink', nore)
util.map('n', 'mk' , '<Plug>Markdown_Checkbox', nore)

-- ================================================================|SNEAK|
-- util.map('n', 'f' , '<Plug>Sneak_f', nore)
-- util.map('n', 'F' , '<Plug>Sneak_F', nore)
--util.map('n', ':' , '<Plug>Sneak_;' , nore)

util.map('n', '<leader><leader>a', ':ArgWrap<CR>', nore)
-- ================================================================|COLORIZER|
util.map('n', '<leader>cc' , ':CccPick<CR>', nore)
-- ================================================================|NEOTREE|
-- util.map('n', '<leader>e' , ':NeoTreeShowToggle<CR>', nore)
util.map('n', '<leader>E' , ':Neotree dir=~/.config/nvim/lua/ toggle<CR>', nore)

-- ================================================================
util.map('i', '<C-E>', 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', {expr =true, noremap = true, silent = true})
util.map('s', '<C-E>', 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', {expr =true, noremap = true, silent = true})

util.map( 'n', '<leader>J', ':lua require("trevj").format_at_cursor()<CR>', {noremap = true, silent = true})

util.map( 'n', 'zR', ':lua require("ufo").openAllFolds()<CR>', {noremap = true, silent = true})
util.map( 'n', 'zM', ':lua require("ufo").closeAllFolds()<CR>', {noremap = true, silent = true})


util.map( 'n', '<leader>11', ':lua vim.diagnostic.disable()<CR>', {noremap = true, silent = true})
util.map( 'n', '<leader>12', ':lua vim.diagnostic.enable()<CR>', {noremap = true, silent = true})
util.map( 'n', '<localleader>o', ':Oil<CR>', {noremap = true, silent = true})

