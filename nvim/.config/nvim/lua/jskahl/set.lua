-- Lines numeration
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs and identing
local tabs = 4
vim.opt.tabstop = tabs
vim.opt.softtabstop = tabs
vim.opt.shiftwidth = tabs
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

-- Make undo old things possible
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search stuff
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Visual stuff
vim.opt.termguicolors = true
vim.opt.scrolloff = 9
