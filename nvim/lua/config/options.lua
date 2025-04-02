---@diagnostic disable: undefined-global

local set = vim.opt

-- general
set.cursorline = true
set.termguicolors = true
set.number = true
set.relativenumber = true
set.scrolloff = 8
set.laststatus = 3
set.icon = true

-- text
set.expandtab = true
vim.cmd("autocmd Filetype make setlocal noexpandtab")
set.autoindent = true
set.breakindent = true
set.foldclose = "all"
set.smartindent = true
set.shiftwidth = 4

-- searching
set.ignorecase = true
set.smartcase = true
set.incsearch = true

-- window managment
set.splitright = true
set.splitbelow = true
set.equalalways = true
