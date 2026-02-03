#!/bin/sh

# Get wallpaper
wallpaper=$(cat $HOME/.cache/current-wallpaper.txt)

# Set wallpaper
feh --bg-fill $wallpaper
