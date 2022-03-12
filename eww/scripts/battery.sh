#!/bin/sh
BAT=`ls /sys/class/power_supply | grep BAT | head -n 1`
power=$(cat /sys/class/power_supply/${BAT}/capacity)
status=$(cat /sys/class/power_supply/${BAT}/status)

echo "$power" > ./scripts/battery-charge.txt
echo "$status" > ./scripts/battery-status.txt
