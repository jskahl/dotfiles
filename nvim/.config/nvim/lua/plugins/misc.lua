return {
    { "norcalli/nvim-colorizer.lua" }, -- Color highlighter
    { "vyfor/cord.nvim" }, -- Discord Rich Presence

    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                enable = true,
                extra_groups = {
                    "NormalFloat", -- Floating windows
                    "NvimTreeNormal", -- Example plugin
                    "Pmenu", -- Popup menu
                    "PmenuSel", -- Selected item
                },
            })
        end,
    },
}
