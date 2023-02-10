function setLinesForReplit(timer)
  vim.opt.lines = 36
  vim.opt.laststatus = 0
end

if vim.g.started_by_firenvim ~= nil then
  local timer = vim.loop.new_timer()
  timer:start(1000,0, vim.schedule_wrap(setLinesForReplit(timer)) )
end

