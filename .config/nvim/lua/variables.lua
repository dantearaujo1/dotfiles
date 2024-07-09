local g = vim.g
local eval = vim.api.nvim_eval
local utility = require('utils')

if utility.getOS() == "Windows" then
	g.python3_host_prog = 'D:\\Code\\Installed Languages\\Python\\Python 3.8\\python'
elseif utility.getOS() == "Linux" then
	g.python3_host_prog = '/usr/bin/python3.12'
elseif utility.getOS() == "macOS" then
end


-- Disable python2 support
g.loaded_python_provider = 0

--{{ Disable loading certain plugins
--Do not load netrw by default since I do not use it, see
--https://github.com/bling/dotvim/issues/4
g.loaded_netrwPlugin = 1

--Do not load tohtml.vim
g.loaded_2html_plugin = 1

--Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
--related to checking files inside compressed files)
g.loaded_zipPlugin = 1
g.loaded_gzip = 1
g.loaded_tarPlugin = 1

--Do not use builtin matchit.vim and matchparen.vim
g.loaded_matchit = 1
g.loaded_matchparen = 1

-- PLUGINS VARIABLES CONFIGURATIONS ==========================================
