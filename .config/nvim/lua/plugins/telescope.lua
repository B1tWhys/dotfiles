return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			local ts = require("telescope")
			ts.setup({
				extensions = {
					fyz_native = {
						override_generic_sorter = false,
						override_file_sorter = true,
					},
					["ui-select"] = {},
				},
			})
			ts.load_extension("ui-select")
		end,
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
}
