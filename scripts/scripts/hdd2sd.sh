#!/bin/sh
set -e

musics_dir="$HOME/media/HDD/musics/"
sd_dir="$HOME/media/drive"
device="/dev/sdc1"   # change this

mount $device "$sd_dir"

mountpoint -q "$sd_dir"

rsync -av --delete "$musics_dir" "$sd_dir/"
sync

notify-send "Transfer complete" 2>/dev/null || true

umount "$sd_dir"
