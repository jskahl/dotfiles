return {
    {
        "kaarmu/typst.vim",
        ft = "typst",
    },

    {
        "chomosuke/typst-preview.nvim",
        version = "1.*",
        opts = {}, -- lazy.nvim will implicitly calls `setup {}`
        ft = "typst",
    },
}
