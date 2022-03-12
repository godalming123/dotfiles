#!/bin/sh

updates=$(cat ./scripts/updates.txt)

if [ "$updates" != 0 ]; then
    notify-send -t 5000 "Get up-to-date" "You have $updates updates"
fi