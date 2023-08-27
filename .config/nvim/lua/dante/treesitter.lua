require 'nvim-treesitter.install'.compilers = { "gcc" , "clang"}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp", "c", "javascript", "java", "html", "cmake", "python", 'lua','rust', 'markdown', 'markdown_inline',"typescript"},-- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  enable = true,              -- false will disable the whole extension
  autotag = {
    enable = true,
    filetypes = { "html", "js", "javascript", "javascriptreact", "svelte", "vue", "rescript", "typescript","typescriptreact"},
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
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "<c-backspace>",
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    query = 'rainbow-parens',
    strategy = require('ts-rainbow').strategy.global,
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
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.outer",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

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
    markid = {enable = true},
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    }
  },
}



