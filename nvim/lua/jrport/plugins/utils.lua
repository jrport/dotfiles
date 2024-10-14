pckr.add {
	{ 'tpope/vim-commentary', cond = keys('n', 'gc') },
	{ 'tpope/vim-endwise' },
	{ 'tpope/vim-surround' },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		after = { 'nvim-treesitter' },
		-- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
		requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
		-- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
		config = function()
			require('render-markdown').setup({
				file_types = { 'markdown', '' },
			})
		end,
	},
	{
		"echasnovski/mini.animate",
		config = function()
			local animate = require 'mini.animate'
			animate.setup({
				cursor = {
					-- Whether to enable this animation
					enable = true,

					-- Timing of animation (how steps will progress in time)
					timing = animate.gen_timing.linear({ duration = 50, unit = 'total' }),

					-- Path generator for visualized cursor movement
					-- path = --<function: implements shortest line path>,
				},

				-- Vertical scroll
				scroll = {
					-- Whether to enable this animation
					enable = true,

					timing = animate.gen_timing.linear({ duration = 50, unit = 'total' }),
					-- Timing of animation (how steps will progress in time)
					-- timing = --<function: implements linear total 250ms animation duration>,

					-- Subscroll generator based on total scroll
					-- subscroll = --<function: implements equal scroll with at most 60 steps>,
				},
			})
		end
	}
}
