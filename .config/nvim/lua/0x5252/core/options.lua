local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- termguicolors for nightfly scheme
-- opt.termguicolors = true
-- opt.background = "dark"
-- opt.signcolumn = "yes"

-- Colorscheme based on terminal
vim.cmd.colorscheme = "default"
opt.termguicolors = true
vim.cmd.hi = "Search ctermfg=0"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split rules
opt.splitright = true
opt.splitbelow = true

-- folding
opt.foldmethod = "indent"
opt.foldlevel = 2

-- swapfile
opt.swapfile = false
