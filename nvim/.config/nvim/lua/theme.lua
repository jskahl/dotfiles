local current_tone = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme")

vim.cmd.colorscheme("gruvbox")
