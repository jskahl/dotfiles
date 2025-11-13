#!/bin/sh

city="Araquari"

weather=$(curl wttr.in/$city\?format=2 | sed "s/+//g" )

notify-send "Weather in $city": "$weather"
