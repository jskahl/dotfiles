#!/bin/sh

action=$(
    printf "%s\n" \
    "Sync musics" "Download music" | \
    $HOME/scripts/dmenu/dmenu.sh \
    -l 10 \
    -c \
)

case $action in
    "Sync musics") $HOME/scripts/hdd2sd.sh ;;
    "Download music") $HOME/scripts/dmenu/download-music-menu.sh ;;
esac
