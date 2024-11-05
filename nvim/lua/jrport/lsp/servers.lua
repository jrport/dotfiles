local lspconfig = require 'lspconfig'
-- local completion_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup {}
lspconfig.lua_ls.setup {
	on_init  = function(client)
		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = { version = 'LuaJIT' },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME }
			}
		})
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			}
		}
	}
}
lspconfig.clangd.setup {}
lspconfig.ts_ls.setup {}
lspconfig.emmet_language_server.setup {}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.html.setup {
--   capabilities = capabilities,
-- }
lspconfig.superhtml.setup {
	capabilities = capabilities,
}
lspconfig.cssls.setup {
	capabilities = capabilities,
}
lspconfig.eslint.setup {
	capabilities = capabilities,
}
lspconfig.jsonls.setup {
	capabilities = capabilities,
}
require 'lspconfig'.sqls.setup {
	capabilities = capabilities,
}
-- lspconfig.sqlls.setup{
--   capabilities = capabilities,
-- }
lspconfig.gopls.setup {}
-- lspconfig.ruby_lsp.setup{}
