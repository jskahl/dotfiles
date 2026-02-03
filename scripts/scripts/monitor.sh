#!/bin/bash

CHECK_MONITOR=$(xrandr | grep -i 'HDMI-1 connected')

if [ -z "$CHECK_MONITOR" ]; then
    xrandr --output HDMI-1 --auto
    xrandr --output HDMI-1 --above eDP-1
    i3 restart
    exit 0

else
    ACTION="$(
        printf "%s\n" " Place above" " Place in right" " Place below" " Place in left" " Turn off" |
        $HOME/scripts/dmenu/dmenu.sh -c -l 10
    )"

    if [ -z "$ACTION" ]; then
        exit 0
    fi

    case $ACTION in
        " Place above")
            xrandr --output HDMI-1 --auto --above eDP-1
            i3 restart
            ;;
        " Place in right")
            xrandr --output HDMI-1 --auto --right-of eDP-1
            i3 restart
            ;;
        " Place below")
            xrandr --output HDMI-1 --auto --below eDP-1
            i3 restart
            ;;
        " Place in left")
            xrandr --output HDMI-1 --auto --left-of eDP-1
            i3 restart
            ;;
        " Turn off")
            xrandr --output HDMI-1 --off
            i3 restart
            ;;
    esac
fi
