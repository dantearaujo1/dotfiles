local navic = require("nvim-navic")

require'lualine'.setup {
  options = {
    icons_enabled = true,
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_show_tabline = false,
    always_divide_middle = true,
    globalstatus = true,
    refresh ={
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { {'mode', fmt = function(res) return res:sub(1,1) end} },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      'filename',
    },
    lualine_x = {'filetype','fileformat'},
    lualine_y = {},
    lualine_z = {
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




