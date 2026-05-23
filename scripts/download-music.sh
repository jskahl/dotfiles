#!/bin/env bash

URL="$1"
DOWNLOAD_DIR="$HOME/media/HDD/musics/"

# Get playlist title if it exists, otherwise video title
# DOWNLOAD_TITLE=$(yt-dlp --print "%(playlist_title|)s%(title)s" --no-warnings "$URL")

mkdir -p "$DOWNLOAD_DIR$2"
cd "$DOWNLOAD_DIR$2"

# Run download
yt-dlp -x \
    --audio-format mp3 --embed-thumbnail --add-metadata \
    --convert-thumbnails jpg \
    --ppa "ThumbnailsConvertor:-vf crop=in_h:in_h" \
    -o "%(title)s.%(ext)s" \
    --newline "$URL"

# Check if download succeeded
if [ $? -eq 0 ]; then
    notify-send "Download finished" #"$DOWNLOAD_TITLE"
else
    notify-send "Download failed" #"$DOWNLOAD_TITLE"
fi

# Updates MPD database
mpc update
