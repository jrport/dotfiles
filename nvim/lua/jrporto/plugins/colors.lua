return {
	{
		"bluz71/vim-moonfly-colors",
		config = function()
			-- vim.cmd [[colorscheme moonfly]]
		end
	},
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			-- vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			-- vim.cmd([[colorscheme aura-dark]])
		end
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		config = function()
			vim.cmd [[colorscheme carbonfox]]
		end
	} -- lazy
}
