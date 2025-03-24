local cmd = vim.cmd
local api = vim.api
local util = require('utils')
-- --------------------------------------------------------------------------
-- AutoCommands
-- --------------------------------------------------------------------------
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- Dont auto comment new line
-- Remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])
-- cmd(
--   [[
--     augroup dashboard_autocmds
--       autocmd!
--       autocmd FileType dashboard setlocal colorcolumn=0
--     augroup END
--   ]]
-- )
-- Highlight on Yank
local yankGrp = api.nvim_create_augroup("YankHighlight", {clear = true})
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

local asyncGrp = api.nvim_create_augroup("RunAsync", {clear = true})

api.nvim_create_autocmd("BufEnter", {
  command = "lua require('utils').map('n','<localleader>r',':AsyncRun -mode=term -pos=tmux -close node %:p <CR>', {noremap = true})",
  group = asyncGrp,
  pattern = "*.js"
})

-- local ftGrp = api.nvim_create_augroup("FiletypeMaps", {clear = true})
--
-- api.nvim_create_autocmd({ "BufEnter","BufWinEnter" },{
--   callback = function(ev)
--     require('utils').map('n','<leader>io',':TSToolsOrganizeImports<CR>', {noremap = true})
--     require('utils').map('n','<leader>gd',':TSToolsGoToSourceDefinition<CR>', {noremap = true})
--     require('utils').map('n','<leader>is',':TSToolsSortImports<CR>', {noremap = true})
--     require('utils').map('n','<leader>ir',':TSToolsRemoveUnusedImports<CR>', {noremap = true})
--     require('utils').map('n','<leader>if',':TSToolsFixAll<CR>', {noremap = true})
--     require('utils').map('n','<localleader>rf',':TSToolsRenameFile<CR>', {noremap = true})
--   end,
--   group = ftGrp,
--   pattern = {"*.js","*.ts","*.jsx","*.tsx"},
--   desc = "Autocommand for enabling keys of typescript-tools plugin"
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "pde",
  callback = function()
      -- Define the keymap only for .pde files
    if(util.getOS() == "Linux") then
      vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':AsyncRun -mode=term -pos=tmux -close processing-java --sketch=$(VIM_FILEDIR) --output=/tmp/vim-processing/$(VIM_FILENOEXT) --force --run<CR>', { noremap = true, silent = true })
    else
      vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':AsyncRun -mode=term -pos=bottom -close processing-java --sketch=%:p:h --output=', { noremap = true, silent = true })
    end
  end
})
