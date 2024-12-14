return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			-- List of these configs: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
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
				-- works with go.mod packages and sub packages
				{
					type = "delve",
					name = "Debug test (go.mod)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}

			-- Python config
			-- 		dap.adapters.python = function(cb, config)
			-- 			function PythonPath()
			-- 				-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- 				-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- 				-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			-- 				local cwd = vim.fn.getcwd()
			-- 				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
			-- 					return cwd .. "/venv/bin/python"
			-- 				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
			-- 					return cwd .. "/.venv/bin/python"
			-- 				else
			-- 					return "/usr/bin/python"
			-- 				end
			-- 			end
			-- 			if config.request == "attach" then
			-- 				---@diagnostic disable-next-line: undefined-field
			-- 				local port = (config.connect or config).port
			-- 				---@diagnostic disable-next-line: undefined-field
			-- 				local host = (config.connect or config).host or "127.0.0.1"
			-- 				cb({
			-- 					type = "server",
			-- 					port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			-- 					host = host,
			-- 					options = {
			-- 						source_filetype = "python",
			-- 					},
			-- 				})
			-- 			else
			-- 				cb({
			-- 					type = "executable",
			-- 					command = PythonPath(),
			-- 					args = { "-m", "debugpy.adapter" },
			-- 					options = {
			-- 						source_filetype = "python",
			-- 					},
			-- 				})
			-- 			end
			-- 		end
			-- 		-- dap.configurations.python = {
			-- 		-- 	{
			-- 		-- 		-- The first three options are required by nvim-dap
			-- 		-- 		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			-- 		-- 		request = "launch",
			-- 		-- 		name = "Launch file",
			-- 		--
			-- 		-- 		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
			-- 		-- 		program = "${file}", -- This configuration will launch the current file if used.
			-- 		-- 		pythonPath = PythonPath,
			-- 		-- 	},
			-- 		-- 	{
			-- 		-- 		-- The first three options are required by nvim-dap
			-- 		-- 		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			-- 		-- 		request = "launch",
			-- 		-- 		name = "Launch pytest",
			-- 		--
			-- 		-- 		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
			-- 		-- 		program = "${file}",
			-- 		-- 		-- args = { "${file}" }, -- This configuration will launch the current file if used.
			-- 		-- 		pythonPath = PythonPath,
			-- 		-- 	},
			-- 		-- }
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
	{
		"mfussenegger/nvim-dap-python",
		-- opts = { "./venv/bin/python" },
		config = function()
			local dapPython = require("dap-python")
			dapPython.test_runner = "pytest"
			dapPython.setup("venv/bin/python")
		end,
		dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
	},
}
