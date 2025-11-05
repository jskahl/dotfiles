#!/bin/sh

# Chosed Theme
ChosedTheme=$1

# Current New Theme
CurrentNewTheme=""

# Current Theme
CurrentTheme="$(cat $HOME/.cache/current-theme)"

# Current Theme Tone (dark or light)
CurrentThemeTone="$(cat $HOME/.cache/current-tone)"

profile=$(find ~/.mozilla/firefox -maxdepth 1 -type d -name "*.default-release" | head -n 1)

changetheme() {
    case "$1" in
        osaka) 
            CurrentNewTheme="osaka"
            CurrentTheme="osaka"
            echo "osaka" > $HOME/.cache/current-theme;;
        catppuccin) 
            CurrentNewTheme="catppuccin"
            CurrentTheme="catppuccin"
            echo "catppuccin" > $HOME/.cache/current-theme;;
        nord) 
            CurrentNewTheme="nord"
            CurrentTheme="nord"
            echo "nord" > $HOME/.cache/current-theme;;
        tokyo) 
            CurrentNewTheme="tokyo"
            CurrentTheme="tokyo"
            echo "tokyo" > $HOME/.cache/current-theme;;
        gruvbox) 
            CurrentNewTheme="gruvbox"
            CurrentTheme="gruvbox"
            echo "gruvbox" > $HOME/.cache/current-theme;;
        *) 
            echo "Tema não conhecido"    
            exit 0;;
        esac
}


makechanges() {
    if [ "$CurrentThemeTone" = "dark" ]; then

        # Changes wallpaper
        echo "$HOME/media/wallpapers/$1/$CurrentThemeTone/1-$1.png" > "$HOME/.cache/current-wallpaper"
        feh --bg-fill "$HOME/media/wallpapers/$1/$CurrentThemeTone/1-$1.png"

        # Change polybar theme
        cat $HOME/.config/polybar/themes/$1.ini > $HOME/.config/polybar/themes/current.ini
        sed -i "s/light/dark/g" "$HOME/.config/polybar/config.ini"
        sed -i "s/light/dark/g" "$HOME/.config/polybar/modules/workspaces.ini"

        # Change alacritty theme
        cat $HOME/.config/alacritty/themes/$1.toml > $HOME/.config/alacritty/themes/current.toml

        # Change starship theme
        sed -i "s/^palette = \".*\"$/palette = \"$1\"/" "$HOME/.config/starship/starship.toml"

        # Change neovim theme
        sed -i "s/^local current_theme = \".*\"$/local current_theme = \"$1\"/" "$HOME/.config/nvim/lua/theme.lua"

        # Restart i3
        i3-msg restart > /dev/null

    elif [ "$CurrentThemeTone" = "light" ]; then

        # Changes wallpaper
        echo "$HOME/media/wallpapers/$1/$CurrentThemeTone/1-$1.png" > "$HOME/.cache/current-wallpaper"
        feh --bg-fill "$HOME/media/wallpapers/$1/$CurrentThemeTone/1-$1.png"

        # Change polybar theme
        cat $HOME/.config/polybar/themes/$1.ini > $HOME/.config/polybar/themes/current.ini
        sed -i "s/dark/light/g" "$HOME/.config/polybar/config.ini"
        sed -i "s/dark/light/g" "$HOME/.config/polybar/modules/workspaces.ini"

        # Change alacritty theme
        cat $HOME/.config/alacritty/themes/$1-light.toml > $HOME/.config/alacritty/themes/current.toml

        # Change starship theme
        sed -i "s/^palette = \".*\"$/palette = \"${1}-light\"/" "$HOME/.config/starship/starship.toml"

        # Change neovim theme
        sed -i "s/^local current_theme = \".*\"$/local current_theme = \"${1}-light\"/" "$HOME/.config/starship/starship.toml"

        # Restart i3
        i3-msg restart > /dev/null
    fi




    # Reload theme in all running Neovim instances
    if command -v nvr &> /dev/null; then
        sockets=$(ls /run/user/$UID/nvim.*.* 2>/dev/null)
    
        if [ -n "$sockets" ]; then
            for sock in $sockets; do
                nvr --nostart --servername "$sock" --remote-send '<Esc>:luafile ~/.config/nvim/lua/theme.lua<CR>'
            done
        fi
    fi
}

if [ "$1" = "dark" ]; then
    echo "dark" > "$HOME/.cache/current-tone"
    echo 'user_pref("ui.systemUsesDarkTheme", 1);' > "$profile/user.js"
    sed -i '/local current_tone = /c\local current_tone = "dark"' "$HOME/.config/nvim/lua/theme.lua"

    CurrentThemeTone="dark"

    makechanges $CurrentTheme

elif [ "$1" = "light" ]; then
    echo "light" > "$HOME/.cache/current-tone"
    echo 'user_pref("ui.systemUsesDarkTheme", 0);' > "$profile/user.js"
    sed -i '/local current_tone = /c\local current_tone = "light"' "$HOME/.config/nvim/lua/theme.lua"

    CurrentThemeTone="light"

    makechanges $CurrentTheme

elif [ "$1" = "" ]; then
    echo "=====AVAILABLE THEMES====="
    echo "= osaka       catppuccin ="
    echo "= nord             tokyo ="
    echo "= gruvbox                ="
    echo "=========================="
    echo ""
    echo "All themes have both light and dark modes"

else
    changetheme $1
    makechanges $CurrentNewTheme
fi


