local Hydra = require('hydra')
local cmd = require('hydra.keymap-util').cmd

Hydra({
  name = "Windows Operations",
  hint = [[Windows Operations]],
  config = {
    color = 'red',
    invoke_on_body = true,
    hint = {
        position = 'bottom',
        border = 'rounded',
    },
  },
  mode = 'n',
  body = '<leader>w',
  heads = {
    {'h', '<C-w><', {desc = 'Expand Buffer Left'}},
    {'j', '<C-w>-', {desc = 'Expand Buffer Up'}},
    {'k', '<c-w>+', {desc = 'Expand Buffer Bottom'}},
    {'l', '<c-w>>', {desc = 'Expand Buffer Right'}},
    {'z', ':lua require("toggle-fullscreen"):toggle_fullscreen()<CR>', {desc = 'Make Buffer FullScreen'}},
  }

})
Hydra({
  name = "Git Operations",
  hint = [[Git Mode]],
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
        position = 'middle',
        border = 'rounded',
    },
  },
  mode = 'n',
  body = '<leader>g',
  heads = {
    {'t', '<cmd>lua _lazygit_toggle()<CR>', {desc = 'Lazygit'}},
    {'T', '<cmd>lua _lazygit_dotfiles_toggle()<CR>', {desc = 'Dotfiles Git'}},

    {'do', ':DiffviewOpen<CR>', {desc = 'Open Diff View'}},
    {'dc', ':DiffviewClose<CR>', {desc = 'Close Diff View'}},
    { '<Esc>', nil, { exit = true, nowait = true, desc= 'Exit' } },
  }

})


local hint = [[
_b_:  File buffers     _B_:  Show builtins
_cc_: Colorscheme      _cm_: Execute command
_e_:  File browser     _E_:  Enviroment variables
_f_:  Find Files       _F_:  Live grep Args
_g_:  Live grep        _G_:  Git Files
_h_:  Help Tags        _H_:  Home Browser
_k_:  Keymaps
_l_:  Lazy Plugs
_n_:  Notes
_m_:  Bookmarks
_o_:  Old files        _O_:  Show Options
_p_:  Projects         _P_:  Packer Opts
_q_:  Show Quick Fix
_r_:  RepoList         _R_:  Resume
_t_:  Find Todos       _T_: AsyncTasks List
_/_:  In File          _?_:  Search History
_;_:  Commands History _,_:  Search dotfiles
 _<_:  Grep dotfiles
^
_<Enter>_: Telescope  _<Esc>_
]]

Hydra({
   name = 'Telescope',
   hint = hint,
   config = {
      color = 'teal',
      invoke_on_body = true,
      hint = {
         position = 'middle',
         border = 'rounded',
      },
   },
   mode = 'n',
   body = '<Leader>f',
   heads = {
      { 'b', cmd 'Telescope buffers', { desc = 'Show open buffers' } },
      { 'B', cmd 'Telescope builtin', { desc = 'Show builtins' } },
      { 'cc', cmd 'Telescope colorscheme', { desc = 'Show colorschemes' } },
      { 'cm', cmd 'Telescope commands', { desc = 'Execute command' } },
      { 'e', cmd 'Telescope file_browser', { desc = 'Enter in directory mode'}},
      { 'E', cmd 'Telescope env', {desc = 'See Enviroment Variables'} },
      { 'f', cmd 'Telescope find_files', {desc = 'Look for a file'} },
      { 'F', cmd 'Telescope live_grep_args', {desc = 'Look for a string inside file in a folder'} },
      { 'g', cmd 'Telescope live_grep', {desc = 'Search for a string inside files'}},
      { 'G', cmd 'Telescope git_files', {desc='Show git files'} },
      { 'h', cmd 'Telescope help_tags', { desc = 'Vim help' } },
      { 'H', ':lua require("dante.telescope").search_from_home()<CR>', { desc = 'Look files from our home path' } },
      { 'k', cmd 'Telescope keymaps', {desc = "Show keymapping"}},
      { 'l', cmd 'Telescope lazy', {desc = "Show Plugins installed with Lazy"}},
      { 'n', cmd ':lua require("dante.telescope").search_notes()<CR>', { desc = 'Search Notes' } },
      { 'm', cmd 'Telescope bookmarks', { desc = 'Show url bookmarks' } },
      { 'o', cmd 'Telescope oldfiles', { desc = 'recently opened files' } },
      { 'O', cmd 'Telescope vim_options' },
      { 'p', cmd 'Telescope project', { desc = 'projects' } },
      { 'P', ':lua require("telescope").extensions.packer.packer(opts)<CR>', { desc = 'Packer Opts' } },
      { 'q', cmd 'Telescope quickfixhistory', { desc = 'Show quickfix menu' } },
      { 'r', cmd 'Telescope repo list' },
      { 'R', cmd 'Telescope resume' },
      { 't', cmd 'TodoTelescope' },
      { 'T', cmd 'Telescope asynctasks all', { desc = 'List of AsyncTasks' } },
      { 'u', cmd 'silent! %foldopen! | UndotreeToggle', { desc = 'undotree' }},
      { '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'search in file' } },
      { '?', cmd 'Telescope search_history',  { desc = 'search history' } },
      { ';', cmd 'Telescope command_history', { desc = 'command-line history' } },
      { ',', ':lua require("dante.telescope").search_dotfiles()<CR>', { desc = 'Show nvim dotfiles' } },
      { '<', ':lua require("dante.telescope").grep_dotfiles()<CR>', { desc = 'Grep inside nvim dotfiles' } },
      { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
      { '<Esc>', nil, { exit = true, nowait = true } },
   }

})
local load_operations = Hydra({
  name = "Packer Load Operation",
  hint = [[Load Plugins]],
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
        position = 'middle',
        border = 'rounded',
    },
  },
  heads = {
    {'n', ':PackerLoad neorg<CR>', {desc = 'Load Neorg'}},

    { '<Esc>', nil, { exit = true, nowait = true, desc= 'Exit' } },
  }

})
Hydra({
  name = "Packer Operation",
  hint = [[Packer]],
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
        position = 'middle',
        border = 'rounded',
    },
  },
  mode = 'n',
  body = '<leader>P',
  heads = {
    {'c', ':PackerClean<CR>', {desc = 'Remove folders from removed plugins'}},
    {'i', ':PackerInstall<CR>', {desc = 'Install plugins'}},
    {'s', ':PackerSync<CR>', {desc = 'Sync all plugins'}},
    {'S', ':PackerStatus<CR>', {desc = 'Show plugins status'}},
    {'q', function() load_operations:activate() end, {desc = 'Load specific plugins menu'}},
    {'Q', ':PackerLoad ', {desc = 'Load a given plugin'}},

    { '<Esc>', nil, { exit = true, nowait = true, desc= 'Exit' } },
  }

})
