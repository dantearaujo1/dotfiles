local dash = require("dashboard")
vim.g.better_whitespace_filetypes_blacklist = { "dashboard" }
vim.g.indent_blankline_filetype_exclude = { "dashboard" }

dash.setup({
 theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      packages = {enabled = true},
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
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
          key = 'd',
        },
      },
    },
})
