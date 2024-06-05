return {
    {
        "vigoux/notifier.nvim",
        config = function()
            require 'notifier'.setup {}
        end
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require 'fidget'.setup({})
        end
    }
}
