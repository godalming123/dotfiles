#!/bin/sh

release=$(curl "https://api.github.com/repos/vaxerski/Hyprland/releases/latest" |
		grep '"tag_name":' |
		sed -E 's/.*"([^"]+)".*/\1/')

if [ "$release" = "$(cat ./current-release.txt)" ]; then
		echo "there were no update for Hyprland"
else
		echo "updating hyprland"
		curl https://github.com/vaxerski/Hyprland/releases/download/$release/$release.tar.gz -o hyprland-latest.tar.gz
		tar -xvzf hyprland-latest.tar.gz
		sudo mv ./hyprland /bin/
		sudo mv ./hyprctrl /bin/
		libFile = $(ls | grep "libwlroots")
		mv "$libFile" /usr/lib/
		rm ./example
		echo $release > ./current-release.txt
fi

