require("lazy").setup({
    'nvim-tree/nvim-web-devicons',
    'folke/tokyonight.nvim',

    {'sainnhe/everforest',
        config = function()
            vim.g.everforest_transparent_background = 1
        end
    },

    'folke/todo-comments.nvim',
    'windwp/nvim-ts-autotag',
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    'cohama/lexima.vim',
    'nvim-lualine/lualine.nvim',
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
})

require("toggleterm").setup({
    direction = "vertical",
    size = function(term)
        if term.direction == "horizontal" then
            return 14
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    autochdir = false,
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

require'nvim-treesitter.configs'.setup{
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,

  autotag = {
      enable = true
  },
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
