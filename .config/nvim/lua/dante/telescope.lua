local telescope = require'telescope'
local util = require'utils'
local project_actions = require("telescope._extensions.project.actions")
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
local action_set = require('telescope.actions.set')
local action_state = require('telescope.actions.state')


telescope.setup {
	defaults = {
    file_ignore_patterns = {
      "node_modules/.*",
      ".vscode/.*",
      ".git/.*",
      ".venv/.*",
      "undodir/.*"
    },
    preview = {
      check_mime_type = true
    },
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				-- ["<C-n>"] = false,
				-- ["<C-p>"] = false,
				["<C-n>"] = "move_selection_next",
				["<C-p>"] = "move_selection_previous",
				["<M-p>"] = action_layout.toggle_preview,
        ['<C-g>'] = function(prompt_bufnr)
          -- Use nvim-window-picker to choose the window by dynamically attaching a function

          local picker = action_state.get_current_picker(prompt_bufnr)
          picker.get_selection_window = function(picker, entry)
            local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
            -- Unbind after using so next instance of the picker acts normally
            picker.get_selection_window = nil
            return picked_window_id
          end

          return action_set.edit(prompt_bufnr, 'edit')
        end,
			},
			n = {

			}
		},
  }
}
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
-- if (util.getOS() == 'Linux') then
  telescope.setup{
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
      buffers = {
        mappings = {
          i = {
           ["<m-d>"] = actions.delete_buffer + actions.move_to_top,
          }
        }
      },
      find_files = {
          on_input_filter_cb = function(prompt)
            local find_colon = string.find(prompt, ":")
            if find_colon then
              local ret = string.sub(prompt, 1, find_colon - 1)
              vim.schedule(function()
                local prompt_bufnr = vim.api.nvim_get_current_buf()
                local picker = action_state.get_current_picker(prompt_bufnr)
                local lnum = tonumber(prompt:sub(find_colon + 1))
                if type(lnum) == "number" then
                  local win = picker.previewer.state.winid
                  local bufnr = picker.previewer.state.bufnr
                  local line_count = vim.api.nvim_buf_line_count(bufnr)
                  vim.api.nvim_win_set_cursor(win, { math.max(1, math.min(lnum, line_count)), 0 })
                end
              end)
              return { prompt = ret }
            end
          end,
          attach_mappings = function()
            actions.select_default:enhance {
              post = function()
                -- if we found something, go to line
                local prompt = action_state.get_current_line()
                local find_colon = string.find(prompt, ":")
                if find_colon then
                  local lnum = tonumber(prompt:sub(find_colon + 1))
                  vim.api.nvim_win_set_cursor(0, { lnum, 0 })
                end
              end,
            }
            return true
          end,
        },
    },
    extensions ={
      lazy = {
          -- Optional theme (the extension doesn't set a default theme)
          -- Whether or not to show the icon in the first column
          show_icon = true,
          -- Mappings for the actions
          mappings = {
            open_in_browser = "<C-o>",
            open_in_file_browser = "<M-b>",
            open_in_find_files = "<C-f>",
            open_in_live_grep = "<C-g>",
            open_plugins_picker = "<C-b>", -- Works only after having called first another action
            open_lazy_root_find_files = "<C-r>f",
            open_lazy_root_live_grep = "<C-r>g",
          },
      },
      file_browser ={
        hijack_netrw = true,
        mappings = {
          ["i"] = {

          },
          ["n"] = {

          }
        },
      },
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      },
      repo = {
        list = {
          search_dirs = {
            "~/dev/projects",
            "~/.local/share/nvim"
          }
        }
      },
      openbrowser = {
        bookmarks = {
          ['github'] = 'https://github.com/dantearaujo1',
          ['reddit'] = 'https://reddit.com/r/neovim'
        },
        bookmark_filepath = vim.fn.stdpath("config") .. "/telescope_openbrowser_bookmarks"
      },
      project = {
        base_dirs = {
          {'~/dev/projects/arduino', max_depth = 2},
          {'~/dev/projects/c', max_depth = 2},
          {'~/dev/projects/cpp', max_depth = 2},
          {'~/dev/projects/faculdade', max_depth = 2},
          {'~/dev/projects/java', max_depth = 2},
          {'~/dev/projects/javascript', max_depth = 2},
          {'~/dev/projects/processing', max_depth = 2},
          {'~/dev/projects/lua', max_depth = 2},
          {'~/dev/projects/python', max_depth = 2},
          {'~/dev/projects/sql', max_depth = 2},
          {'~/dev/projects/typescript', max_depth = 2},
          {'~/dev/projects/devops', max_depth = 2},
          {'~/dev/projects/bash', max_depth = 2},
        },
        hidden_files = true, -- default: false
        theme = "dropdown",
        order_by = "asc",
        search_by = "title",
        sync_with_nvim_tree = true, -- default false
        -- default for on_project_selected = find project files
        on_project_selected = function(prompt_bufnr)
          -- Do anything you want in here. For example:
          -- project_actions.change_working_directory(prompt_bufnr, false)
          project_actions.browse_project_files(prompt_bufnr)
          -- require("harpoon.ui").nav_file(1)
        end
      }
    }
  }
-- end

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('env')
require('telescope').load_extension('repo')
require('telescope').load_extension('dap')
require('telescope').load_extension('notify')
require('telescope').load_extension('lazy')
require('telescope').load_extension('project')
require('telescope').load_extension('openbrowser')
require('telescope').load_extension('luasnip')

local M = {

}
M.search_from_home = function()
  local system_name = util.getOS()
  if system_name == "Windows" then
    require("telescope.builtin").find_files({
      prompt_title = "< DANTE  - Windows>",
      cwd = "~/",
      hidden = true,
    })
  elseif system_name == "Linux" then
    require("telescope.builtin").find_files({
      prompt_title = "< DANTE - Linux >",
      cwd = "~/",
    })
  end
end
M.search_notes = function()
  local system_name = util.getOS()
  if system_name == "Windows" then
  elseif system_name == "Linux" then
    require("telescope.builtin").find_files({
      prompt_title = "< DANTE - Notes >",
      cwd = "~/Notes/",
    })
  end
end
M.search_dotfiles = function()
  local system_name = util.getOS()
  if system_name == "Windows" then
    require("telescope.builtin").find_files({
      prompt_title = "< NVIM RC - DANTE  - Windows>",
      cwd = "~\\.config\\nvim",
      search_dirs = {"lua"},
    })
  elseif system_name == "Linux" then
    require("telescope.builtin").find_files({
      prompt_title = "< NVIM RC - DANTE - Linux >",
      cwd = "~/.config/nvim",
    })
  end
end
M.search_configs = function()
  local system_name = util.getOS()
  if system_name == "Windows" then
    require("telescope.builtin").find_files({
      prompt_title = "< CONFIGS - DANTE  - Windows>",
      cwd = "~\\.config",
      search_dirs = {"lua"},
    })
  elseif system_name == "Linux" then
    require("telescope.builtin").find_files({
      prompt_title = "< CONFIGS - DANTE - Linux >",
      cwd = "~/.config",
      search_dirs = {"nvim","kitty","qutebrowser","hypr","waybar","wofi"},
    })
  end
end

M.grep_dotfiles = function()
  local system_name = util.getOS()
  if system_name == "Windows" then
    require("telescope.builtin").live_grep({
      prompt_title = "< GREP NVIM RC - DANTE  - Windows>",
      cwd = "~\\.config\\nvim",
      search_dirs = {"lua"},
    })
  elseif system_name == "Linux" then
    require("telescope.builtin").live_grep({
      prompt_title = "< GREP NVIM RC - DANTE - Linux >",
      cwd = "~/.config/nvim",
    })
  end
end

return M
