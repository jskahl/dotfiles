return {

    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
    },
    --	{
    --		"windwp/nvim-autopairs",
    --		event = "InsertEnter",
    --		config = true,
    --	},

    -- {
    --      "lukas-reineke/indent-blankline.nvim",
    --      main = "ibl",
    --      opts = {},
    -- },

    {
        "norcalli/nvim-colorizer.lua",
    },

    {
        "xiyaowong/transparent.nvim",

        config = function()
            require("transparent").setup({
                enable = true,
                extra_groups = {
                    "NormalFloat",    -- Floating windows
                    "NvimTreeNormal", -- Example plugin
                    "Pmenu",          -- Popup menu
                    "PmenuSel",       -- Selected item
                },
            })
        end,
    },
    {
        "S1M0N38/love2d.nvim",
        version = "2.*",
        opts = {},
        keys = {
            { "<leader>v",  ft = "lua",          desc = "LÖVE" },
            { "<leader>vv", "<cmd>LoveRun<cr>",  ft = "lua",   desc = "Run LÖVE" },
            { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua",   desc = "Stop LÖVE" },
        },
    },
    {
        "github/copilot.vim",
        event = "VeryLazy",
    },
    {
        {
            "m4xshen/hardtime.nvim",
            lazy = false,
            dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
            opts = { notification = true },
        },
    },
}
