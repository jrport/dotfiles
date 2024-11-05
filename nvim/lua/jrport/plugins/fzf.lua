pckr.add {
	{
		"ibhagwan/fzf-lua",
		run = "./install --bin",
		config = function ()
			require'fzf-lua'.setup({})
			vim.keymap.set("n", "<C-f>", ":FzfLua<CR>")
			vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
			vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>")
			vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>")
		end
	}
}
