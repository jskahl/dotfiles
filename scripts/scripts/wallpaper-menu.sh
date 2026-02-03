#!/usr/bin/env bash

DIR="$HOME/media/wallpapers"
CACHE_WALL="$HOME/.cache/current-wallpaper.txt"

cd "$DIR" || exit 1

mapfile -t images < <(
  find . -type f \( \
    -iname "*.png" -o \
    -iname "*.jpg" -o \
    -iname "*.jpeg" -o \
    -iname "*.webp" -o \
    -iname "*.bmp" -o \
    -iname "*.gif" \
  \) | sort
)

[[ ${#images[@]} -eq 0 ]] && exit 1

rofi_input=""
for img in "${images[@]}"; do
  abs_path="$(realpath "$img")"
  name="$(basename "$img")"
  rofi_input+="$name | $abs_path\0icon\x1f$abs_path\n"
done

SELECTED=$(printf "%b" "$rofi_input" | rofi \
  -dmenu \
  -i \
  -show-icons \
  -theme "$HOME/.config/rofi/wallpapers.rasi"
)

[[ -z "$SELECTED" ]] && exit 0

# Extract absolute path (everything after " | ")
WALLPAPER="${SELECTED#* | }"

echo "$WALLPAPER" > "$CACHE_WALL"

feh --bg-fill "$WALLPAPER"
wal -i "$WALLPAPER"

# Change themes for various apps
WAL_DIR="$HOME/.cache/wal"

cat "$WAL_DIR/colors-alacritty.toml" > "$HOME/.config/alacritty/themes/current.toml"

sed -i 's/^background = #/background = #77/' "$WAL_DIR/colors-polybar.ini"
cat "$WAL_DIR/colors-polybar.ini" > "$HOME/.config/polybar/themes/current.ini"

"$HOME/scripts/starship-pallete-sync.sh" remove
"$HOME/scripts/starship-pallete-sync.sh" add

cat "$WAL_DIR/colors-dmenu.sh" > "$HOME/scripts/dmenu/themes/current.sh"

pywalfox update

cat "$WAL_DIR/colors-rofi.rasi" > "$HOME/.config/rofi/themes/current.rasi"

cat "$WAL_DIR/colors-obsidian.css" > "$HOME/notes/.obsidian/snippets/current.css"
