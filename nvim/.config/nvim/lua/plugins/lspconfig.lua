return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            "saghen/blink.cmp",
        },
        lazy = false,

        config = function()
            local util = require("lspconfig.util")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Configure general LSP's
            vim.lsp.config("html", { capabilities = capabilities })
            vim.lsp.config("cssls", { capabilities = capabilities })
            vim.lsp.config("jsonls", { capabilities = capabilities })
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            vim.lsp.config("ast_grep", { capabilities = capabilities })
            vim.lsp.config("eslint", { capabilities = capabilities })
            vim.lsp.config("pylint", { capabilities = capabilities })
            vim.lsp.config("pylsp", { capabilities = capabilities })
            vim.lsp.config("shfmt", { capabilities = capabilities })
            vim.lsp.config("vuels", { capabilities = capabilities })
            vim.lsp.config("clangd", { capabilities = capabilities })
            vim.lsp.config("jdtls", { capabilities = capabilities })

            -- Defines root of dir to find Vue LS
            local root = util.root_pattern("jsconfig.json", "package.json", ".git")(vim.fn.getcwd())

            -- Configure ts_ls to work in Vue
            if root and vim.fn.filereadable(root .. "/package.json") == 1 then
                local vue_path = root .. "/node_modules/@vue/typescript-plugin"
                local ts_path = root .. "/node_modules/typescript/lib"

                if vim.fn.isdirectory(vue_path) == 1 then
                    vim.lsp.config("ts_ls", {
                        capabilities = capabilities,
                        root_dir = root,
                        -- Tells ts_ls what to load
                        init_options = {
                            -- Loads vue plugin based on the path provided
                            plugins = {
                                {
                                    name = "@vue/typescript-plugin",
                                    location = vue_path,
                                    languages = { "vue" },
                                },
                            },
                            ts_ls = {
                                tsdk = ts_path,
                            },
                        },
                        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                        cmd = { "typescript-language-server", "--stdio" },
                    })
                end
            end

            vim.lsp.config("tinymist", {
                capabilities = capabilities,
                settings = {
                    formatterMode = "typstyle",
                    exportPdf = "onType",
                    semanticTokens = "disable",
                },
            })

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
            vim.keymap.set("n", "<leader>md", vim.lsp.buf.rename, {})
        end,
    },
}
