#!/bin/sh

. "$HOME/scripts/dmenu/themes/current.sh"
 
action=$(
    printf "%s\n" \
    " Play" " Pause" "󰒭 Next" " Pick music" "󰀥 Pick album" "󰃢 Clear queue" " Crop queue" \
    | \
    . "$HOME/scripts/dmenu/dmenu.sh" \
    ) 

pick_music() {
    music=$(find ~/media/HDD/musics -type f \
    | \
    fzf --filter '' \
    | \
    sed 's#^/home/j/media/HDD/musics/##' \
    | \
    . "$HOME/scripts/dmenu/dmenu.sh" 
    )

    # If input is empty exit the script
    if [ -z "$music" ]; then
        exit 0
    fi

    mpc add "$music"

    if [ "$(mpc status | grep playing)" = "" ]; then
        mpc play
    fi

    notify-send " Added to queue: $music"
}

pick_album() {
    album=$(find ~/media/HDD/musics -type d \
    | \
    fzf --filter '' \
    | \
    sed 's#^/home/j/media/HDD/musics/##' \
    | \
    . "$HOME/scripts/dmenu/dmenu.sh" 
    )

    # If input is empty exit the script
    if [ -z "$album" ]; then
        exit 0
    fi
    
    mpc add "$album"
    notify-send " Added album to queue: $album"

    if [ "$(mpc status | grep playing)" = "" ]; then
        mpc play
        notify-send " Playing $(mpc current)"
    fi
}

# Execute selected action
case $action in 
    " Play") mpc play && notify-send " Playing $(mpc current)" ;;
    " Pause") mpc pause && notify-send " Music paused" ;;
    "󰒭 Next") mpc pause && mpc next && mpc play && notify-send " Playing $(mpc current)" ;;
    "󰃢 Clear queue") mpc clear && notify-send " Music queue cleared" ;;
    " Crop queue") mpc crop && notify-send " Music queue cropped" ;;
    " Pick music") pick_music ;;
    "󰀥 Pick album") pick_album ;;
    "") 
        exit 0
        ;;
esac
