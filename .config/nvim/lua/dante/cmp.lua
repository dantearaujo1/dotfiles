local cmp = require('cmp')
local utils = require('utils')
local luasnip = require'luasnip'
local lspkind = require('lspkind')
local copilot = require('copilot.suggestion')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local sym_map = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
  Copilot = "",
}

cmp.setup {
  experimental = {
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  -- You must set mapping if you want.
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
    winhightlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    col_offset = -3,
    side_padding = 0,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible()  then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {"i","s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  --
  -- -- You should specify your *installed* sources.
  sources = cmp.config.sources({
      -- Copilot Source
      { name = 'copilot', group_index = 2 },
      { name = 'nvim_lsp', group_index = 2 },
      { name = 'luasnip', group_index = 2 },
      { name = 'nvim_lua', group_index = 2  },
      { name = 'neorg', group_index = 2  },
      { name = 'path', keyword_length = 2  },
      { name = 'buffer', keyword_length = 4 },
      { name = 'latex_symbols', keyword_length = 2  },
    },{
     {name = 'buffer'},
    }),
  formatting = {
    fields = {
      'kind','abbr','menu'
    },
    expandable_indicator = true,
    format = function (entry, vim_item)
      local kind = lspkind.cmp_format({ mode = 'symbol_text', preset = 'default', maxwidth = 50, menu = ({ nvim_lsp = "[LSP]", luasnip = "[LuaSnip]", nvim_lua = "[Lua]", latex_symbols = "[Latex]", buffer = "[Buffer]", })})(entry,vim_item)
      local strings = vim.split(kind.kind, "%s", {triempty = true})
      kind.kind = "" .. (strings[1] or "") .. ""
      kind.menu = "    (" .. (strings[2] or "") .. ")"
      return kind
    end,
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      require("clangd_extensions.cmp_scores"),
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    }
  }
}

cmp.setup.cmdline({ '/', '?' }, {
  -- mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' }
  })
})

local function set_trigger(trigger)
    vim.b.copilot_suggestion_auto_trigger = trigger
    vim.b.copilot_suggestion_hidden = not trigger
end
cmp.event:on('menu_opened', function()
    if copilot.is_visible() then
        copilot.dismiss()
    end
    set_trigger(false)
end)

-- Disable suggestions when inside a snippet.
cmp.event:on('menu_closed', function()
    set_trigger(not luasnip.expand_or_locally_jumpable())
end)
vim.api.nvim_create_autocmd('User', {
    pattern = { 'LuasnipInsertNodeEnter', 'LuasnipInsertNodeLeave' },
    callback = function()
        set_trigger(not luasnip.expand_or_locally_jumpable())
    end,
})

