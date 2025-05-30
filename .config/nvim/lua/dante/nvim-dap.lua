local dap = require('dap')
local dapui = require('dapui')

local MASON_DAP_DEFAULT_SETTINGS = {
  ensure_installed = { },
  automatic_installation = true,
  automatic_setup = true,
  handlers = {

  }
}
-- require("mason-nvim-dap").setup(MASON_DAP_DEFAULT_SETTINGS)
require'nvim-dap-virtual-text'.setup()
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<LeftMouse>", "w" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "<Leader><Leader>t"
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 0.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

dap.listeners.after.event_initialized["dapui_config"] = function ()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
  dapui.close()
end

