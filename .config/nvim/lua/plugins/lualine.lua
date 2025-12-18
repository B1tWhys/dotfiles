return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox_dark",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename" },
					lualine_c = {},
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location", "selectioncount" },
				},
				tabline = {
					lualine_a = {
						{
							"tabs",
							mode = 1,
							symbols = {
								modified = "",
							},
							max_length = vim.o.columns * 2 / 3,
						},
					},
				},
			})
			vim.opt.showtabline = 1
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
