pckr.add {
	{
		"neovim/nvim-lspconfig",
	},
	{

		'hrsh7th/nvim-cmp',
		requires = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
			"rafamadriz/friendly-snippets"
		},
		config = function()
			local luasnip = require('luasnip')
			luasnip.filetype_extend("ruby", {"rails"})

			require("luasnip.loaders.from_vscode").lazy_load()

			vim.keymap.set({"i", "s"}, "<C-j>", function() luasnip.jump( 1) end, {silent = true, noremap = true})
			vim.keymap.set({"i", "s"}, "<C-l>", function() luasnip.jump(-1) end, {silent = true, noremap = true})

			local cmp = require 'cmp'

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				experimental = {
					ghost_text = true,
				},
				-- window = {
				-- 	completion = cmp.config.disable,
				-- 	documentation = cmp.config.disable,
				-- },
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'vsnip' }, -- For vsnip users.
				}, {
					{ name = 'buffer' },
				})
			})
		end
		}
}

