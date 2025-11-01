local current_theme = "gruvbox"
local current_tone = "dark"

if current_tone == "dark" then
    vim.o.background = "dark"
end

if current_tone == "light" then
    vim.o.background = "light"
end

if current_theme == "osaka" then
    if current_tone == "light" then
        vim.cmd.colorscheme("solarized-osaka-day")
    else
        vim.cmd.colorscheme("solarized-osaka")
    end

elseif current_theme == "catppuccin" then
    if current_tone == "light" then
        vim.cmd.colorscheme("catppuccin-latte")
    else
        vim.cmd.colorscheme("catppuccin-frappe")
    end

elseif current_theme == "nord" then
    if current_tone == "light" then
        vim.cmd.colorscheme("onenord-light")
    else
        vim.cmd.colorscheme("onenord")
    end

elseif current_theme == "gruvbox" then
    if current_tone == "light" then
        vim.cmd.colorscheme("gruvbox")
    else
        vim.cmd.colorscheme("gruvbox")
    end

elseif current_theme == "tokyo" then
    if current_tone == "light" then
        vim.cmd.colorscheme("tokyonight-day")
    else
        vim.cmd.colorscheme("tokyonight")
    end
end

