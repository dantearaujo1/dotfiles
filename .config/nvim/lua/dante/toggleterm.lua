local utils = require("utils")
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({cmd = "lazygit" ,
dir = "git_dir",
direction = "float",
float_opts = {
  border = "double"
},

hidden=true})

function _lazygit_toggle()
  lazygit:toggle()
end

utils.map('n',"<leader>git", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

