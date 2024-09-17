return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
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
				{
					type = "delve",
					name = "Debug test", -- configuration for debugging test files
					request = "launch",
					mode = "test",
					program = "${file}",
				},
				-- works with go.mod packages and sub packages
				{
					type = "delve",
					name = "Debug test (go.mod)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}
			-- 	dap.adapters.go = {
			-- 		type = "executable",
			-- 		command = "node",
			-- 		args = { os.getenv("HOME") .. "/dev/golang/vscode-go/extension/dist/debugAdapter.js" },
			-- 	}
			-- 	dap.configurations.go = {
			-- 		{
			-- 			type = "go",
			-- 			name = "Debug",
			-- 			request = "launch",
			-- 			showLog = false,
			-- 			program = "${file}",
			-- 			dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
			-- 		},
			-- 	}
		end,
		build = { ":helptags ALL" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {},
	},
}
