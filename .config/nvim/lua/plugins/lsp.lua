return {
	{
	    "nvim-treesitter/nvim-treesitter",
	    lazy = false,
	    build = ":TSUpdate",
	    config = function()
		    require("nvim-treesitter.configs").setup {
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true }}
	    end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = { "clangd", "lua_ls" },
			}
		end
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {"hrsh7th/cmp-nvim-lsp"},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({select = true}),
					["<C-Space>"] = cmp.mapping.complete()
				}),
				sources = {{name = "nvim_lsp"}}
			})
		end
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require("telescope").setup {
				defaults = {
					layout_config = { width = 0.9 },
					sorting_strategy = "ascending",
					prompt_prefix = " 󰍉 ",
				}
			}
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup {
				signs = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				}
			}
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				}
			})
		end
	},
}
