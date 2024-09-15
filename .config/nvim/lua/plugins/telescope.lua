return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep"},
	config = function()
		require("telescope").setup({
			extensions = {
				fyz_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			},
		})
	end,
}
