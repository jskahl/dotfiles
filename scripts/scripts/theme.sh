#!/bin/sh

# Set variables
pol="$HOME/.config/polybar/config.ini"
polws="$HOME/.config/polybar/modules/workspaces.ini"
alacritty="$HOME/.config/alacritty/alacritty.toml"
nvim="$HOME/.config/nvim/lua/theme.lua"
starship="$HOME/.config/starship/starship.toml"
profile=$(find ~/.mozilla/firefox -maxdepth 1 -type d -name "*.default-release" | head -n 1)

set_dark() {
    echo "dark" > /home/j/.cache/current-theme

    echo "Alterando wallpaper..."
    echo "$HOME/media/wallpapers/cat_pacman.png" > "$HOME/.cache/wallpaper"
    sleep 0.2

    echo "Alterando Polybar..."
    sed -i "s/latte/frappe/g" "$pol"
    sleep 0.2

    echo "Alterando Alacritty..."
    sed -i "s/latte/frappe/g" "$alacritty"
    sleep 0.2

    echo "Alterando Neovim..."
    sed -i "s/latte/frappe/g" "$nvim"
    sleep 0.2

    echo "Alterando starship..."
    sed -i 's/palette = "catppuccin_latte"/palette = "catppuccin_frappe"/g' "$starship"
    sed -i 's/surface0/crust/g' "$starship"

    echo "Alterando firefox..."
    echo 'user_pref("ui.systemUsesDarkTheme", 1);' > "$profile/user.js"
}

set_light() {
    echo "light" > /home/j/.cache/current-theme

    echo "Alterando wallpaper..."
    echo "$HOME/media/wallpapers/mandelbrot_side_teal.png" > "$HOME/.cache/wallpaper"
    sleep 0.2

    echo "Alterando Polybar..."
    sed -i "s/frappe/latte/g" "$pol"
    sleep 0.2

    echo "Alterando Alacritty..."
    sed -i "s/frappe/latte/g" "$alacritty"
    sleep 0.2

    echo "Alterando Neovim..."
    sed -i "s/frappe/latte/g" "$nvim"
    sleep 0.2

    echo "Alterando starship..."
    sed -i 's/palette = "catppuccin_frappe"/palette = "catppuccin_latte"/g' "$starship"
    sed -i 's/crust/surface0/g' "$starship"

    echo "Alterando firefox..."
    echo 'user_pref("ui.systemUsesDarkTheme", 0);' > "$profile/user.js"
}

reload_i3() {
    echo "Reiniciando configuração do i3..."
    i3-msg restart > /dev/null
}

case "$1" in
  dark)
    set_dark
    reload_i3
    ;;
  light)
    set_light
    reload_i3
    ;;
  "")
    echo ""
    echo "+----------------------+"
    echo "|  TEMAS DISPONIVEIS   |"
    echo "+----------------------+"
    echo ""
    echo "Tema Escuro---------dark"
    echo "Tema Claro---------light"
    ;;
  *)
    echo "Tema inexistente."
    ;;
esac
