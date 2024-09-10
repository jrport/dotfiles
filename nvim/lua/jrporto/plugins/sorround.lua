local k = vim.keymap.set

return {
    {
        "tpope/vim-surround",
        name = "vim-surround",
    },
    {
        "jiangmiao/auto-pairs",
        name = 'autopairs'
    },
    {
        "tpope/vim-endwise",
        name = "endwise"
    },
    {
        "terrortylor/nvim-comment",
        name = "comment-toggle",
        config = function()
            require('nvim_comment').setup()
            k("n", "<leader>.", ":CommentToggle<CR>")
            k("v", "<leader>.", ":'<,'>CommentToggle<CR>")
        end
    },
}
