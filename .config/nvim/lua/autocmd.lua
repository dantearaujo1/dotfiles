local cmd = vim.cmd
-- --------------------------------------------------------------------------
-- AutoCommands
-- --------------------------------------------------------------------------
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- Dont auto comment new line

cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]) -- Command for recompile all plugins
-- Remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- Highlight on Yank
cmd([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
    augroup end
    ]])

