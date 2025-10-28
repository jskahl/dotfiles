vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", function() vim.cmd(":Oil") end)

-- anti windows actions below
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.cmd("set mouse=")
