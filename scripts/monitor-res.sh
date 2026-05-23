#!/bin/env bash

HYPRLAND_CONFIG="$HOME/.config/hypr/hyprland.conf"
IS_HD="$(cat "$HYPRLAND_CONFIG" | grep -i 1920)"

echo $IS_HD

if [[ -z "$IS_HD"  ]]; then
    sed -i 's/1600x900/1920x1080/' $HYPRLAND_CONFIG
    hyprctl keyword monitor "eDP-1, disable"
else
    sed -i 's/1920x1080/1600x900/' $HYPRLAND_CONFIG
    hyprctl keyword monitor "eDP-1, disable"
fi
