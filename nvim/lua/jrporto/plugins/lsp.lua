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
        local vim = vim
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
                ['lua_ls'] = { 'lua' },
                ['solargraph'] = { 'ruby' }
            }
        })

        require('lspconfig').pyright.setup({})
        require('lspconfig').solargraph.setup({})
        require('lspconfig').gopls.setup({})
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        })
        require('lspconfig').html.setup({
            filetypes = { "html", "templ", "eruby" }
        })
        require('lspconfig').clangd.setup({})
        -- require('lspconfig').tailwindcss.setup {}
        require('lspconfig').emmet_language_server.setup({
            filetypes = { "css", "eruby", "html", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
        })

        -- formmatting on save
        lsp_zero.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 10000,
            }
        })

        -- snippets
        require 'luasnip'.filetype_extend("javascript", { "html" })
        require 'luasnip'.filetype_extend("eruby", { "javascript" })
        require 'luasnip'.filetype_extend("eruby", { "rails", "javascript" })
        require 'luasnip'.filetype_extend("ruby", { "rails" })
        require("luasnip.loaders.from_vscode").lazy_load()

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = vim.api.nvim_create_augroup("code_action_sign", { clear = true }),
            callback = function()
                require('jrporto.utils.codeactions').code_action_listener()
            end,
        })

        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("i", "<a-cr>", vim.lsp.buf.code_action, bufopts)
        -- vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)


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
                ['<S-Tab>'] = cmp.mapping.select_next_item(),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping.confirm({ select = false }),
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
