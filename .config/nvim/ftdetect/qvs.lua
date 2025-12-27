vim.filetype.add({
  extension = {
    qvs = "qvs",
    qvw = "qvs",  -- optional
    qlik = "qvs", -- optional
  },
  -- optional: detect by filename
  filename = {
    ["loadscript.txt"] = "qvs",
    ["script.qvs"] = "qvs",
  },
})
vim.lsp.enable("qlik_ls")
