return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>n", "<cmd>Neotree toggle reveal<cr>", desc = "Toggle file tree" },
    },
    opts = {
        close_if_last_window = true,
        popup_border_style = "rounded",
        window = {
            position = "left",
            width = 32,
        },
        filesystem = {
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = true,
            },
        },
    },
}
