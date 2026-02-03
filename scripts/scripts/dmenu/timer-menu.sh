#!/bin/bash

NAME="$(
    printf "%s" | \
    $HOME/scripts/dmenu/dmenu.sh \
    -p "Enter timer name: " \
    -l 0 \
    -b \
)"

TIME="$(
    printf "%s" | \
    $HOME/scripts/dmenu/dmenu.sh \
    -p "Enter time in seconds: " \
    -l 0 \
    -b \
)"

bar_id=8888  # notification ID for updates

while [ $TIME -gt 0 ]; do
    dunstify \
        -a "Timer" \
        -u low \
        -r "$bar_id" \
        "$NAME" \
        $TIME"s"
    sleep 1
    TIME=$((TIME - 1))
done

notify-send "The time is up!"
