return {
    {
        "nvim-telescope/telescope.nvim",

        tag = "0.1.5",

        dependencies = {
            "nvim-lua/plenary.nvim"
        },

        config = function()
            require('telescope').setup({})

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        end
    },
    {
        "gennaro-tedesco/nvim-peekup",
        config = function()
            local peek = require("nvim-peekup.config")
            peek.geometry['height'] = 0.8
        end
    }
}
