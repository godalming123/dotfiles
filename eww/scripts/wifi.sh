#!/bin/sh

connected=$(nmcli c | grep wlan0 | awk '{print ($1)}')
help_text="WIFI-MAN V1 - a tool to connect to wifi networks
================================================
[e]SSID           print the currently connected network (blank string when unconnected)
[l]IST            list avialable wifi networks
[s]IMPLE-LIST     list only name of avialable wifi networks
[c]OMPLEX-LIST       list all properties of wifi networks
[L]IST-FORMAT     list all properties of wifi networks with an eww format
[t]OGGLE          toggle wifi on/off
[u]ONNECT-UNKNOWN connect to an unknown network where 2nd argument is name and 3rd argument is password
[k]ONNECT-KNOWN   connect to a known network where 2nd argument is the network name
[C]ONNECT         an aliases to connect-unknown TODO: dynamically change between connect unknown and connect-known depending on if the network is known
[d]ISCONNECT      disconnect from connected network
[E]NABLED         returns true if wifi is enabled false otherwise
[i]NFO            show basic info on device hardware
================================================
if argument mathces none of the above this help text will be shown
"

case $1 in
e | "ESSID")
	echo "$connected"
    ;;

l | "LIST")
	echo "$(nmcli --fields "SSID,SECURITY,IN-USE" dev wifi list)"
    ;;

s| "SIMPLE-LIST")
	echo "$(nmcli --fields "SSID" dev wifi list)"
    ;;

c | "COMPLEX-LIST")
	echo "$(nmcli dev wifi list)"
    ;;

L | "LIST-FORMAT")
    if [[ "$(~/.config/eww/scripts/wifi.sh ENABLED)" == "true" ]]; then
        IFS=$'\n'       # make newlines the only separator
        set -f          # disable globbing
    	list=$(~/.config/eww/scripts/wifi.sh LIST | tail -n +2)

        buf=""
        for line in $list; do
            network_name=$(echo "$line" | awk '{print $1}')
            network_security=$(echo "$line" | awk '{print $2}')
            network_in_use=$(echo "$line" | awk '{print $3}')
            if [[ network_security == "" ]]; then
                locking_icon=""
            else
                locking_icon="(image :path \"./icons/dark/lock.png\" :image-height 20)"
            fi
            text="\n        (box :space-evenly false :halign \"fill\" :orientation \"h\" $locking_icon \"$network_name\")\n    "
            buf="    (button :hexpand true :halign \"fill\" :class \"btn list-item\" :onclick \"~/.config/eww/scripts/wifi.sh CONNECT '$network_name'\" $text)\n$buf"
        done
    else
        buf="WIFI disabled"
    fi    
    echo -e "(box :orientation \"v\" :class \"wifi-networks\" :halign \"fill\" :valign \"end\" :hexpand true :space-evenly false\n$buf)"
    ;;

t | "TOGGLE")
    if [[ "$(~/.config/eww/scripts/wifi.sh ENABLED)" == "true" ]]; then
        nmcli radio wifi off
    else
        nmcli radio wifi on
    fi
    ;;

E | "ENABLED")
    enabled=$(nmcli radio wifi)
    if [[ "$enabled" == "enabled" ]]; then
        echo "true"
    else
        echo "false"
    fi
    ;;

u | "CONNECT-UNKNOWN")
    network_security=$(nmcli --fields "SECURITY,SSID" | grep -i "$2")
    if [[ "$3" == "" ]]; then
        if [[ "$network_security" != "" ]]; then
            # if no password is supplied and the network has a password
            password=$(wofi --show dmenu -p "Password")
            notify-send test1
        fi
        notify-send test3
    else
        password=$3
        notify-send test2
    fi
    nmcli dev wifi connect $2 password $password
    notify-send "Name: $2 Password: '$password'"
    ;;

k | "CONNECT-KNOWN")
    nmcli con up $2
    ;;

C | "CONNECT")
    ~/.config/eww/scripts/wifi.sh CONNECT-UNKNOWN $2 $3
    ;;

D | "DISCONNECT")
    nmcli con down $connected
    ;;

i | "INFO")
    echo "$(nmcli -o)"
    ;;
*)
    echo -e "$help_text"
    ;;
esac
