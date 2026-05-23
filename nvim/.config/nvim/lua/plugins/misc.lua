return {
	{ "norcalli/nvim-colorizer.lua" }, -- Color highlighter
	{
		"yousefhadder/markdown-plus.nvim",
		ft = "markdown",
		opts = {},
	},

	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				enable = true,
			})
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
		lazy = false, -- neo-tree will lazily load itself
	},
}
