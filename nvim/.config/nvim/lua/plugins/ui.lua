return {
    -- floating cmdline / search / messages
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "folke/snacks.nvim" },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                command_palette = true,       -- cmdline floats at the top center with the popup menu under it
                bottom_search = false,        -- false = floating "/" search too
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        },
    },

    -- smooth scroll + dashboard + notifications
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            scroll = { enabled = true },      -- smooth scrolling
            notifier = { enabled = true },    -- noice uses this for pretty notifications
            picker = { enabled = true },      -- the dashboard's file/grep buttons use it
            dashboard = {
                enabled = true,
                preset = {
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
        },
    },
}
