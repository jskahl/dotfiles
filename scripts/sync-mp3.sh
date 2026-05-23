#!/bin/env bash

SD_CARD_DIR="$HOME/media/drive"
MUSICS_DIR="$HOME/media/HDD/musics"

sudo mount /dev/sdc1 $SD_CARD_DIR

sudo rsync -r --delete $MUSICS_DIR $SD_CARD_DIR

sync

sudo umount "$SD_CARD_DIR"

notify-send "Transfer completed"
