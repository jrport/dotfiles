pckr.add{
	  {
		  'nvim-treesitter/nvim-treesitter',
		  run = ":TSupdate",
		  config = function()
			require 'nvim-treesitter.configs'.setup({
				indent = {
					enable = true
				},
				auto_install = true,
				highlight = {
					enable = true,
				},
			})
		  end
	  },
}
