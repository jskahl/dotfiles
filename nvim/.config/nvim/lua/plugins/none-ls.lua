return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },

    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Formatting
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "vue", "javascript", "typescript", "css", "scss", "json" },
                }),
                null_ls.builtins.formatting.shellharden,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,

                -- Diagnostics
                require("none-ls.diagnostics.eslint_d"),
            },
        })

        on_attach =
            function(client)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_buf_set_keymap(
                        0,
                        "n",
                        "<leader>f",
                        "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
                        { noremap = true, silent = true }
                    )
                end
            end,
            -- Keymaps
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
