return {
    { "norcalli/nvim-colorizer.lua" },  -- Color highlighter
    { "Myriad-Dreamin/tinymist" },      -- Typst helper
    { "chomosuke/typst-preview.nvim" }, -- Typst live preview
    {
        "yousefhadder/markdown-plus.nvim",
        ft = "markdown",
        opts = {},
    },


    {
        "xiyaowong/transparent.nvim",
        config = function()
            require('transparent').setup {
                extra_groups = {
                    "NeoTreeNormal",
                    "NeoTreeNormalNC",
                    "NormalFloat",
                },
            }
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                      -- neo-tree will lazily load itself
    },

}
