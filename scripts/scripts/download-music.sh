#!/bin/zsh

sudo yt-dlp -x --audio-format mp3 --audio-quality 0 \
    --embed-thumbnail --add-metadata\
    -o "%(title)s.%(ext)s" \
    $1
