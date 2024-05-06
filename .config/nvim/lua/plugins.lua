require("lazy").setup({
	'nvim-tree/nvim-web-devicons',
	'folke/tokyonight.nvim',
	'folke/todo-comments.nvim',
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	'cohama/lexima.vim',
	'nvim-lualine/lualine.nvim',
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
})

require("lualine").setup({
    options = {
        icons_enabled = true
    }
})

require("tokyonight").setup({
	style = "night",
	transparent = true,
	lualine_bold = true
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,

  ignore_install = { "javascript" },
  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
  },
}
