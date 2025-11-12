#!/bin/sh

. "$HOME/scripts/dmenu/themes/current.sh"
 
action=$(
    printf "%s\n" \
    " Play" " Pause" "󰒭 Next" " Pick music" "󰀥 Pick album" \
    | \
    dmenu -h 40 -c -i -l 7 -fn 'JetBrainsMono Nerd font-15' \
    -nb "$DMENU_NB" \
    -nf "$DMENU_NF" \
    -sb "$DMENU_SB" \
    -sf "$DMENU_SF"
    ) 

if [ "$action" = " Play" ]; then
    mpc play
    notify-send " Playing $(mpc current)"
elif [ "$action" = " Pause" ]; then
    mpc pause
    notify-send " Music paused"
elif [ "$action" = "󰒭 Next" ]; then
    mpc pause
    mpc next
    mpc play
    notify-send " Playing $(mpc current)"
elif [ "$action" = " Pick music" ]; then
    music=$(find ~/media/HDD/musics -type f \
    | \
    fzf --filter '' \
    | \
    sed 's#^/home/j/media/HDD/musics/##' \
    | \
    dmenu -h 40 -c -i -l 10 -fn 'JetBrainsMono Nerd font-15' \
    -nb "$DMENU_NB" \
    -nf "$DMENU_NF" \
    -sb "$DMENU_SB" \
    -sf "$DMENU_SF" \
    )
    mpc add "$music"

    notify-send " Added to queue: $music"
elif [ "$action" = "󰀥 Pick album" ]; then
    album=$(find ~/media/HDD/musics -type d \
    | \
    fzf --filter '' \
    | \
    sed 's#^/home/j/media/HDD/musics/##' \
    | \
    dmenu -h 40 -c -i -l 7 -fn 'JetBrainsMono Nerd font-15' \
    -nb "$DMENU_NB" \
    -nf "$DMENU_NF" \
    -sb "$DMENU_SB" \
    -sf "$DMENU_SF" \
    )
    
    mpc add "$album"
    notify-send " Added album to queue: $album"
fi
