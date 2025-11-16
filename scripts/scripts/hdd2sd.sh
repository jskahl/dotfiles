#!/bin/sh

musics_dir="$HOME/media/HDD/musics/"
sd_dir="$HOME/media/drive"

mount "$sd_dir"
sleep 1.5

# Pass files from HDD to SD card
rsync -av --delete "$musics_dir" "$sd_dir"
sync
notify-send "Transfer complete"
