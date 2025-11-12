#!/bin/sh

# Load values from cache
CurrentTheme="$(cat "$HOME/.cache/current-theme")"
CurrentTone="$(cat "$HOME/.cache/current-tone")"
CurrentWallpaper="$(cat "$HOME/.cache/current-wallpaper")"

# Extract directory + file components
dir="$(dirname "$CurrentWallpaper")"
file="$(basename "$CurrentWallpaper")"

# Split filename format X-THEME.png
number="${file%%-*}"
rest="${file#*-}"
theme="${rest%.*}"
ext="${file##*.}"

# Next wallpaper index
next=$((number + 1))

# Build next wallpaper path
next_wallpaper="$dir/${next}-${theme}.${ext}"

# If next file doesn't exist, loop back to 1
if [ ! -f "$next_wallpaper" ]; then
    next_wallpaper="$dir/1-${theme}.${ext}"
fi

# Save selection
echo "$next_wallpaper" > "$HOME/.cache/current-wallpaper"

# Apply wallpaper (swww example)
feh --bg-fill "$next_wallpaper"
