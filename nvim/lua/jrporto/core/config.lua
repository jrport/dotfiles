vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "no"

-- transparent
vim.cmd(
	"highlight Normal guibg=none",
	-- nightighlight NonText guibg=none",
	"highlight Normal ctermbg=none",
	"highlight NonText ctermbg=none",
	"hi CursorLineNr guifg=#000000",
	"hi LineNr guifg=#000000"
)


-- line number on netrw
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.updatetime = 50

vim.opt.smartindent = true
vim.cmd[[filetype plugin indent on]]

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
