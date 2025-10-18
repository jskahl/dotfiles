#!/bin/sh

ls ~/pictures/
echo "Choose one"

read asw

echo "/home/j/pictures/$asw" > /home/j/.cache/wallpaper

