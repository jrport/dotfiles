return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "j-hui/fidget.nvim",
        'VonHeikemen/lsp-zero.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    lazy = false,
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        lsp_zero.format_mapping('<leader>lf', {
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                ['lua_ls'] = {'lua'},
                ['solargraph'] = {'ruby'}
            }
        })

        -- here you can setup the language servers
        require('lspconfig').pyright.setup({})
        require('lspconfig').solargraph.setup({})
        require('lspconfig').tsserver.setup({
            filetypes = {"eruby", "javascript"}
        })
        require('lspconfig').lua_ls.setup({})
        require('lspconfig').html.setup({
            filetypes = { "html", "templ", "eruby" }
        })
        require('lspconfig').clangd.setup({})
        require('lspconfig').tailwindcss.setup {}
        require('lspconfig').emmet_language_server.setup({
            -- on_attach = on_attach,
            filetypes = { "css", "eruby", "html", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
        })

        -- -- formmatting on save
        -- lsp_zero.format_on_save({
        --     format_opts = {
        --         async = false,
        --         timeout_ms = 10000,
        --     },
        --     servers = {
        --         ['tsserver'] = { 'javascript', 'typescript' },
        --         ['html'] = { "eruby", "html" },
        --         ['pyright'] = { "python" },
        --         ['clangd'] = { 'c', 'cpp' },
        --         ['lua_ls'] = { 'lua' }
        --     }
        -- })

        -- snippets
        require'luasnip'.filetype_extend("javascript", {"html"})
        require'luasnip'.filetype_extend("eruby", {"javascript"})
        require 'luasnip'.filetype_extend("eruby", { "rails","javascript" })
        require 'luasnip'.filetype_extend("ruby", { "rails" })
        require("luasnip.loaders.from_vscode").lazy_load()

        -- nvim-cmp
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            sources = {
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                { name = 'buffer' },
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            experimental = {
                ghost_text = true
            },
        })
    end
}
