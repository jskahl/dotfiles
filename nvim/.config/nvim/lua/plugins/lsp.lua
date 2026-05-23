-- this config was made by theprimeagen.
-- currently (18th may, 2026), the only
-- thing I did was the configuration for
-- vuejs
--
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {},
        })
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "vtsls",
                "tailwindcss",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")

                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                                format = {
                                    enable = true,
                                    -- Put format options here
                                    -- NOTE: the value should be STRING!!
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                    },
                                },
                            },
                        },
                    })
                end,
                ["tailwindcss"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.tailwindcss.setup({
                        capabilities = capabilities,
                        filetypes = {
                            "html",
                            "css",
                            "scss",
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "vue",
                            "svelte",
                            "heex",
                            "erb",
                        },
                    })
                end,
            },
        })

        --- vue
        local vue_language_server_path = vim.fn.expand("$MASON/packages")
            .. "/vue-language-server"
            .. "/node_modules/@vue/language-server"

        local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
        local vue_plugin = {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
            configNamespace = "typescript",
        }

        local vtsls_config = {
            settings = {
                vtsls = {
                    tsserver = {
                        globalPlugins = {
                            vue_plugin,
                        },
                    },
                },
            },
            filetypes = tsserver_filetypes,
        }

        local ts_ls_config = {
            init_options = {
                plugins = {
                    vue_plugin,
                },
            },
            filetypes = tsserver_filetypes,
        }

        local vue_ls_config = {
            on_init = function(client)
                client.handlers["tsserver/request"] = function(_, result, context)
                    local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "ts_ls" })
                    local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
                    local clients = {}

                    vim.list_extend(clients, ts_clients)
                    vim.list_extend(clients, vtsls_clients)

                    if #clients == 0 then
                        vim.notify(
                            "Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.",
                            vim.log.levels.ERROR
                        )
                        return
                    end
                    local ts_client = clients[1]

                    local param = unpack(result)
                    local id, command, payload = unpack(param)
                    ts_client:exec_cmd({
                        title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                        command = "typescript.tsserverRequest",
                        arguments = {
                            command,
                            payload,
                        },
                    }, { bufnr = context.bufnr }, function(_, r)
                        local response = r and r.body
                        -- TODO: handle error or response nil here, e.g. logging
                        -- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
                        local response_data = { { id, response } }

                        ---@diagnostic disable-next-line: param-type-mismatch
                        client:notify("tsserver/response", response_data)
                    end)
                end
            end,
        }
        -- nvim 0.11 or above
        vim.lsp.config("vtsls", vtsls_config)
        vim.lsp.config("vue_ls", vue_ls_config)
        vim.lsp.config("ts_ls", ts_ls_config)
        vim.lsp.enable({ "vtsls", "vue_ls" }) -- If using `ts_ls` replace `vtsls` to `ts_ls`
        -- end vue

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            -- The formmating function below was made by 'Roundlay'.
            -- I got it from the github discussion in the nvim-cmp repo
            -- https://github.com/hrsh7th/nvim-cmp/discussions/609#discussioncomment-5727678
            formatting = {
                fields = { "abbr", "menu", "kind" },
                format = function(entry, item)
                    -- Define menu shorthand for different completion sources.
                    local menu_icon = {
                        nvim_lsp = "NLSP",
                        nvim_lua = "NLUA",
                        luasnip = "LSNP",
                        buffer = "BUFF",
                        path = "PATH",
                    }
                    -- Set the menu "icon" to the shorthand for each completion source.
                    item.menu = menu_icon[entry.source.name]

                    -- Set the fixed width of the completion menu to 60 characters.
                    -- fixed_width = 20

                    -- Set 'fixed_width' to false if not provided.
                    fixed_width = fixed_width or false

                    -- Get the completion entry text shown in the completion window.
                    local content = item.abbr

                    -- Set the fixed completion window width.
                    if fixed_width then
                        vim.o.pumwidth = fixed_width
                    end

                    -- Get the width of the current window.
                    local win_width = vim.api.nvim_win_get_width(0)

                    -- Set the max content width based on either: 'fixed_width'
                    -- or a percentage of the window width, in this case 20%.
                    -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
                    local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

                    -- Truncate the completion entry text if it's longer than the
                    -- max content width. We subtract 3 from the max content width
                    -- to account for the "..." that will be appended to it.
                    if #content > max_content_width then
                        item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
                    else
                        item.abbr = content .. (" "):rep(max_content_width - #content)
                    end
                    return item
                end,
            },

            window = {
                completion = { border = "rounded" },
                documentation = { border = "rounded" }
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "nvim_lsp" },
            }, {
                { name = "buffer" },
            }),
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
