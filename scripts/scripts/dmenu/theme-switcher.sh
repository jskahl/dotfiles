#!/bin/sh

# import theme
. "$HOME/scripts/dmenu/themes/current.sh"
 
input=$(
    printf "%s\n" \
    "󰨷 tokyo" " osaka" "󰇈 gruvbox" "󰄛 catppuccin" "󰜗 nord" \
    " dark" " light" \
    | \
    dmenu -c -l 7 -fn 'JetBrainsMono Nerd font-15' \
    -nb "$DMENU_NB" \
    -nf "$DMENU_NF" \
    -sb "$DMENU_SB" \
    -sf "$DMENU_SF"
    ) 

if [ "$input" = "󰨷 tokyo" ]; then
    $HOME/scripts/theme.sh tokyo
    notify-send "Theme switched to Tokyo"
elif [ "$input" = "󰇈 gruvbox" ]; then
    $HOME/scripts/theme.sh gruvbox
    notify-send "Theme switched to Gruvbox"
elif [ "$input" = "󰜗 nord" ]; then
    $HOME/scripts/theme.sh nord
    notify-send "Theme switched to Nord"
elif [ "$input" = "󰄛 catppuccin" ]; then
    $HOME/scripts/theme.sh catppuccin
    notify-send "Theme switched to Catppuccin"
elif [ "$input" = " osaka" ]; then
    $HOME/scripts/theme.sh osaka
    notify-send "Theme switched to Osaka"
elif [ "$input" = " dark" ]; then
    $HOME/scripts/theme.sh dark
    notify-send "Theme switched to Dark"
elif [ "$input" = " light" ]; then
    $HOME/scripts/theme.sh light
    notify-send "Theme switched to Light"
else
    notify-send "No selection made"
fi
