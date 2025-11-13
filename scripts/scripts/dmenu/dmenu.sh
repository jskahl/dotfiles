#!/bin/sh

. "$HOME/scripts/dmenu/themes/current.sh"

dmenu -h 40 -c -i -fn 'JetBrainsMono Nerd font-15' \
    -nb "$DMENU_NB" \
    -nf "$DMENU_NF" \
    -sb "$DMENU_SB" \
    -sf "$DMENU_SF" \
    "$@"
