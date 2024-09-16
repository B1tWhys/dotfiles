return {
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					lua = require("formatter.filetypes.lua").stylua,
					python = require("formatter.filetypes.python").black,
				},
			})
			vim.api.nvim_create_autocmd({ "BufWritePost" }, { command = "FormatWrite" })
		end,
	},
	"mfussenegger/nvim-lint",
}
