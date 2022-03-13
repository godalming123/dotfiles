#!/bin/sh

charge=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$charge" -lt 20 ]; then
    notify-send -t 5000 "Running low on juice" "You have $charge% charge left"
fi