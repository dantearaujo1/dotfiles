_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd

local M = {}

function M.pick_asynctask()
  -- Get the list of tasks from asynctasks.vim
  local tasks = vim.api.nvim_call_function("asynctasks#source", {50})

  if vim.tbl_isempty(tasks) then
    return
  end

  -- Create a table of items for the snacks picker
  local items = {}
  for _, task in ipairs(tasks) do
    table.insert(items, {
      command=task[1],
      idx=task[1],
      text=task[1],
      file=task[2]
    })
  end


  -- Launch the snacks picker
  require("snacks").picker({
    items = items,
    format = "text",
    preview = "none",
    source = "asynctasks",
    matcher = {
      fuzzy = true, -- use fuzzy matching
      smartcase = true, -- use smartcase
      ignorecase = true, -- use ignorecase
      sort_empty = true, -- sort results when the search string is empty
      filename_bonus = false, -- give bonus for matching file names (last part of the path)
      file_pos = false, -- support patterns like `file:line:col` and `file:line`
      cwd_bonus = false, -- give bonus for matching files in the cwd
      frecency = true, -- frecency bonus
      history_bonus = true, -- give more weight to chronological order
    },
    sort = {
      fields = { "score:desc", "#text", "idx" },
    },
    debug = {
      scores = false, -- show scores in the list
      leaks = false, -- show when pickers don't get garbage collected
      explorer = false, -- show explorer debug info
      files = false, -- show file debug info
      grep = false, -- show file debug info
      proc = false, -- show proc debug info
      extmarks = false, -- show extmarks errors
    },
    prompt = "Task: ",
    layout = { preset = "vscode" },
    confirm = function(picker, item)
      picker:close() -- Close the picker window
      vim.cmd("AsyncTask" .. " " .. item.command)
    end,
  })
end

return M
