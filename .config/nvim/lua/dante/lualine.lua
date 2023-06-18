local hydra = require('hydra.statusline')
local navic = require("nvim-navic")
-- THEMES
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black },
    x = { fg = colors.black, bg = colors.red },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}


require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = bubbles_theme,
    -- component_separators = '|',
    section_separators = { left = '', right = '' },
    -- component_separators = {'', ''},
    -- section_separators = {'', ''},
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
    lualine_a = {{'mode', separator = {left = ''}, right_padding = 2}},
    lualine_b = {'branch'},
    lualine_c = {'filename',{navic.get_location, cond = navic.is_available} },
    lualine_x = {{'filetype',separator = {left = ''},right_padding = 2}, 'fileformat', {'encoding',separator = {right=''},left_padding = 2}},
    -- lualine_y = {'progress'},
    lualine_y = {''},
    lualine_z = {{'progress',separator = {left = ''},right_padding = 2},{'location', separator = {right = ''}, left_padding = 2}}
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




