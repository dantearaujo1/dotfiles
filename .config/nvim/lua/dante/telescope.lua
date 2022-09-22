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
    },
    pickers = {
      colorscheme = {
        enable_preview = true
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
          end,on_input_filter_cb = function(prompt)
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
    }
  }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
}
if (util.getOS() == 'Linux') then
  telescope.setup{
    extensions ={
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
        media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg", "pdf", "webm"},
        find_cmd = "rg"
        }
    }
  }
	require('telescope').load_extension('file_browser')
	require('telescope').load_extension('media_files')
	require('telescope').load_extension('fzf')
end
require('telescope').load_extension('packer')
require('telescope').load_extension('live_grep_args')
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

return M
