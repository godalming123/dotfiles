#!/bin/sh
list=$(ls /usr/bin/ | grep -m 20 -i "$1")

buf=""
for name in $list ; do
  buf="$buf \n (button :vexpand true :halign \"fill\" :valign \"fill\" :class \"btn\" :style \"padding: 4px 2px;font-size: 15px;margin: 0;\" :onclick \"$name\" \"$name\" )"
done
result="(box :orientation \"v\" :class \"apps\" :halign \"fill\" :valign \"fill\" :vexpand true :space-evenly false $buf\n)"
echo -e "$result" > ~/.config/eww/search-items.txt
echo -e "$result"
