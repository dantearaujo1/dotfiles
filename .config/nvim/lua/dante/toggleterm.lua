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

function _G.set_terminal_keymaps()
  if vim.fn.win_gettype() ~= "popup" then
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-t>', [[<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  else
    -- local opts = {buffer = 0}
    -- vim.keymap.del('t', '<esc>',  opts)
    -- vim.keymap.del('t', 'jk',  opts)
    -- vim.keymap.del('t', '<C-t>',  opts)
    -- vim.keymap.del('t', '<C-h>',  opts)
    -- vim.keymap.del('t', '<C-j>',  opts)
    -- vim.keymap.del('t', '<C-k>',  opts)
    -- vim.keymap.del('t', '<C-l>',  opts)
    -- vim.keymap.del('t', '<C-w>',  opts)
  end
end

function _lazygit_toggle()
  lazygit:toggle()
end
function _lazygit_dotfiles_toggle()
  dotfiles:toggle()
end


