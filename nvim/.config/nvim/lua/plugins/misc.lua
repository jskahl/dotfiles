return {
--	{
--		"windwp/nvim-autopairs",
--		event = "InsertEnter",
--		config = true,
--	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({

			})
		end,
	},

    {
        "norcalli/nvim-colorizer.lua",
    },

    {
        "xiyaowong/transparent.nvim",
    },
}
