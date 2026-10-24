return {
	{
		"tweekmonster/django-plus.vim",
		lazy = false,
		config = function()
			-- Filetype detection for Django templates
			vim.filetype.add({
				extension = {
					htmldjango = "htmldjango",
					djhtml = "htmldjango",
				},
				pattern = {
					[".*%.html%.django"] = "htmldjango",
					[".*%.django%.html"] = "htmldjango",
				},
			})
		end,
	},
}