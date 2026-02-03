#!/bin/sh

action=$(
    printf "%s\n" \
    " Sync musics" " Download music" "󱎫 Timer" "󰿎 Movies" "󰍹 Monitor" "sync wpp" | \
    $HOME/scripts/dmenu/dmenu.sh \
    -l 10 \
    -c \
)

case $action in
    " Sync musics") $HOME/scripts/hdd2sd.sh ;;
    " Download music") $HOME/scripts/dmenu/download-music-menu.sh ;;
    "󱎫 Timer") $HOME/scripts/dmenu/timer-menu.sh ;;
    "󰿎 Movies") $HOME/scripts/dmenu/movies-menu.sh ;;
    "󰍹 Monitor") $HOME/scripts/monitor.sh ;;
    "sync wpp") $HOME/scripts/theme/set-wallpaper.sh ;;
esac
