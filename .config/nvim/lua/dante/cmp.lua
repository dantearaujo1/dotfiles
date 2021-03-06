local cmp = require('cmp')
local luasnip = require'luasnip'
local lspkind = require('lspkind')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

-- If you want insert '(' after select function or method item
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = { tex = '' }}))

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  -- You must set mapping if you want.
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),

    ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible()  then
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
  },

  -- You should specify your *installed* sources.
  sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'spell' },
      { name = 'tags' },
      { name = 'calc' },
      { name = 'latex_symbols' },
    },
  formatting = {
    format = lspkind.cmp_format({
      -- with_text = true, Deprecated
      mode = 'symbol',
      maxwidth = 50,
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })
      -- before = function (entry, vim_item)
        -- ...
        -- return vim_item
      -- end
    })
  }
}

require("luasnip/loaders/from_vscode").load({ "D:/Code/Configurations/nvim/nvim-data/site/pack/packer/start/friendly-snippets/snippets"})
