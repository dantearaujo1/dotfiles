local g = vim.g

g.asyncrun_open = 6
g.asyncrun_rootmarks = { ".git",".svn",'.root','.project','.hg','src' }
if not vim.fn.executable('tmux') then
  g.asyncrun_term_pos = "tmux"
else
  g.asyncrun_term_pos = "toggleterm"
end

