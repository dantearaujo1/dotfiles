require 'nvim-treesitter.install'.compilers = { "gcc" , "clang"}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp", "c", "javascript", "java", "html", "cmake", "python"},-- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {"markdown"}, -- List of parsers to ignore installing
  enable = true,              -- false will disable the whole extension
  autotag = {
    enable = true,
    filetypes = { "html", "js", "javascript", "javascriptreact", "svelte", "vue", "rescript", "typescript"},
  },
  highlight = {
    enable = true,
    disable = {"markdown"},  -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
	  enable = false,
  },
  yati = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    -- colors = {},
    -- termcolors = {}
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        -- ["iF"] = {
        --   python = "(function_definition) @function",
        --   cpp = "(function_definition) @function",
        --   c = "(function_definition) @function",
        --   java = "(method_declaration) @function",
        -- },

      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    markid = {enable = true}
  },
}



