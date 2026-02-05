return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = "hyper",
            config = {
                week_header = { enable = false }, -- disable hyper's week header
                shortcut = {},        -- disable shortcut buttons
                project = { enable = false }, -- disable recent projects
                mru = { enable = false }, -- disable recent files
                packages = { enable = false }, -- disable lazy packages info

                header = {
                    " ",
                    " ",
                    " ",
                    " ",
                    " ",
                    " ",
                    " ",
                    " ",
                    "neovim",
                    " ",
                },
--                center = {
--                    {
--                        desc = "Welcome to Neovim",
--                    },
--                },
                footer = {},
            },
        })
    end,
}
