#!/bin/zsh

yt-dlp -x \
    --audio-format mp3 --embed-thumbnail --add-metadata \
    --convert-thumbnails jpg \
    --ppa "ThumbnailsConvertor:-vf crop=in_h:in_h" \
    -o "%(title)s.%(ext)s" \
    $1
