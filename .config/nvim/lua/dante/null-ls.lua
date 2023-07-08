local DEFAULT_SETTINGS = {
	ensure_installed = {},
	automatic_installation = true,
}

require("mason-null-ls").setup({
  ensure_installed = {},
  automatic_installation = true,
  handlers ={},
})
require("null-ls").setup(DEFAULT_SETTINGS)
