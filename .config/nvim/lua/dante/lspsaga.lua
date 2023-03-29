local saga = require 'lspsaga'

saga.setup({
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
-- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "single",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  }
})

vim.fn.sign_define(
  'DiagnosticSignError',
  { texthl = 'DiagnosticSignError', text = '', numhl = 'DiagnosticSignError' }
)

vim.fn.sign_define(
  'DiagnosticSignWarn',
  { texthl = 'DiagnosticSignWarn', text = '', numhl = 'DiagnosticSignWarn' }
)

vim.fn.sign_define(
  'DiagnosticSignHint',
  { texthl = 'DiagnosticSignHint', text = '', numhl = 'DiagnosticSignHint' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { texthl = 'DiagnosticSignInfo', text = '', numhl = 'DiagnosticSignInfo' }
)
