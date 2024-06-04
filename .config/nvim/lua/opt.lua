local opt = vim.opt

opt.number = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.relativenumber = true
opt.showmode = false
opt.ignorecase = true
opt.smartcase = true
opt.undofile = true
opt.signcolumn = "yes"
opt.list = true
opt.scrolloff = 10

opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
