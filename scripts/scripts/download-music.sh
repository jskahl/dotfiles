#!/bin/zsh

bar_id=9999  # notification ID for updates

yt-dlp -x \
    --audio-format mp3 --embed-thumbnail --add-metadata \
    --convert-thumbnails jpg \
    --ppa "ThumbnailsConvertor:-vf crop=in_h:in_h" \
    -o "%(title)s.%(ext)s" \
    --newline "$1" 2>&1 |
while IFS= read -r line; do
    # Extract percentage (handles 42%, 42.3%, 100%)
    percent=$(echo "$line" | grep -oE '[0-9]{1,3}(\.[0-9])?%' | tr -d '%')
    
    if [ -n "$percent" ]; then
        # Strip decimal to satisfy int:value requirements
        int_percent=${percent%.*}
        
        dunstify \
            -a "yt-dlp" \
            -u low \
            -r "$bar_id" \
            -h int:value:"$int_percent" \
            "Downloading..." \
            "$percent%"
    fi
done

# Final completed notification
dunstify \
    -a "yt-dlp" \
    -u normal \
    -r "$bar_id" \
    -h int:value:100 \
    "Download complete" "100%"
