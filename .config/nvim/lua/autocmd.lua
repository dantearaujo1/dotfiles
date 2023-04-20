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
local disableCC = api.nvim_create_augroup("dashboard_autocmds", {clear = true})
api.nvim_create_autocmd("BufEnter", {
  command = "set cc=0",
  group = disableCC,
  pattern = "dashboard"
})

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
