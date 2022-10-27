local null_ls = require("null-ls")
require("mason-null-ls").setup()

local DEFAULT_SETTINGS = {
	-- A list of sources to install if they're not already installed.
	-- This setting has no relation with the `automatic_installation` setting.
	ensure_installed = {},
	-- Run `require("null-ls").setup`.
	-- Will automatically install masons tools based on selected sources in `null-ls`.
	-- Can also be an exclusion list.
	-- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
	automatic_installation = true,
}

require("mason-null-ls").setup_handlers({
	function(source_name)
		-- all sources with no handler get passed here
	end,
	stylua = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.stylua)
	end,
	luacheck = function(source_name, methods)
		null_ls.register(null_ls.builtins.diagnostics.luacheck.with({
      diagnostic_config = {
        virtual_text = false,
      },
    })
    )
	end,
	jq = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.jq)
	end,
	clang_format = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.clang_format)
	end,
	prettierd = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.prettierd)
	end,
})
require("null-ls").setup()
