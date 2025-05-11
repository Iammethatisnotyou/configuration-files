vim.o.mouse = ""
vim.opt.swapfile = false

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable color syntax
vim.opt.termguicolors = true
vim.cmd("syntax enable")
vim.o.foldmethod = "syntax"

vim.opt.clipboard = "unnamedplus"

vim.o.foldenable = false

vim.o.autoindent = true

vim.opt.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.opt.termguicolors = true

vim.o.completeopt = "menuone,noselect" -- Better completion experience
