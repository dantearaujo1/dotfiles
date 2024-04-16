local utils = require('utils')
local opts = { noremap = true, silent = true}
  utils.map_buf('n', '<leader>io',      ':TSToolsOrganizeImports<CR>',      opts, 0)
  utils.map_buf('n', '<leader>gd',      ':TSToolsGoToSourceDefinition<CR>', opts, 0)
  utils.map_buf('n', '<leader>is',      ':TSToolsSortImports<CR>',          opts, 0)
  utils.map_buf('n', '<leader>ir',      ':TSToolsRemoveUnusedImports<CR>',  opts, 0)
  utils.map_buf('n', '<leader>if',      ':TSToolsFixAll<CR>',               opts, 0)
  utils.map_buf('n', '<localleader>rf', ':TSToolsRenameFile<CR>',           opts, 0)
