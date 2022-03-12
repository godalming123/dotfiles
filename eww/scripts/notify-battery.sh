#!/bin/sh

charge=$(cat ./scripts/battery-charge.txt)

if [ "$charge" -lt 20 ]; then
    notify-send -t 5000 "Running low on juice" "You have $charge% charge left"
fi