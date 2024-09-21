return {
	{ "tpope/vim-surround" },
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"tpope/vim-commentary",
		config = function()
			vim.keymap.set("n", "<leader>.", ":Commentary<CR>")
			vim.keymap.set("v", "<leader>.", ":'<,'>Commentary<CR>")
		end
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {"kevinhwang91/promise-async"},
		config = function()
			vim.o.foldcolumn = '0' -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			require 'ufo'.setup()
		end
	}
}
