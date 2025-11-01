#!/bin/sh

# Get wallpaper
wallpaper=$(cat $HOME/.cache/current-wallpaper)

# Set wallpaper
feh --bg-fill $wallpaper
