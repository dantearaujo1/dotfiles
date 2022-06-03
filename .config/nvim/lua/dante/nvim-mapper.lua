require("nvim-mapper").setup({
    no_map = false,                                        -- do not assign the default keymap (<leader>MM)
    search_path = os.getenv("HOME") .. "/nvim/lua" -- default config search path is ~/.config/nvim/lua
})
