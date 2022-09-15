local cmd = vim.cmd
local api = vim.api
local util = require('utils')
-- --------------------------------------------------------------------------
-- AutoCommands
-- --------------------------------------------------------------------------
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- Dont auto comment new line

cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]) -- Command for recompile all plugins
-- Remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

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

local command_option = '';
if (util.getOS() == "Linux") then
  command_option =  "lua require('utils').map('n','<localleader>r',':AsyncRun -mode=term -pos=tmux -close processing-java --sketch=%:p:h --output=\"/tmp/vim-processing/%:p:h:t\" --force --run<CR>', {noremap = true})"
else
  command_option =  "lua require('utils').map('n','<localleader>r',':AsyncRun -mode=term -pos=bottom -close processing-java --sketch=%:p:h --output=" .. vim.fn.expand("$TEMP") .. "\"/vim-processing/%:p:h:t\" --force --run<CR>', {noremap = true})"
end

api.nvim_create_autocmd("BufEnter", {
  command = command_option,
  group = asyncGrp,
  pattern = "*.pde"
})
