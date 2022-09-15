local g = vim.g
local util = require('utils')

local function t(str)
    return vim.api_nvim_replace_termcodes(str, true, true, true)
end

g.mapleader = ' '
g.maplocalleader = 'ç'

local snore = { noremap = true , silent = true}
local sxnore = { noremap = true , silent = true, expr = true}
local nore = { noremap = true }
local plug = { expr = true, noremap = false }

-- MODIFIED KEYS ==============================================================

util.map('n', ':' , ';' , nore)
util.map('n', ';' , ':' , nore)
util.map('x', ';' , ':' , nore)
util.map('x', ':' , ';' , nore)
util.map('n', '<Tab>' , '%' , nore) --Jump to matching pairs easily in normal mode


-- Commands Shortcuts =========================================================

util.map('n', '<leader>w' , ':update<CR>' , snore)
util.map('n', '<leader>ll' , ':luafile %<CR> <bar> :lua print("This file was sourced!")<CR>' , nore)
util.map('n', '<leader>v' , '`[V`]' , snore) -- Reselect last pasted text
-- " Use sane regex expression (see `:h magic` for more info)
util.map('n', '/' , "/\\v" , nore)

-- Put ; in the end of line
util.map('n', '<leader>;' , 'A;' , nore)

-- Turn off navigation with arrows
util.map('n', '<Up>' , '<nop>' , nore)
util.map('n', '<Down>' , '<nop>' , nore)
util.map('n', '<Left>' , '<nop>' , nore)
util.map('n', '<Right>' , '<nop>' , nore)
-- " Move the cursor based on physical lines, not the actual lines.
util.map('n', 'j' , '(v:count == 0 ? "gj" : "j")' , sxnore)
util.map('n', 'k' , '(v:count == 0 ? "gk" : "k")' , sxnore)
util.map('n', '^' , 'g^' , snore)
util.map('n', '0' , 'g0' , snore)

-- Yank to the end of line
util.map('n', 'Y' , 'y$' , nore)
util.map('n', '<leader>Y' , '"+y$' , nore) -- Yank line to system clipboard
util.map('n', '<leader>y' , '"+y' , nore) -- Yank to system clipboard
if(util.getOS() == "Linux") then
  util.map('v', '<leader>cp' , ':\'<,\'>w !clip.exe<CR>' , nore) -- Yank to system clipboard inside visual mode and wsl
end

-- Go to start or end of line easier
util.map('n', 'H' , '^' , nore)
util.map('n', 'L' , 'g_' , nore)
util.map('x', 'H' , '^' , nore)
util.map('x', 'L' , 'g_' , nore)
-- Find and replace (like Sublime Text 3)
util.map('n', '<C-s>', ':%s/', nore)
util.map('x', '<C-s>', ':%s/', nore)

-- CTRL-O and CTRL-I Movements
util.map('n', '<leader>j', '<C-o>', nore)
util.map('n', '<leader>k', '<C-i>', nore)

--  Navigation in the location and quickfix list
-- util.map('n', '<C-k>' , ':lprevious<CR>zv', nore)
-- util.map('n', '<C-j>' , ':lnext<CR>zv', nore)
util.map('n', ']L' , ':llast<CR>zv', nore)
util.map('n', '[L' , ':lfirst<CR>zv', nore)
-- util.map('n', '<leader>k' , ':cprevious<CR>zv', nore)
-- util.map('n', '<leader>j' , ':cnext<CR>zv', nore)
util.map('n', '[Q' , ':cfirst<CR>zv', nore)
util.map('n', ']Q' , ':clast<CR>zv', nore)
-- " Close location list or quickfix list if they are present,
util.map('n', '<localleader>x' , ':windo close <bar> cclose<CR>', nore)
-- " Close a buffer and switching to another buffer, do not close the window
util.map('n', '<localleader>d' , ':bprevious <bar> bdelete #<CR>', nore)
-- " Toggle search highlight
util.map('n', '<Leader>hl' , '(&hls && v:hlsearch ? ":nohls" : ":set hls")."\n"', {expr = true, silent = true, noremap = true})

-- Window Operations ==========================================================
-- Change focus
if(util.getOS() == "Linux") then
else
  util.map('n', '<C-h>' , '<C-w>h', snore)
  util.map('n', '<C-l>' , '<C-w>l', snore)
  util.map('n', '<C-j>' , '<C-w>j', snore)
  util.map('n', '<C-k>' , '<C-w>k', snore)
end
-- Resize Windows
util.map('n', '<M-a>' , '<C-w>>', snore)
util.map('n', '<M-d>' , '<C-w><', snore)
util.map('n', '<M-s>' , '<C-w>+', snore)
util.map('n', '<M-w>' , '<C-w>-', snore)
-- Open Command Window
util.map('n', 'q;' , 'q:', nore)
-- Save & Quit Operations
util.map('n','<leader>w',':update<CR>', snore)       -- Saves if modified and q
util.map('n','<leader>q',':x<CR>', snore)            --
util.map('n','<leader>Q',':qa<CR>', snore)           -- Quit all opened buffers

util.map('n','<F3>',':pu=strftime(\'%c\')<CR>', nore) -- Put time stamp
-- Terminal Operations ========================================================
-- There's an keymap inside init.vim that handles terminals keybings for different
-- Terminals types like toggleterm and lazygit
-- util.map('t', '<ESC>' , '<C-\\><C-n>', nore)
if(util.getOS() == "Linux") then
  util.map('n', '<leader>tc' , ':VimuxCloseRunner<CR>', nore)
  util.map('n', '<leader>to' , ':VimuxOpenRunner<CR>', nore)
else
end


-- Plugins Keymaps ============================================================
-- =================================================================|Telescope|
util.map('n', '<leader>fe' , ':Telescope file_browser<CR>', nore)
util.map('n', '<leader>fE' , ':Telescope env<CR>', nore)
util.map('n', '<leader>fp' , ':Telescope project<CR>', nore)
util.map('n', '<leader>fP' , ':lua require("telescope").extensions.packer.packer(opts)<CR>', nore)
util.map('n', '<leader>fo' , ':Telescope bookmarks<CR>', nore)
util.map('n', '<leader>ff' , ':Telescope find_files<CR>', nore)
util.map('n', '<leader>fc' , ':Telescope colorscheme<CR>', nore)
util.map('n', '<leader>fq' , ':Telescope quickfix<CR>', nore)
util.map('n', '<leader>fk' , ':Telescope keymaps<CR>', nore)
util.map('n', '<leader>fg' , ':Telescope live_grep<CR>', nore)
util.map('n', '<leader>fG' , ':Telescope git_files<CR>', nore)
util.map('n', '<leader>fb' , ':Telescope buffers<CR>', nore)
util.map('n', '<leader>fbt' , ':Telescope builtin<CR>', nore)
util.map('n', '<leader>fh' , ':Telescope help_tags<CR>', nore)
util.map('n', '<leader>fr' , ':Telescope repo list<CR>', nore)

-- Custom Telescope functions
util.map('n', '<leader>,' , ':lua require("dante.telescope").search_dotfiles()<CR>', nore)
util.map('n', '<leader>fa' , ':lua require("dante.telescope").search_from_home()<CR>', nore)

-- ===============================================================|OpenBrowser|
util.map('n', '<leader>ob' , ':<C-u>call openbrowser#_keymap_smart_search("n")<CR>', nore)
util.map('v', '<leader>ob' , ':<C-u>call openbrowser#_keymap_smart_search("v")<CR>', nore)
util.map('n', '<leader>og' , 'yi\' :OpenGithubProject <C-R>"<CR>', nore)

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
  util.map('n', '<leader>ds' , ":lua require'dap'.stop()<CR>", snore)
  util.map('n', '<leader>dl' , ":lua require'dap'.step_into()<CR>", snore)
  util.map('n', '<leader>dh' , ":lua require'dap'.step_over()<CR>", snore)
  util.map('n', '<leader>do' , ":lua require'dap'.step_out()<CR>", snore)
  util.map('n', '<leader>du' , ":lua require'dapui'.toggle()<CR>", snore)

  util.map('n', '<leader>dk' , ":lua require'dap'.up()<CR>", snore)
  util.map('n', '<leader>dj' , ":lua require'dap'.down()<CR>", snore)

  util.map('n', '<leader>d_' , ":lua require'dap'.run_last()<CR>", snore)
  util.map('n', '<leader>dr' , ":lua require'dap'.repl.open({}, 'vsplit')<CR><C-H>", snore)
  util.map('n', '<leader>di' , ":lua require'dap.ui.widgets'.hover()<CR>", snore)
  util.map('v', '<leader>di' , ":lua require'dap.ui.variables'.visual_hover()<CR>", snore)
  util.map('n', '<leader>d?' , ":lua require'dap.ui.variables'.scopes()<CR>", snore)
  util.map('n', '<leader>de' , ":lua require'dap'.set_exception_breakpoints({'all'})<CR>", snore)
-- end

-- =============================================================|TODO-COMMENTS|
util.map('n', '<leader>ft' , ':TodoTelescope<CR>', nore)

-- =========================================================|TOGGLE-FULLSCREEN|
util.map('n', '<leader>z' , ':lua require("toggle-fullscreen"):toggle_fullscreen()<CR>', nore)

-- ================================================================|TREESITTER|

-- ================================================================|PROCESSING|
util.map('n', '<leader>R' , '"<Plug>(processing-run)"', plug)

-- if(util.getOS() == "Linux")
--   then
--   util.map('n', '<leader>r' , ':AsyncRun -mode=term -pos=tmux -close processing-java --sketch=%:p:h --output="/tmp/vim-processing/%:p:h:t" --force --run<CR>', nore)
-- else
--   -- local output_dir = "\"" .. vim.fn.expand("$TEMP") .. "\\vim-procesisng\\" .. sketch_name .. "\""
--   -- util.map('n', '<leader>r' , ":AsyncRun -mode=term -pos=bottom -close processing-java --sketch=".. sketch_path .. " ".. sketch_path .. "--output=" .. output_dir .. " --force --run<CR>", nore)
--
--   util.map('n', '<leader>r' , ":AsyncRun -mode=term -pos=bottom -close processing-java --sketch=%:p:h --output=vim-processing/%:p:h:t --force --run<CR>", nore)
-- end

-- " Change current working directory locally and print cwd after that
util.map('n', '<leader>cd' , ':lcd %:p:h<CR>:pwd<CR>', nore)

-- ================================================================|MARKDOWN|
util.map('n', '<leader>p' , ':Glow<CR>', nore)
util.map('i', '<C-E>', 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', {expr =true, noremap = true, silent = true})

util.map('s', '<C-E>', 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', {expr =true, noremap = true, silent = true})

-- ================================================================|SNEAK|
util.map('n', 'f' , '<Plug>Sneak_f', nore)
util.map('n', 'F' , '<Plug>Sneak_F', nore)
util.map('n', ':' , '<Plug>Sneak_;' , nore)
-- ================================================================|MARKDOWNPREVIEW|
util.map('n', 'ml' , '<Plug>Markdown_CreateLink', nore)
util.map('n', 'mk' , '<Plug>Markdown_Checkbox', nore)
--                       |<LEADER><LEADER>MAPPINGS|
-- ================================================================|LIMELIGHT|
util.map('n', '<leader><leader>l' , ':Limelight!!<CR>', nore)
-- ================================================================|GOYO|
util.map('n', '<leader><leader>g' , ':Goyo<CR>', nore)
util.map('n', '<leader><leader>a', ':ArgWrap<CR>', nore)
-- ================================================================|COLORIZER|
util.map('n', '<leader><leader>c' , ':HexokinaseToggle<CR>', nore)
-- ================================================================|NEOTREE|
util.map('n', '<leader><leader>e' , ':NeoTreeShowToggle<CR>', nore)
util.map('n', '<leader><leader>de' , ':Neotree dir=~/.config/nvim/lua/ toggle<CR>', nore)
-- ================================================================|LAZYGIT|
util.map('n',"<leader>git", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
util.map('n',"<leader>lgd", "<cmd>lua _lazygit_dotfiles_toggle()<CR>", {noremap = true, silent = true})
