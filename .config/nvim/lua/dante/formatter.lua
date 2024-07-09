local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.blackd,
  }
}
return opts
