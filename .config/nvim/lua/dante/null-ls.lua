require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.diagnostics.standardjs,
        require("null-ls").builtins.diagnostics.cppcheck,
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.diagnostics.jsonlint,
        require("null-ls").builtins.diagnostics.ktlint,
        require("null-ls").builtins.diagnostics.luacheck,
        require("null-ls").builtins.completion.spell,
    },
})
