local telescope = require'telescope'
local util = require'utils'

telescope.setup {
	defaults = {
    file_ignore_patterns = {
      "node_modules/.*",
      ".git/.*",
      ".venv/.*",
      "undodir/.*"
    },
    preview = {
      check_mime_type = false
    },
		mappings = {
			i = {
				-- ["<C-j>"] = "move_selection_next",
				-- ["<C-k>"] = "move_selection_previous",
				-- ["<C-n>"] = false,
				-- ["<C-p>"] = false,
				["<C-n>"] = "move_selection_next",
				["<C-p>"] = "move_selection_previous",
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
      lazy = {
          -- Optional theme (the extension doesn't set a default theme)
          theme = "ivy",
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
-- if (util.getOS() == 'Linux') then
  telescope.setup{
    extensions ={
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
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
