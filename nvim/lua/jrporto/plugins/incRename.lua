return {
    {
        "smjonas/inc-rename.nvim",
        lazy = false,
        config = function()
            require("inc_rename").setup()
            local vim = vim
            vim.keymap.set("n", "<C-r>", function()
                return ":IncRename " .. vim.fn.expand("<cword>")
            end, { expr = true })
        end,
    }
}
