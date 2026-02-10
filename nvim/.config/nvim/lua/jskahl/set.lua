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

-- Neovide
if vim.g.neovide then
    vim.opt.linespace = 13
    vim.g.neovide_padding_left = 10
    vim.g.neovide_padding_right = 7
    vim.g.neovide_padding_top = 5
    vim.g.neovide_normal_opacity=0

    local default_font_size = 13
    local font_name = "JetBrainsMono Nerd Font:h13:b"
    vim.g.font_size = default_font_size

    local function set_font_size(size)
        vim.g.font_size = size
        vim.o.guifont = string.format("%s:h%d", font_name, size)
    end

    vim.keymap.set("n", "<C-=>", function()
        set_font_size(vim.g.font_size + 1)
    end)

    vim.keymap.set("n", "<C-->", function()
        set_font_size(vim.g.font_size - 1)
    end)

    vim.keymap.set("n", "<C-0>", function()
        set_font_size(default_font_size)
    end)

    set_font_size(default_font_size)
end
