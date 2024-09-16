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
vim.keymap.set("n", "<leader>stfu", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

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
