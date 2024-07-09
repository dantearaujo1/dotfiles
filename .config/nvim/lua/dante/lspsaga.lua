local config = {
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
-- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "shadow",
    winblend = 10,
    colors = {
      normal_bg = "NONE",
    },
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = false,
  },
  hover = {
    max_width = 0.6,
    open_link = 'go',
    open_browser = '!qutebrowser',
  },
}

require("lspsaga").setup({config})


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
  { texthl = 'DiagnosticSignHint', text = '', numhl = 'DiagnosticSignHint' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { texthl = 'DiagnosticSignInfo', text = '', numhl = 'DiagnosticSignInfo' }
)

local keymap = vim.keymap.set

vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true })
vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true })
-- LSP finder - Find the symbol's definition
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>")
keymap("n", "<leader>gR", "<cmd>Lspsaga rename ++project<CR>")

-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
-- Use <C-t> to jump back
keymap("n", "gtp", "<cmd>Lspsaga peek_type_definition<CR>")
-- Go to type definition
keymap("n","gtP", "<cmd>Lspsaga goto_type_definition<CR>")
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
-- Show workspace diagnostics
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump with filters such as only jumping to an error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc ++silent<CR>")


-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
keymap('n', '<leader>K', "<cmd>Lspsaga hover_doc ++keep<CR>")
-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
-- Floating terminal
keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
