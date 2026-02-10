local dark_theme = "catppuccin-mocha"
local light_theme = "catppuccin-latte"

local current_tone = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme")

if current_tone == "prefer-dark" then
    vim.cmd.colorscheme(dark_theme)
end

if current_tone == "prefer-light" then
    vim.cmd.colorscheme(light_theme)
end
