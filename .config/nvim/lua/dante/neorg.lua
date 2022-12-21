require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {
      config = {
        markup_preset = "safe",
        markup = true,
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = 'nvim-cmp',
      }
    },
    ["core.norg.journal"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/dev/notes/work",
          home = "~/dev/notes/home",
          study = "~/dev/notes/study",
          gtd = "~/dev/notes/gtd",
        }
      }
    },
    ["core.integrations.telescope"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.export"] = {},
    ["core.export.markdown"] = {},
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode",
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = 'gtd'
      }
    },
    ["external.context"] = {},
    ["external.kanban"] = {},
  }
}
