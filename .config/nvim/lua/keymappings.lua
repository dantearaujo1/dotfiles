local g = vim.g
local util = require('utils')

local function t(str)
    return vim.api_nvim_replace_termcodes(str, true, true, true)
end


local snore = { noremap = true , silent = true}
local sxnore = { noremap = true , silent = true, expr = true}
local nore = { noremap = true }
local plug = { expr = true, noremap = false }

-- MODIFIED KEYS ==============================================================

util.map('n', 'ç' , ':' , nore)
util.map('n', ';' , ':' , nore)
util.map('x', ';' , ':' , nore)

util.map('n', ':' , ';' , nore)
util.map('x', ':' , ';' , nore)

util.map('n', '<Tab>' , '%' , nore) --Jump to matching pairs easily in normal mode
util.map('v', '<Tab>' , '%' , nore) --Jump to matching pairs easily in normal mode


-- Commands Shortcuts =========================================================
util.map('n', '<leader>ll' , ':luafile %<CR> <bar> :lua print("This file was sourced!")<CR>' , nore)
util.map('n', '<leader>L' , ':Lazy<CR>' , nore)
util.map('n', '<leader>M' , ':Mason<CR>' , nore)
util.map('n', '<localleader>mkd' , ':!mkdir -p "%:h"<CR>:w<CR>' , nore)
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
util.map('n', '<F11>' , '<cmd>TransparentToggle<CR>' , nore)

-- Go to start or end of line easier
util.map('n', 'H' , '^' , nore)
util.map('n', 'L' , 'g_' , nore)
util.map('x', 'H' , '^' , nore)
util.map('x', 'L' , 'g_' , nore)
-- Find and replace (like Sublime Text 3)
util.map('n', '<M-s>', ':s/', nore)
util.map('x', '<M-s>', ':%s/', nore)
util.map('n', '<C-s>', ':%s/', nore)

-- CTRL-O and CTRL-I Movements
-- util.map('n', '<leader>j', '<C-o>', nore)
util.map('n', '<C-S-O>', '<C-i>', nore)

--  Navigation in the location and quickfix list
util.map('n', '<localleader>q' , ':<C-u>call asyncrun#quickfix_toggle(10)<CR>' , nore)
util.map('n', ']l' , ':lnext<CR>zv', nore)
util.map('n', ']l' , ':lprevious<CR>zv', nore)
util.map('n', ']L' , ':llast<CR>zv', nore)
util.map('n', '[L' , ':lfirst<CR>zv', nore)
util.map('n', '[Q' , ':cfirst<CR>zv', nore)
util.map('n', '[q' , ':cp<CR>zv', nore)
util.map('n', ']q' , ':cn<CR>zv', nore)
util.map('n', ']Q' , ':clast<CR>zv', nore)
util.map('n', '[b' , ':bprevious <CR>', nore)
util.map('n', ']b' , ':bnext <CR>', nore)
-- " Close a buffer and switching to another buffer, do not close the window
util.map('n', ']B' , ':bprevious <bar> bdelete #<CR>', nore)
util.map('n', '[t' , 'gT', nore)
util.map('n', ']t' , 'gt', nore)
util.map('n', '[T' , ':tabnew<CR>', nore)
util.map('n', ']T' , ':tabclose<CR>', nore)
-- " Toggle search highlight
util.map('n', '<Leader>no' , '(&hls && v:hlsearch ? ":nohls" : ":set hls")."\n"', {expr = true, silent = true, noremap = true})
-- Open Command Window
util.map('n', 'q;' , ':q<CR>', nore)
util.map('n','<F2>',':pu=strftime(\'%c\')<CR>', nore) -- Put time stamp

-- Window Operations ==========================================================
-- Tab Operation

-- Change focus
if(util.getOS() == "Linux") then
  if (util.getUser() == "devdante-archlinux-hd") then
    util.map('n', '<C-h>' , ':TmuxNavigateLeft<CR>', snore)
    util.map('n', '<C-l>' , ':TmuxNavigateRight<CR>', snore)
    util.map('n', '<C-j>' , ':TmuxNavigateDown<CR>', snore)
    util.map('n', '<C-k>' , ':TmuxNavigateUp<CR>', snore)
  end
else
  util.map('n', '<C-h>' , '<C-w>h', snore)
  util.map('n', '<C-l>' , '<C-w>l', snore)
  util.map('n', '<C-j>' , '<C-w>j', snore)
  util.map('n', '<C-k>' , '<C-w>k', snore)
end
util.map('n', '<leader>gf' , '<C-W>v gf', nore)

-- Terminal Operations ========================================================
-- util.map('n','<c-t>','<Cmd> exe v:count1 . "ToggleTerm"<CR>', nore)
-- util.map('i','<c-t>','<Esc><Cmd> exe v:count1 . "ToggleTerm"<CR>', nore)
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

if(util.getOS() == "Linux") then
    util.map('n', '<leader>tc' , ':VimuxCloseRunner<CR>', nore)
    util.map('n', '<leader>to' , ':VimuxOpenRunner<CR>', nore)
    util.map('n', '<leader>tp' , ':VimuxPromptRunner<CR>', nore)
    util.map('n', '<leader>tt' , ':VimuxTogglePane<CR>', nore)
    util.map('n', '<leader>tl' , ':VimuxLastCommand<CR>', nore)
    util.map('n', '<leader>tL' , ':VimuxClearTerminalScreen<CR>', nore)
    util.map('n', '<leader>ti' , ':VimuxRunCommand<CR>', nore)
    util.map('n', '<leader>tI' , ':VimuxInterruptCommand<CR>', nore)
    util.map('n', '<leader>tr' , ':VimuxRunCommand<CR>', nore)
end


-- Plugins Keymaps ============================================================
-- =================================================================|AsyncRun|
util.map('n', '<F3>' , ':AsyncTask file-build<CR>', nore)
util.map('n', '<F4>' , ':AsyncTask file-b&r<CR>', nore)
util.map('n', '<F5>' , ':AsyncTask file-run<CR>', nore)
util.map('n', '<F6>' , ':AsyncTask project-b&r<CR>', nore)
util.map('n', '<F7>' , ':AsyncTask project-run<CR>', nore)
util.map('n', '<F8>' , ':AsyncTask project-init<CR>', nore)
-- =================================================================|LEAP|
-- require('leap').add_default_mappings()
-- ===============================================================|OpenBrowser|
util.map('n', '<leader>ob' , ':<C-u>call openbrowser#_keymap_smart_search("n")<CR>', nore)
util.map('n', '<leader>og' , 'yi\' :OpenGithubProject <C-R>"<CR>', nore)
util.map('n', '<leader>oG' , 'yi\" :OpenGithubProject <C-R>"<CR>', nore)
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

-- ================================================================|ARGWRAP|
util.map('n', '<leader><leader>a', ':ArgWrap<CR>', nore)
-- ================================================================|NEOTREE|
-- util.map('n', '<leader>E' , ':Neotree dir=~/.config/nvim/lua/ toggle<CR>', nore)
-- ================================================================
util.map('i', '<C-E>', 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', {expr =true, noremap = true, silent = true})
util.map('s', '<C-E>', 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"', {expr =true, noremap = true, silent = true})

util.map( 'n', '<leader>J', ':lua require("trevj").format_at_cursor()<CR>', {noremap = true, silent = true})

util.map( 'n', 'zR', ':lua require("ufo").openAllFolds()<CR>', {noremap = true, silent = true})
util.map( 'n', 'zM', ':lua require("ufo").closeAllFolds()<CR>', {noremap = true, silent = true})


util.map( 'n', '<leader>11', ':lua vim.diagnostic.disable()<CR>', {noremap = true, silent = true})
util.map( 'n', '<leader>12', ':lua vim.diagnostic.enable()<CR>', {noremap = true, silent = true})
util.map( 'n', '<localleader>o', ':Oil<CR>', {noremap = true, silent = true})

-- ================================================================|NoNeckPain|
util.map( 'n', '<leader>0', ':NoNeckPain<CR>', {noremap = true, silent = true})

-- ================================================================|TROUBLE|
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "<leader>xr", function() require("trouble").toggle("lsp_references") end)

-- ================================================================|MOVE|
vim.keymap.set({ "n" }, "<S-A-k>"   ,"<CMD>LineDuplicate -1<CR>")
vim.keymap.set({ "n" }, "<S-A-j>" ,"<CMD>LineDuplicate +1<CR>")
vim.keymap.set({ "v" }, "<S-A-k>"   ,"<CMD>VisualDuplicate -1<CR>")
vim.keymap.set({ "v" }, "<S-A-j>" ,"<CMD>VisualDuplicate +1<CR>")
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-- GIT
vim.keymap.set('n', '<Leader>gg', '<cmd>lua _lazygit_toggle()<CR>', {desc="Toggle Lazygit"})
vim.keymap.set('n', '<Leader>gld', '<cmd>lua _lazygit_dotfiles_toggle()<CR>', {desc="Toggle Lazygit in Dotfiles"})
vim.keymap.set('n', '<Leader>gd', ':DiffviewOpen<CR>', {desc = 'Open Diff View'} )
vim.keymap.set('n', '<Leader>gD', ':DiffviewClose<CR>', {desc = 'Close Diff View'} )
vim.keymap.set( 'n','<Leader>gw', '<cmd>lua require("telescope").extensions.worktrees.list_worktrees()<CR>', {desc = 'Switch Worktrees'} )
vim.keymap.set( 'n','<Leader>gc', '<cmd>GitWorktreeCreateExisting<CR>', {desc = 'Create WorkTrees'} )
vim.keymap.set('n', '<Leader>gb' , ':Gitsigns blame_line<CR>' , {desc = "Blame the current line"})

-- GIT DEV
vim.keymap.set('n', '<Leader>gO', ':GitDevOpen ', {desc="Open a remote git repository"})
vim.keymap.set('n', '<Leader>got', ':GitDevToggleUI ', {desc="Open the UI for GIT Dev"})

-- Telescope
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Show open Buffers' })
vim.keymap.set('n', '<Leader>fB', '<cmd>Telescope builtin<CR>', { desc = 'Show Builtins' })
vim.keymap.set('n', '<Leader>fcc', '<cmd>Telescope colorscheme<CR>', { desc = 'Show Available ColorSchemes' })
vim.keymap.set('n', '<Leader>fcm', '<cmd>Telescope commands<CR>', { desc = 'Execute command' })
vim.keymap.set('n', '<Leader>fe', '<cmd>Telescope file_browser<CR>', { desc = 'Enter directory mode' })
vim.keymap.set('n', '<Leader>fE', '<cmd>Telescope env<CR>', { desc = 'See Environment Variables' })
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files hidden=true<CR>', { desc = 'Look for a file in the cwd' })
vim.keymap.set('n', '<Leader>fF', '<cmd>Telescope live_grep_args<CR>', { desc = 'Look for a string inside a file in a folder' })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Search string in files' })
vim.keymap.set('n', '<Leader>fG', '<cmd>Telescope git_files<CR>', { desc = 'Show git files' })
vim.keymap.set('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Vim help' })
vim.keymap.set('n', '<Leader>fH', ':lua require("dante.telescope").search_from_home()<CR>', { desc = 'Find files from home' })
vim.keymap.set('n', '<Leader>fj', '<cmd>Telescope symbols<CR>', { desc = 'Show emojis' })
vim.keymap.set('n', '<Leader>fk', '<cmd>Telescope keymaps<CR>', { desc = 'Show keymaps' })
vim.keymap.set('n', '<Leader>fl', '<cmd>Telescope lazy<CR>', { desc = 'Show plugins' })
vim.keymap.set('n', '<Leader>fn', ':lua require("dante.telescope").search_notes()<CR>', { desc = 'Search Notes' })

vim.keymap.set('n', '<Leader>f,', ':lua require("dante.telescope").search_dotfiles()<CR>', { desc = 'Search Dotfiles' })
vim.keymap.set('n', '<Leader>f.', ':lua require("dante.telescope").search_configs()<CR>', { desc = 'Search Configuration Files' })
vim.keymap.set('n', '<Leader>f<', ':lua require("dante.telescope").grep_dotfiles()<CR>', { desc = 'Grep Nvim Files' })

      -- { 'm', cmd 'Telescope openbrowser list', { desc = 'Show url bookmarks' } },
      -- { 'o', cmd 'Telescope oldfiles', { desc = 'recently opened files' } },
      -- { 'O', cmd 'Telescope vim_options' },
      -- { 'p', cmd ':lua require"telescope".extensions.project.project{}<CR>', { desc = 'projects' } },
      -- { 'q', cmd 'Telescope quickfixhistory', { desc = 'Show quickfix menu' } },
      -- { 'r', cmd 'Telescope repo cached_list' },
      -- { 'R', cmd 'Telescope resume' },
      -- { 's', cmd 'Telescope luasnip' },
      -- { 't', cmd 'TodoTelescope' },
      -- { 'T', cmd 'Telescope asynctasks all', { desc = 'List of AsyncTasks' } },
      -- -- { 'u', cmd 'silent! %foldopen! | UndotreeToggle', { desc = 'undotree' }},
      -- { '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'search in file' } },
      -- { '?', cmd 'Telescope search_history',  { desc = 'search history' } },
      -- { ';', cmd 'Telescope command_history', { desc = 'command-line history' } },
      -- { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },

-- Window
    vim.keymap.set('n', '<Leader>wh', '<C-w><', {desc = 'Expand Buffer Left'} )
    vim.keymap.set('n', '<Leader>wj', '<C-w>-', {desc = 'Expand Buffer Up'} )
    vim.keymap.set('n', '<Leader>wk', '<c-w>+', {desc = 'Expand Buffer Bottom'} )
    vim.keymap.set('n', '<Leader>wl', '<c-w>>', {desc = 'Expand Buffer Right'} )
    vim.keymap.set('n', '<Leader>wz', ':lua require("toggle-fullscreen"):toggle_fullscreen()<CR>', {desc = 'Make Buffer FullScreen'} )

local wk = require("which-key")
wk.add({
  { "<leader>f", group = "Telescope", icon = "" }, -- group
  { "<leader>g", group = "Git", icon = "" }, -- group
  { "<leader>h", group = "Harpoon & GitSigns", icon = "" }, -- group
  { "<leader>w", group = "Window", icon = "" }, -- group
  { "<leader>t", group = "Terminal", icon = "" }, -- group
  -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  -- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
  -- { "<leader>fn", desc = "New File" },
  -- { "<leader>f1", hidden = true }, -- hide this keymap
  -- {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    -- mode = { "n", "v" }, -- NORMAL and VISUAL mode
    -- { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    -- { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  -- }
})

util.map('n', '<leader>pw' , '<nop>' , nore)
