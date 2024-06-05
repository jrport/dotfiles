local k = vim.keymap.set
k("n", "<Leader>rc", ":lua require('ror.commands').list_commands()<CR>", { silent = true })
k("n", "<Leader>fm", ":lua require('ror.finders.models').find()<CR>", { silent = true })
k("n", "<Leader>fv", ":lua require('ror.finders.view').find()<CR>", { silent = true })
k("n", "<Leader>fc", ":lua require('ror.finders.controller').find()<CR>", { silent = true })
return {
    'weizheheng/ror.nvim',
    config = {
        function()
            require 'ror'.setup()
        end
    }
}
