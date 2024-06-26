vim.g.mapleader = " "

vim.g.have_nerd_font = true

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to top window" })
