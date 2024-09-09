local navic = require("nvim-navic")

local function keymap()
  if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
    return '⌨ ' .. vim.b.keymap_name
  end
  return ''
end
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'powerline_dark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh ={
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'b:gitsigns_head', icon = ''}},
    lualine_c = {
      -- {
      --   require('tmux-status').tmux_windows,
      --   cond = require('tmux-status').show,
      -- },
      'filename',
      {navic.get_location, cond = navic.is_available},
    },
    lualine_x = {'filetype','fileformat'},
    -- lualine_y = {'progress'},
    lualine_y = {},
    lualine_z = {
      -- {
      --   require('tmux-status').tmux_session,
      --   cond = require('tmux-status').show,
      -- },
      'location',
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}




