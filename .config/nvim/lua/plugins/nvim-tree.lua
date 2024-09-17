return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			local api = require("nvim-tree.api")
			local toggleKeybind = "<leader>t"
			local function on_attach(bufnr)
				api.config.mappings.default_on_attach(bufnr)

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true }
				end

				vim.keymap.set("n", toggleKeybind, api.tree.close, opts("Toggle tree"))
				vim.keymap.set("n", "t", api.node.open.tab, opts("Open in tab"))
				vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open in horizontal split"))
				vim.keymap.set("n", "v", api.node.open.vertical, opts("Open in vertical split"))
				vim.keymap.del("n", "s", { buffer = bufnr })
				vim.keymap.set("n", "dd", api.fs.remove)
				vim.keymap.set("n", "rn", api.fs.rename)
				vim.keymap.set("n", "<C-n>", api.fs.create)
			end

			require("nvim-tree").setup({ on_attach = on_attach })

			vim.keymap.set("n", toggleKeybind, api.tree.focus)
		end,
	},
}
