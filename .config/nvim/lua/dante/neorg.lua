require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/dev/notes/work",
          home = "~/notes/home",
          study = "~/notes/study",
        }
      }
    },
  }
}
