return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"j-hui/fidget.nvim",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require('cmp')
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities())

			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup {
							capabilities = capabilities
						}
					end,

					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup {
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = { version = "Lua 5.1" },
									diagnostics = {
										globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
									}
								}
							}
						}
					end,
					-- ["clangd"] = function()
					-- 	require 'lspconfig'.clangd.setup {
					-- 		cmd = { "clangd", "--background-index", "--header-insertion=never" },
					-- 		capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
					-- 		init_options = {
					-- 			clangdFileStatus = true
					-- 		}
					-- 	}
					-- end
				}
			})

			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			local k = vim.keymap.set

			k('n', '<leader>ll', vim.lsp.buf.format)

			k('n', 'gd', vim.lsp.buf.definition)
			k('n', 'gD', vim.lsp.buf.declaration)
			k('n', 'K', vim.lsp.buf.hover)
			k('n', 'gi', vim.lsp.buf.implementation)
			k('n', '<C-k>', vim.lsp.buf.signature_help)
			k('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
			k('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
			k('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end)
			k('n', '<C-r>', vim.lsp.buf.rename)
			k('n', 'gr', vim.lsp.buf.references)
			k('n', '<space>e', vim.diagnostic.open_float)
			k('n', '[d', vim.diagnostic.goto_prev)
			k('n', ']d', vim.diagnostic.goto_next)
			k('n', '<space>q', vim.diagnostic.setloclist)

			-- code actions
			k("n", "<leader>ca", vim.lsp.buf.code_action)

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Esc>'] = cmp.mapping.abort(),
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
					['<C-CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				experimental = {
					ghost_text = true,
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
				})
			})
		end
	},
}
