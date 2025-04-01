local set = vim.opt

-- general
set.cursorline = true
set.number = true
set.relativenumber = true
set.scrolloff = 10
set.laststatus = 3

-- text
set.expandtab = true
vim.cmd("autocmd Filetype make setlocal noexpandtab") -- exception for Makefiles to use tabs instead of spaces
set.autoindent = true                                 -- copy indent from current line when starting new one
set.smartindent = true
set.shiftwidth = 4

-- searching
set.ignorecase = true -- ignore case when searching
set.smartcase = true  -- case-sensitive when mixed case included in the search
set.incsearch = true

-- window managment
set.splitright = true
set.splitbelow = true
