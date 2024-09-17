return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- Go config
			dap.adapters.delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
					-- add this if on windows, otherwise server won't open successfully
					-- detached = false
				},
			}

			-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
			dap.configurations.go = {
				{
					type = "delve",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				-- {
				-- 	type = "delve",
				-- 	name = "Debug test", -- configuration for debugging test files
				-- 	request = "launch",
				-- 	mode = "test",
				-- 	program = "${file}",
				-- },
				-- -- works with go.mod packages and sub packages
				-- {
				-- 	type = "delve",
				-- 	name = "Debug test (go.mod)",
				-- 	request = "launch",
				-- 	mode = "test",
				-- 	program = "./${relativeFileDirname}",
				-- },
			}
		end,
		build = { ":helptags ALL" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {
			controls = {
				element = "stacks",
			},
			layouts = {
				{ -- bottom (non-dbg)
					elements = {
						{
							id = "repl",
							size = 1.0,
						},
					},
					position = "bottom",
					size = 10,
				},
				{ -- bottom (dbg)
					elements = {
						{
							id = "repl",
							size = 1.0,
						},
					},
					position = "bottom",
					size = 10,
				},
				{ -- right (dbg)
					elements = {
						{
							id = "watches",
							size = 0.33,
						},
						{
							id = "scopes",
							size = 0.33,
						},
						{
							id = "stacks",
							size = 0.33,
						},
					},
					position = "right",
					size = 40,
				},
			},
		},
	},
}
