return {
	{
		"windwp/nvim-autopairs",
		-- event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
			})
		end,
	},
}
