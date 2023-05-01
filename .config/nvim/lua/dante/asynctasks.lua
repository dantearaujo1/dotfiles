local g = vim.g

g.asyncrun_open = 6
g.asyncrun_rootmarks = { ".git",".svn",'.root','.project','.hg','src' }
if vim.fn.exists('$TMUX') then
  g.asyncrun_term_pos = "tmux"
else
  g.asyncrun_term_pos = "bottom"
end
