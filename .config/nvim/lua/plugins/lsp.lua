return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				-- Setup automatic configuration of lsp servers
				-- See h: mason-lspconfig-automatic-server-setup
				function(server_name)
					local caps = require("cmp_nvim_lsp").default_capabilities()
					require("lspconfig")[server_name].setup({
						capabilities = caps,
					})
				end,
			})
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	{ "neovim/nvim-lspconfig", dependencies = { "folke/lazydev.nvim" } },
	{
		"mhartington/formatter.nvim",
		opts = function()
			return {
				filetype = {
					lua = require("formatter.filetypes.lua").stylua,
					python = require("formatter.filetypes.python").black,
				},
			}
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {
			library = { plugins = { "nvim-dap-ui" }, types = true },
		},
	},
	"mfussenegger/nvim-lint",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"bash",
					"c",
					"css",
					"csv",
					"cuda",
					"dart",
					"dockerfile",
					"go",
					"html",
					"java",
					"javascript",
					"json",
					"jq",
					"latex",
					"make",
					"nginx",
					"php",
					"kotlin",
					"lua",
					"luadoc",
					"proto",
					"python",
					"sql",
					"svelte",
					"swift",
					"toml",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
				},
				ignore_install = {},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
				modules = {},
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					--completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<Esc>"] = cmp.mapping.close(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}),
				{
					{ name = "buffer" },
				},
			})
		end,
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},
}
