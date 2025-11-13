#!/bin/sh

city=$(cat $HOME/.cache/weather | sed "s/ /+/g")

weather=$(curl wttr.in/$city\?format=2 | sed "s/+//g" )
notify-send "Weather in $(echo $city | sed 's/+/ /g'):" "$weather"
