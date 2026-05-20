return {
    { "norcalli/nvim-colorizer.lua" }, -- Color highlighter
    { "vyfor/cord.nvim" }, -- Discord Rich Presence
    {"mfussenegger/nvim-jdtls"}, -- Java LSP
    {"barrettruth/live-server.nvim"}, -- HTML server 

    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                enable = true,
            })
        end,
    },
}
