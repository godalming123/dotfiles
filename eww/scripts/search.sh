#!/bin/sh
list=$(ls /usr/bin/ | grep -m 20 -i "$1")

if ["$1" == ""]; then
  result="(label :text \"test\")"
else
  buf=""
  for name in $list ; do
    buf="(button :hexpand true :halign \"fill\" :valign \"fill\" :class \"btn\" :style \"padding: 4px 2px;font-size: 15px;margin: 0;\" :onclick \"eww close menu & $name &\" \"$name\" ) $buf"
  done
  result="(box :orientation \"v\" :class \"apps\" :halign \"fill\" :valign \"fill\" :hexpand true :space-evenly false $buf)"
fi

eww update search_listen="$result"
