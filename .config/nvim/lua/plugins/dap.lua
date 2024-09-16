return {
	{ "mfussenegger/nvim-dap", build = { ":helptags ALL" } },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {
			library = { plugins = { "nvim-dap-ui" }, types = true },
		},
	},
}
