local vim = vim
local k = vim.keymap.set

vim.g.mapleader = " "

-- netrw
k("n", "<leader>pv", ":Ex<CR>")

-- disable highlight
-- k("n", "<leader><Esc>", ":noh<CR>")

-- buffer jump
k("n", "<leader>q", ":bnext<CR>")

-- save
k("n", "<leader><leader>", ":w<CR>")

-- move lines up and down
k("v", "J", ":m '>+1<CR>gv=gv")
k("v", "K", ":m '<-2<CR>gv=gv")

-- source
-- k("n", "<leader><leader>", function()
-- vim.cmd("so")
-- end)

-- jump to next/prev function
k("n", "nf", "]m")
k("n", "pf", "[m")

function JumpToEndInsideQuotes()
  -- Move to the next single quote
  vim.cmd("normal! f\"")
  -- Move one character right to get inside the quotes
  vim.cmd("normal! l")
  -- Move to just before the closing single quote
  vim.cmd("normal! f\"")
  -- Enter insert mode right after the current position
  vim.cmd("startinsert")
end

-- Map this function to a key, e.g., <leader>i'
vim.api.nvim_set_keymap('n', '<leader>wq', ':lua JumpToEndInsideQuotes()<CR>', { noremap = true, silent = true })
