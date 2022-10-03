local gps = require'nvim-gps'
local hydra = require('hydra.statusline')
gps.setup()

local function hello()
  return [[HYDRA]]
  -- return hydra.get_name()
end

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
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
    lualine_a = {'mode',"require'hydra.statusline'.get_name()"},
    lualine_b = {'branch'},
    lualine_c = {'filename', {gps.get_location, cond = gps.is_available}},
    lualine_x = {'filetype', 'fileformat', 'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
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


