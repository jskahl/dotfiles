#!/bin/sh

CurrentWallpaper="$(cat $HOME/.cache/current-wallpaper)"

betterlockscreen -u $CurrentWallpaper --blur > /dev/null
