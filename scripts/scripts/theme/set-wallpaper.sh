#!/bin/sh

CurrentWallpaper="$(cat $HOME/.cache/current-wallpaper.txt)"

betterlockscreen -u "$CurrentWallpaper" --display 0 --blur \
    > /dev/null 2>&1

betterlockscreen -u "$CurrentWallpaper" --display 1 --blur \
    > /dev/null 2>&1
