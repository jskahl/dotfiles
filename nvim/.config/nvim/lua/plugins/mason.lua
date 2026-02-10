return {
	"williamboman/mason.nvim", -- 'Package' manager
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- Integrates mason with LSP
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Integrates mason with formatters
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

        -- Ensure LSPs are installed
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"vue_ls",
			},
		})

        -- Ensure that formatters are installed
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
			},
		})
	end,
}
