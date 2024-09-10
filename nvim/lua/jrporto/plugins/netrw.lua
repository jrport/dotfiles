return {
	{
		'prichrd/netrw.nvim',
		lazy = false,
		dependencies = {
			-- {
			-- 	'nvim-tree/nvim-web-devicons',
			-- 	config=function()
			-- 		require'nvim-web-devicons'.setup{}
			-- 	end
			-- }
		},
		config = function()
			require'netrw'.setup{
				use_devicons = true,
			}
		end
	}
}
