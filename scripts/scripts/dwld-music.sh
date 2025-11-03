#!/bin/zsh

yt-dlp -x --audio-format mp3 --audio-quality 0 \
  --add-metadata\
  -o "%(title)s.%(ext)s" \
  $1
