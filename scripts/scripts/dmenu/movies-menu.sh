#!/bin/bash

MOVIES_DIR="$HOME/media/HDD/movies/"

MOVIE=$(
    find "$MOVIES_DIR" -maxdepth 3 -type f \
        \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" \) \
        -printf "%f\n" |
    sort |
    $HOME/scripts/dmenu/dmenu.sh -c -l 10
)

MOVIE_PATH=$(find "$MOVIES_DIR" -type f -name "$MOVIE" | head -n 1)

mpv "$MOVIE_PATH"
