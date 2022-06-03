local telescope = require'telescope'
local util = require'utils'

telescope.setup {
	defaults = {
    file_ignore_patterns = {
      "node_modules/.*",
      ".git/.*",
      "undodir/.*"
    },
    preview = {
      check_mime_type = false
    },
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-n>"] = false,
				["<C-p>"] = false,
			},
			n = {

			}
		},
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      },
      file_browser ={
        theme = "ivy",
        hijack_netrw = true,
        mappings = {
          ["i"] = {

          },
          ["n"] = {

          }
        },
      },
      bookmarks = {
        selected_browser = 'edge',
        -- url_open_command = 'open',
        url_open_plugin = 'open_browser',
        full_path = true,
        firefox_profile_name = nil,
      },
      project = {
        base_dirs = {
          { '~/dev/projects/processing/smd/', max_depth = 4 },
        },
        hidden_files = true,
        theme = "dropdown"
      },
      media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg", "pdf", "webm"},
        find_cmd = "rg"
      }
    }
  }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('media_files')
require('telescope').load_extension('packer')
require('telescope').load_extension('project')
require('telescope').load_extension('env')
require('telescope').load_extension('repo')
require('telescope').load_extension('dap')
require('telescope').load_extension('bookmarks')
require('telescope').load_extension('emoji')
require('telescope').load_extension('notify')
-- :Telescope symbols

local M = {

}
M.search_dotfiles = function()
  local system_name = util.getOS()
  if system_name == "Windows" then
    require("telescope.builtin").find_files({
      prompt_title = "< NVIM RC - DANTE  - Windows>",
      cwd = "~/nvim",
    })
  elseif system_name == "Linux" then
    require("telescope.builtin").find_files({
      prompt_title = "< NVIM RC - DANTE - Linux >",
      cwd = "~/.config/nvim",
    })
  end
end

return M
