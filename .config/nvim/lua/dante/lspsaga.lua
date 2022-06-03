local saga = require 'lspsaga'

saga.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  infor_sign = "⭐",
  warn_sign = "⚠ ",
  error_sign = "❌",
  hint_sign = "❕",
  dianostic_header_icon = '',
  code_action_icon = '💡',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = false,
  },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = { 'o', '<Esc>'}, vsplit = 'v',split = 's',quit = { 'q', '<C-c>', '<Esc>' }, scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = {'q','<C-c>', '<Esc>'},exec = '<CR>'
  },
  rename_action_keys = {
    quit = { '<C-c>', '<Esc>' } , exec = '<CR>'  -- quit can be a table
  },
  definition_preview_icon = '  ',
-- "single" "double" "round" "plus"
  border_style = "round",
  rename_prompt_prefix = '➤',
}

