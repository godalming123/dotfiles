#!/bin/bash

status=$(nmcli g | grep -oE "disconnected")
essid=$(nmcli c | grep wlan0 | awk '{print ($1)}')

if [[ "$1" == "--ESSID" ]]; then
	echo $essid
elif [[ "$1" == "--UPDATE-MENU" ]]; then

# === DEFINE VARS ===
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FIELDS=SSID,SECURITY
LIST=$(nmcli --fields "$FIELDS" device wifi list | sed '/^--/d') # avialiable networks
KNOWNCON=$(nmcli connection show) # Gives a list of known connections so we can parse it later
CONSTATE=$(nmcli -fields WIFI g) # Really janky way of telling if there is currently a connection
CURRSSID=$(LANGUAGE=C nmcli -t -f active,ssid dev wifi | awk -F: '$1 ~ /^yes/ {print $2}')

if [[ ! -z $CURRSSID ]]; then
    HIGHLINE=$(echo  "$(echo "$LIST" | awk -F "[  ]{2,}" '{print $1}' | grep -Fxn -m 1 "$CURRSSID" | awk -F ":" '{print $1}') + 1" )
fi

if [[ "$CONSTATE" =~ "enabled" ]]; then
    TOGGLE="toggle wifi off"
elif [[ "$CONSTATE" =~ "disabled" ]]; then
    TOGGLE="toggle wifi on"
fi

TEXT=$(echo -e "$TOGGLE\nmanual\n$LIST" | uniq -u)

echo -e "$TEXT"
fi