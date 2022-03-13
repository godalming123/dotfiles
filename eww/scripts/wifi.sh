#!/bin/sh

connected=$(nmcli c | grep wlan0 | awk '{print ($1)}')
help_text="WIFI-MAN - a tool to connect to wifi networks
=============================================
--ESSID           print the currently connected network (blank string when unconnected)
--LIST            list avialable wifi networks
--SIMPLE-LIST     list only name of avialable wifi networks
--COMPLEX-LIST       list all properties of wifi networks
--LIST-FORMAT     list all properties of wifi networks with an eww format
--TOGGLE          toggle wifi on/off
--CONNECT-UNKNOWN connect to an unknown network where 2nd argument is name and 3rd argument is password
--CONNECT-KNOWN   connect to a known network where 2nd argument is the network name
--CONNECT         an aliases to connect-unknown TODO: dynamically change between connect unknown and connect-known depending on if the network is known
--DISCONNECT      disconnect from connected network
--INFO            show basic info on device hardware
=============================================
if argument mathces none of the above this help text will be show
"

if [[ "$1" == "--ESSID" ]]; then
	echo "$connected"

elif [[ "$1" == "--LIST" ]]; then
	echo "$(nmcli --fields "SSID,SECURITY,IN-USE" dev wifi list)"

elif [[ "$1" == "--SIMPLE-LIST" ]]; then
	echo "$(nmcli --fields "SSID" dev wifi list)"

elif [[ "$1" == "--COMPLEX-LIST" ]]; then
	echo "$(nmcli dev wifi list)"

elif [[ "$1" == "--LIST-FORMAT" ]]; then
    IFS=$'\n'       # make newlines the only separator
    set -f          # disable globbing

	list=$(./wifi.sh --LIST | tail -n +2)
	headers=$(./wifi.sh --LIST | head -n 1)

    buf=""
    for line in $list; do
        network_name=$(echo "$line" | awk '{print $1}')
        buf="(button :hexpand true :halign \"fill\" :class \"btn\" :style \"padding: 4px 2px;font-size: 15px;margin: 0;\" :onclick \"./wifi.sh --CONNECT $network_name\" \"$line\" )\n    $buf"
    done
    echo -e "(box :orientation \"v\" :class \"wifi-networks\" :halign \"fill\" :valign \"end\" :hexpand true :space-evenly false\n    (label :text \"$headers\")\n    $buf)"

elif [[ "$1" == "--TOGGLE" ]]; then
    if [[ "$connected" == "" ]]; then
        nmcli radio wifi on
    else
        nmcli radio wifi off
    fi

elif [[ "$1" == "--CONNECT-UNKNOWN" ]]; then
    sudo nmcli dev wifi connect $2 password $3

elif [[ "$1" == "--CONNECT-KNOWN" ]]; then
    nmcli con up $2

elif [[ "$1" == "--CONNECT" ]]; then
    ./wifi.sh --CONNECT-UNKNOWN $2 $3


elif [[ "$1" == "--DISCONNECT" ]]; then
    nmcli con down $connected

elif [[ "$1" == "--INFO" ]]; then
    echo "$(nmcli -o)"
else
    echo -e "$help_text"
fi
