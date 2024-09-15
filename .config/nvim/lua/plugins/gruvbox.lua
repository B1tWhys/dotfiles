return {{
"ellisonleao/gruvbox.nvim",
priority = 1000,
config = function()
vim.cmd([[colorscheme gruvbox]])
vim.o.background = "dark"
vim.cmd('autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE')
end
}}
