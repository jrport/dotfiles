local k = vim.keymap.set
vim.g.mapleader = " "

k("n", "<leader>pv", ":Ex<CR>")
k("n", "<leader><leader>", ":w<CR>")
k("n", "<C-q>", ":q!<CR>")

-- drag stuff
k("v", "J", ":m '>+1<CR>gv=gv")
k("v", "K", ":m '<-2<CR>gv=gv")

