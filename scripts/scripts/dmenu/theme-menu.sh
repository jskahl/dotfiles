#!/bin/sh

# import theme
. "$HOME/scripts/dmenu/themes/current.sh"
 
input=$(
    printf "%s\n" \
    "󰶞 matte" "󰨷 tokyo" " osaka" "󰇈 gruvbox" "󰄛 catppuccin" "󰜗 nord" \
    " dark" " light" \
    | \
    . "$HOME/scripts/dmenu/dmenu.sh" \
    -l 8 \
    -c \
    ) 

change_theme() {
    theme_name=$1
    $HOME/scripts/theme/theme.sh "$theme_name"
    notify-send -t 1000 " Theme" "Switched to $theme_name"
}

# Execute selected action
case "$input" in
    "󰶞 matte") change_theme "matte" ;;
    "󰨷 tokyo") change_theme "tokyo" ;;
    " osaka") change_theme "osaka" ;;
    "󰇈 gruvbox") change_theme "gruvbox" ;;
    "󰄛 catppuccin") change_theme "catppuccin" ;;
    "󰜗 nord") change_theme "nord" ;;
    " dark") change_theme "dark" ;;
    " light") change_theme "light" ;;
    *) exit 0 ;;
esac
