return {
	{
		"L3MON4D3/LuaSnip",
		lazy = false,
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_lua").load({
				paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
			})
		end,
	},
}