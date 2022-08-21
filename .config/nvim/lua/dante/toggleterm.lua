local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new(
  {
    dir = "git_dir",
    cmd = "lazygit" ,
    direction = "float",
    float_opts = {
      border = "double"
    },
    hidden=true
  }
)

function _lazygit_toggle()
  lazygit:toggle()
end


