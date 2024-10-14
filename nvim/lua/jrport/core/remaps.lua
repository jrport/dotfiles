vim.g.mapleader = " "

K("n", "<leader>pv", ":Explore<CR>", {silent=true})
K("n", "<leader><leader>", ":w<CR>", {silent=true})
K("n", "<C-q>", ":q!<CR>", {silent=true})

K("v", "J", ":m '>+1<CR>gv=gv")
K("v", "K", ":m '<-2<CR>gv=gv")

K("n", "<Esc>", ":noh<CR>", {silent=true})
K("n", "<leader>tt", ":tabnew<CR>", {silent=true})
K("n", "<A-r>", ":tab term<CR>", {silent=true})

