-- we use this 'vim.cmd' to run vim script in a lua file
vim.cmd("let g:netrw_liststyle = 3") -- tree_list style

-- load vim options
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- tabs and indentation
opt.tabstop = 2 -- two spaces for tab
opt.shiftwidth = 2 -- two spaces for indent width
opt.expandtab = true -- wxpand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
-- opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- case-sensitive when mixed case included in the search

-- style-related
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as the default register

-- split
opt.splitright = true
opt.splitbelow = true
