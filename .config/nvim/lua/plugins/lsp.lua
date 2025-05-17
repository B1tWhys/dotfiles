return {
	{
		"mason-org/mason.nvim",
		config = function(opts)
			local mason = require("mason")
			mason.setup(opts)
			vim.keymap.set("n", "<leader>M", ":Mason\n")
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{
		"mason-org/mason-lspconfig.nvim",
		config = true,
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
	},
}
