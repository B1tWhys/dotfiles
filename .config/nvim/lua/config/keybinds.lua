-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Pane switching keymaps
map("n", "<C-k>", ":wincmd k\n")
map("n", "<C-j>", ":wincmd j\n")
map("n", "<C-l>", ":wincmd l\n")
map("n", "<C-h>", ":wincmd h\n")

map("n", "H", ":tabn<CR>")
map("n", "L", ":tabp<CR>")

-- Toggle LSP warnings/errors
map("n", "<leader>stfu", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

-- Run formatter
map("n", "<leader>f", ":Format<CR>", { silent = true })
map("n", "<leader>F", ":FormatWrite<CR>", { silent = true })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>f?", ":Telescope keymaps<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")

-- Refactoring
map("x", "<leader>re", ":Refactor extract ")
map("x", "<leader>rf", ":Refactor extract_to_file ")
map("x", "<leader>rv", ":Refactor extract_var ")
map({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
map("n", "<leader>rI", ":Refactor inline_func")
map("n", "<leader>rb", ":Refactor extract_block")
map("n", "<leader>rbf", ":Refactor extract_block_to_file")
