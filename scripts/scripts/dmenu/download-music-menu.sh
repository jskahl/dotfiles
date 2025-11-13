#!/bin/sh

sudo
music_dir="/home/j/media/HDD/musics"

. "/home/j/scripts/dmenu/themes/current.sh"

# Function found in https://github.com/dylanaraps/pure-bash-bible
# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}
 
directory=$(
    printf "%s\n" "" \
    | \
    . "$HOME/scripts/dmenu/dmenu.sh" \
    -p "Enter directory name:" \
    -l 0
)

directory=$(trim_all "$directory")
# Checks if directory is empty
if [ -z "$directory" ]; then
    exit 0
fi


link_provided=$(
    printf "%s\n" "" \
    | \
    . "$HOME/scripts/dmenu/dmenu.sh" \
    -p "Download link: " \
    -l 0
)

link_provided=$(trim_all "$link_provided")
# Checks if directory is empty
if [ -z "$link_provided" ]; then
    exit 0
fi

function download_music() {
    cd "$music_dir/$directory"
    link=$1

    . "/home/j/scripts/download-music.sh" "$link" > /dev/null 2>&1
    mpc update && mpc rescan > /dev/null 2>&1
    notify-send "Download completed! Saved in '$directory"
}

dir_exists=$(ls "$music_dir/$directory")
if [ -z "$dir_exists" ]; then
    mkdir "$music_dir/$directory" -p
    download_music "$link_provided"
else
    download_music "$link_provided"
fi
