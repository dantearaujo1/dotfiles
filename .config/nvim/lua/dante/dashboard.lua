local dash = require("dashboard")
vim.g.better_whitespace_filetypes_blacklist = { "dashboard" }
vim.g.indent_blankline_filetype_exclude = { "dashboard" }
local git_dashboard = require('git-dashboard-nvim').setup {
  fallback_header = [[
 ▓█████▄  ▄▄▄      ███▄    █ ▄▄▄█████▓ ▓█████
 ▒██▀ ██▌▒████▄    ██ ▀█   █ ▓  ██▒ ▓▒ ▓█   ▀
 ░██   █▌▒██  ▀█▄ ▓██  ▀█ ██▒▒ ▓██░ ▒░ ▒███
▒░▓█▄   ▌░██▄▄▄▄██▓██▒  ▐▌██▒░ ▓██▓ ░  ▒▓█  ▄
░░▒████▓ ▒▓█   ▓██▒██░   ▓██░  ▒██▒ ░ ▒░▒████
░ ▒▒▓  ▒ ░▒▒   ▓▒█░ ▒░   ▒ ▒   ▒ ░░   ░░░ ▒░
  ░ ▒  ▒ ░ ░   ▒▒ ░ ░░   ░ ▒░    ░    ░ ░ ░
  ░ ░  ░   ░   ▒     ░   ░ ░   ░          ░
    ░          ░           ░          ░   ░
  ]]
}

dash.setup({
 theme = 'hyper',
    config = {
      week_header = {
       enable = false,
      },
      header = git_dashboard,
      packages = {enabled = true},
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        { desc = ' New File', group = 'DiagnosticWarn', action = 'ene | startinsert', key = 'n' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Github',
          group = 'DiagnosticHint',
          action = 'OpenGithubProject dantearaujo1/dotfiles.git',
          key = 'a',
        },
        {
          desc = ' Dotfiles',
          group = 'Number',
          action = 'lua require("dante.telescope").search_dotfiles()',
          key = 'c',
        },
      },
    },
})
