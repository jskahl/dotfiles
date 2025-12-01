#!/bin/sh

current_song=$(mpc current)

if [ -z "$current_song" ]; then
    current_song="No song playing"
fi

action=$(
    printf "%s\n" \
    "󰐎 Toggle" "󰒭 Next" " Repeat" " Shuffle" "󰃢 Clear" " Crop"\
    " Pick music" "󰀥 Pick album" "󰤺 Pick queue" \
     | \
    rofi -dmenu -i \
    -theme-str "textbox{ content: \"$current_song\"; }" \
)

pick_music() {
    music=$(
        find ~/media/HDD/musics -type f | \
        fzf --filter '' | \
        sed 's#^/home/j/media/HDD/musics/##' | \
        rofi -dmenu -i \
        -theme-str "textbox{ content: \"$current_song\"; }" \
    )

    # If input is empty exit the script
    if [ -z "$music" ]; then
        exit 0
    fi

    mpc add "$music"

    if [ "$(mpc status | grep playing)" = "" ]; then
        mpc play
    fi

    notify-send -t 1000 " Added to queue: $music"
}

pick_album() {
    album=$(
        find ~/media/HDD/musics -type d | \
        fzf --filter '' | \
        sed 's#^/home/j/media/HDD/musics/##' | \
        rofi -dmenu -i \
        -theme-str "textbox{ content: \"$current_song\"; }" \
    )

    # If input is empty exit the script
    if [ -z "$album" ]; then
        exit 0
    fi
    
    mpc add "$album"
    notify-send " Added album to queue: $album"

    if [ "$(mpc status | grep playing)" = "" ]; then
        mpc play
        notify-send -t 1000 " Playing $(mpc current)"
    fi
}

picom_from_queue() {
    music="$(
        mpc playlist -f "%position%) %title%" | \
        rofi -dmenu -i \
        -theme-str "textbox{ content: \"$current_song\"; }" \
    )"

    # If input is empty exit the script
    if [ -z "$music" ]; then
        exit 0
    fi

    mpc pause
    # Take only the first character (queue position)
    music_position=${music:0:3}
    sed 's/) //' <<< "$music_position"
    mpc play $music_position
    mpc play

    notify-send -t 1000 " Playing ${music:3}"
}

# Execute selected action
case $action in 
    "󰐎 Toggle") 
        if [ "$(mpc status | grep playing)" != "" ]; then
            mpc pause
            notify-send -t 1000 " Paused $(mpc current)"
        else
            mpc play
            notify-send -t 1000 " Playing $(mpc current)"
        fi
        ;;
    "󰒭 Next") mpc pause && mpc next && mpc play && notify-send -t 1000 " Playing $(mpc current)" ;;
    " Repeat") mpc repeat && notify-send -t 1000 " Repeat toggled" ;;
    "󰃢 Clear") mpc clear && notify-send -t 1000 " Music queue cleared" ;;
    " Crop") mpc crop && notify-send -t 1000 " Music queue cropped" ;;
    " Pick music") pick_music ;;
    "󰀥 Pick album") pick_album ;;
    "󰤺 Pick queue") picom_from_queue ;;
    " Shuffle") mpc shuffle && notify-send -t 1000 " Music queue shuffled" ;;
    *) exit 0 ;;
esac

