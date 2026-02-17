return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    opts = {
        view_options = {
            show_hidden = true,
        },
        default_file_explorer = true,
    },
}
