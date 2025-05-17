return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			local api = require("nvim-tree.api")
			local toggleKeybind = "<C-t>"
			local function my_on_attach(bufnr)
				api.config.mappings.default_on_attach(bufnr)

				local baselineOpts = { buffer = bufnr, silent = true }
				local function fancyOpts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true }
				end

				vim.keymap.set("n", toggleKeybind, api.tree.close, fancyOpts("Toggle tree"))
				vim.keymap.set("n", "t", api.node.open.tab, fancyOpts("Open in tab"))
				vim.keymap.set("n", "h", api.node.open.horizontal, fancyOpts("Open in horizontal split"))
				vim.keymap.set("n", "v", api.node.open.vertical, fancyOpts("Open in vertical split"))
				vim.keymap.del("n", "s", baselineOpts)
				vim.keymap.set("n", "dd", api.fs.remove, baselineOpts)
				vim.keymap.set("n", "rn", api.fs.rename, baselineOpts)
				vim.keymap.set("n", "<C-n>", api.fs.create, baselineOpts)
			end

			require("nvim-tree").setup({ on_attach = my_on_attach })

			vim.keymap.set("n", toggleKeybind, api.tree.focus)
		end,
	},
}
