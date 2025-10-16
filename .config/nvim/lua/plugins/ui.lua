return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = {
					icons_enabled = true,
					theme = 'auto',
				}
			}
		end
	},
	{
		"folke/todo-comments.nvim",
		opts = {}
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {}
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify"
		},
		config = function()
			require("noice").setup({
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false
			})
		end
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup{
				open_mapping = [[<C-t]],
				direction = 'float',
				float_opts = {
					border = 'single',
					width = function()
						return math.floor(vim.o.columns * 0.4)
					end,
					height = function()
						return math.floor(vim.o.columns * 0.15)
					end,
				}
			}
			vim.keymap.set({"n", "t"}, "<C-t>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
		end
	},
}
