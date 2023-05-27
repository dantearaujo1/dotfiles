vim.g.tpipeline_restore = 1
vim.g.tpipeline_split = 1
vim.g.tpipeline_clearstl = 1
vim.g.ccc_option_highlighter_auto_enable = 1
-- LeetCode Options
vim.g.leetcode_browser = 'firefox'
vim.g.leetcode_solution_filetype = 'javascript'
vim.g.leetcode_problemset = 'all'

local ccc =require("ccc")
ccc.setup({
  ccc_option_highlighter_auto_enable = true,
})

local neoscroll = require('neoscroll')
neoscroll.setup()



