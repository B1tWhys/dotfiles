return {
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					lua = require("formatter.filetypes.lua").stylua,
					python = require("formatter.filetypes.python").black,
					go = require("formatter.filetypes.go").goimports,
					javascript = require("formatter.filetypes.javascript").prettier,
					html = require("formatter.filetypes.html").prettier,
					sh = require("formatter.filetypes.sh").shfmt,
				},
			})
			vim.api.nvim_create_autocmd({ "BufWritePost" }, { command = "FormatWrite" })
		end,
	},
	"mfussenegger/nvim-lint",
}
