#!/bin/bash

STARSHIP_CONF="$HOME/.config/starship/starship.toml"
PALETTE_FILE="$HOME/.cache/wal/colors-starship.toml"
PALETTE_NAME="palettes.pywal"

[ ! -f "$STARSHIP_CONF" ] && exit 1

remove_palette() {
  sed -i "/^\[$PALETTE_NAME\]/,/^\[/ {
    /^\[$PALETTE_NAME\]/d
    /^\[/!d
  }" "$STARSHIP_CONF"
}

add_palette() {
  remove_palette
  printf "\n%s\n" "$(cat "$PALETTE_FILE")" >> "$STARSHIP_CONF"


  sed -i "/pallete =/c\pallete = 'pywal'" "$HOME/.config/starship/starship.toml"
}

case "$1" in
  add)
    add_palette
    ;;
  remove)
    remove_palette
    ;;
  *)
    echo "Usage: $0 {add|remove}"
    exit 1
    ;;
esac
