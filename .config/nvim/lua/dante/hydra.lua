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
    {'h', '<c-w>h', {desc = 'Go to Left Buffer'}},
    {'j', '<c-w>j', {desc = 'Go to Down Buffer'}},
    {'k', '<c-w>k', {desc = 'Go to Up Buffer'}},
    {'l', '<c-w>l', {desc = 'Go to Right Buffer'}},
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
    {'h', '<c-w>h', {desc = 'Go to Left Buffer'}},
    {'j', '<c-w>j', {desc = 'Go to Down Buffer'}},
    {'k', '<c-w>k', {desc = 'Go to Up Buffer'}},
    {'l', '<c-w>l', {desc = 'Go to Right Buffer'}},
  }

})


local hint = [[
_b_:  File buffers     _B_:  Show builtins
_cc_: Colorscheme      _cm_: Execute command
_e_:  File browser     _E_:  Enviroment variables
_f_:  Find Files
_g_:  Live grep        _G_:  Git Files
_h_:  Help Tags        _H_:  Home Browser
_k_:  Keymaps
_m_:  Bookmarks
_o_:  Old files        _O_:  Show Options
_p_:  Projects         _P_:  Packer Opts
_q_:  Show Quick Fix
_r_:  RepoList         _R_:  Resume
_t_:  Find Todos
_u_:  Undotree
_/_:  In File          _?_:  Search History
_;_:  Commands History _,_:  Search dotfiles
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
      { 'g', cmd 'Telescope live_grep', {desc = 'Search for a string inside files'}},
      { 'G', cmd 'Telescope git_files', {desc='Show git files'} },
      { 'h', cmd 'Telescope help_tags', { desc = 'Vim help' } },
      { 'H', ':lua require("dante.telescope").search_from_home()<CR>', { desc = 'Look files from our home path' } },
      { 'k', cmd 'Telescope keymaps', {desc = "Show keymapping"}},
      { 'm', cmd 'Telescope bookmarks', { desc = 'Show url bookmarks' } },
      { 'o', cmd 'Telescope oldfiles', { desc = 'recently opened files' } },
      { 'O', cmd 'Telescope vim_options' },
      { 'p', cmd 'Telescope project', { desc = 'projects' } },
      { 'P', ':lua require("telescope").extensions.packer.packer(opts)<CR>', { desc = 'Packer Opts' } },
      { 'q', cmd 'Telescope quickfix', { desc = 'Show quickfix menu' } },
      { 'r', cmd 'Telescope repo list' },
      { 'R', cmd 'Telescope resume' },
      { 't', cmd 'TodoTelescope' },
      { 'u', cmd 'silent! %foldopen! | UndotreeToggle', { desc = 'undotree' }},
      { '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'search in file' } },
      { '?', cmd 'Telescope search_history',  { desc = 'search history' } },
      { ';', cmd 'Telescope command_history', { desc = 'command-line history' } },
      { ',', ':lua require("dante.telescope").search_dotfiles()<CR>', { desc = 'Show nvim dotfiles' } },
      { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
      { '<Esc>', nil, { exit = true, nowait = true } },
   }
})
