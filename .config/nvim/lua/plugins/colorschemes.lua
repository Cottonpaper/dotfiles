return {
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = 'hard'
			vim.g.everforest_transparent_background = 1
		end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				flavour = "mocha"
			})
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main",
				enable = { terminal = true },
			})
		end
	},
}
