-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Pane switching keymaps
vim.keymap.set("n", "<C-k>", ":wincmd k\n")
vim.keymap.set("n", "<C-j>", ":wincmd j\n")
vim.keymap.set("n", "<C-l>", ":wincmd l\n")
vim.keymap.set("n", "<C-h>", ":wincmd h\n")

vim.keymap.set("n", "H", ":tabn<CR>")
vim.keymap.set("n", "L", ":tabp<CR>")

-- Toggle LSP warnings/errors
vim.api.nvim_create_user_command("Stfu", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, {})

-- Run formatter
vim.keymap.set("n", "<leader>f", ":Format<CR>", { silent = true })
vim.keymap.set("n", "<leader>F", ":FormatWrite<CR>", { silent = true })

-- Telescope
vim.keymap.set("n", "<leader><leader>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>f?", ":Telescope keymaps<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")

-- Refactoring
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Tabs
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { silent = true })
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<C-x>", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "tn", ":LualineRenameTab ")

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- DAP commands
local dap, dapui = require("dap"), require("dapui")
vim.keymap.set("n", "\\", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<C-.>", dap.terminate)
vim.keymap.set("n", "go", dap.step_out)
vim.keymap.set("n", "gi", dap.step_into)
vim.keymap.set("n", "gn", dap.step_over)
vim.keymap.set("n", "gc", dap.continue)
vim.keymap.set("n", "gd", function()
	dapui.close(1)
	dapui.open(2)
	dapui.open(3)
	dap.continue()
end)

vim.keymap.set("n", "<leader>dd", function() -- open debug UI
	dapui.close(1)
	dapui.toggle(2)
	dapui.toggle(3)
end)

vim.keymap.set("n", "<leader>dr", function() -- open just the console
	dapui.close(2)
	dapui.close(3)
	dapui.toggle(1)
end)

vim.keymap.set("n", "<leader>db", function() -- Float the breakpoints menu
	dapui.float_element("breakpoints", {
		width = math.floor(vim.api.nvim_win_get_width(0) * 0.8 + 0.5),
		height = math.floor(vim.api.nvim_win_get_height(0) * 0.8 + 0.5),
		enter = true,
		position = "center",
	})
end)
