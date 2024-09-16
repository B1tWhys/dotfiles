return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"c",
				"css",
				"csv",
				"cuda",
				"dart",
				"dockerfile",
				"go",
				"html",
				"java",
				"javascript",
				"json",
				"jq",
				"latex",
				"make",
				"nginx",
				"php",
				"kotlin",
				"lua",
				"luadoc",
				"proto",
				"python",
				"sql",
				"svelte",
				"swift",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
			},
			ignore_install = {},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			modules = {},
		})
	end,
}