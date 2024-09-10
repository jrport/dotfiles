local vim = vim
local k = vim.keymap.set

vim.g.mapleader = " "

k("n", "<leader>pv", ":Ex<CR>")

k("n", "<leader>q", ":bnext<CR>")

k("n", "<leader><leader>", ":w<CR>")
k("n", "<leader><ESC><ESC>", ":wq<CR>")

k("v", "J", ":m '>+1<CR>gv=gv")
k("v", "K", ":m '<-2<CR>gv=gv")

k("n", "nf", "]m")
k("n", "pf", "[m")

k("n", "<leader>ll", vim.lsp.buf.format, {})

vim.api.nvim_set_keymap('n', '<leader>wq', ':lua JumpToEndInsideQuotes()<CR>', { noremap = true, silent = true })
