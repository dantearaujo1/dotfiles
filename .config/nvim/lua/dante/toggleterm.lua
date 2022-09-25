local Terminal = require("toggleterm.terminal").Terminal
local util = require("utils")
local dotfiles = {}
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

if (util.getOS() == 'Linux') then

  dotfiles = Terminal:new(
    {
      dir = "git_dir",
      cmd = "lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME",
      direction = "float",
      float_opts ={
        border = "rounded"
      },
      hidden=true
    }
  )
else
  dotfiles = Terminal:new(
    {
      dir = "git_dir",
      cmd = "lazygit --git-dir=%HOME%/.dotfiles --work-tree=%HOME%",
      direction = "float",
      float_opts ={
        border = "rounded"
      },
      hidden=true
    }
  )


end

function _lazygit_toggle()
  lazygit:toggle()
end
function _lazygit_dotfiles_toggle()
  dotfiles:toggle()
end


