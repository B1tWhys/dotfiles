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

vim.keymap.set("n", "H", ":tabp<CR>")
vim.keymap.set("n", "L", ":tabn<CR>")

-- Run formatter
vim.keymap.set("n", "<leader>f", ":Format<CR>", { silent = true })
vim.keymap.set("n", "<leader>F", ":FormatWrite<CR>", { silent = true })

-- Telescope

local tsBuiltins = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", tsBuiltins.find_files)
vim.keymap.set("n", "<leader>f?", tsBuiltins.keymaps)
vim.keymap.set("n", "<C-p>", tsBuiltins.commands)
vim.keymap.set("n", "<leader>fh", tsBuiltins.help_tags)
vim.keymap.set("n", "<leader>fb", tsBuiltins.buffers)
vim.keymap.set("n", "<leader>ff", tsBuiltins.live_grep)

-- Package mgmt
vim.keymap.set("n", "<leader>M", ":Mason\n", { desc = "Open Mason" })
vim.keymap.set("n", "<leader>L", ":Lazy\n", { desc = "Open Lazy" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Jump to symbol definition" })
vim.keymap.set("n", "<C-b>", vim.lsp.buf.definition, { desc = "Jump to symbol definition" })
for _, c in ipairs({ "i", "n" }) do
	vim.keymap.set(c, "<C-Space>", function()
		-- vim.lsp.buf.signature_help({ silent = true })
		vim.lsp.buf.hover()
	end, { desc = "Show signature help" })
end

-- Toggle LSP warnings/errors
vim.api.nvim_create_user_command("Stfu", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, {})

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
vim.keymap.set("n", "<leader><Tab>", ":tabnext<CR>", { silent = true })
-- the default <C-i> is broken by remapping Tab for some reason, unless I fix it manually
vim.keymap.set("n", "<C-i>", "<C-i>", { silent = true, remap = false })
vim.keymap.set("n", "<leader><S-Tab>", ":tabprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<C-x>", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "tn", ":LualineRenameTab ")

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- DAP commands
local dap, dapui, dapPython = require("dap"), require("dapui"), require("dap-python")
vim.keymap.set("n", "\\", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "dbg: continue" })
vim.keymap.set("n", "<C-.>", dap.terminate)
vim.keymap.set("n", "go", dap.step_out, { desc = "dbg: Step Out" })
vim.keymap.set("n", "gi", dap.step_into, { desc = "dbg: Step in" })
vim.keymap.set("n", "gn", dap.step_over, { desc = "dbg: Step over" })
vim.keymap.set("n", "gc", dap.continue, { desc = "dbg: Continue" })

-- Experimental: Use arrow keys for debugging
vim.keymap.set("n", "<Down>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<Right>", dap.step_into, { desc = "Step in" })
vim.keymap.set("n", "<Left>", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<Up>", dap.run_to_cursor, { desc = "Run to cursor" })

-- vim.keymap.set("n", "gt", dapPython.test_method, { desc = "dbg: Run test above cursor" })
vim.keymap.set("n", "<leader>gd", function()
	dapui.close(1)
	dapui.toggle(2)
	dapui.toggle(3)
end, { desc = "dbg: Toggle debug pannels" })

vim.keymap.set("n", "<leader>dd", function() -- open debug UI
	dapui.close(1)
	dapui.toggle(2)
	dapui.toggle(3)
end, { desc = "dbg: Open debug pannel" })

vim.keymap.set("n", "<leader>dr", function() -- open just the console
	dapui.close(2)
	dapui.close(3)
	dapui.toggle(1)
end, { desc = "dbg: Open just the run pannel" })

vim.keymap.set("n", "<leader>db", function() -- Float the breakpoints menu
	dapui.float_element("breakpoints", {
		width = math.floor(vim.api.nvim_win_get_width(0) * 0.8 + 0.5),
		height = math.floor(vim.api.nvim_win_get_height(0) * 0.8 + 0.5),
		enter = true,
		position = "center",
	})
end, { desc = "dbg: Show breakpoints popup" })
