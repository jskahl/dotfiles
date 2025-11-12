#!/bin/zsh

bar_id=9999  # notification ID for updates

yt-dlp -x \
    --audio-format mp3 --embed-thumbnail --add-metadata \
    --convert-thumbnails jpg \
    --ppa "ThumbnailsConvertor:-vf crop=in_h:in_h" \
    -o "%(title)s.%(ext)s" \
    --newline "$1" 2>&1 |
while IFS= read -r line; do
    # Extract percentage (like "42.3%")
    percent=$(echo "$line" | sed -n 's/.*\([0-9]\{1,3\}\)\.[0-9]%.*/\1/p')

    if [ -n "$percent" ]; then
        dunstify \
            -a "yt-dlp" \
            -u low \
            -r "$bar_id" \
            -h int:value:"$percent" \
            "Downloading..." \
            "${percent}%"
    fi
done

# Final completed notification
dunstify \
    -a "yt-dlp" \
    -u normal \
    -r "$bar_id" \
    -h int:value:100 \
