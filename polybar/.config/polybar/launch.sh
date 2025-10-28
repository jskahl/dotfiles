#!/usr/bin/env bash

DIR="$HOME/.config/polybar"

# Kill existing polybars
killall -q polybar
while pgrep -u "$UID" -x polybar >/dev/null; do
  sleep 0.1
done

# Detect connected monitors
MONITORS=$(polybar --list-monitors | cut -d":" -f1)

for m in $MONITORS; do
  MONITOR=$m polybar -q ws -c "$DIR/config.ini" &
  MONITOR=$m polybar -q date -c "$DIR/config.ini" &
  MONITOR=$m polybar -q laptop -c "$DIR/config.ini" &
  MONITOR=$m polybar -q hw -c "$DIR/config.ini" &
done
