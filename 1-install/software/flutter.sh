#!/bin/sh

mkdir ~/Documents/
cd ~/Documents/

git clone https://github.com/flutter/flutter.git -b stable
cd flutter
./bin/flutter config --enable-linux-desktop
sudo pacman -S clang cmake ninja-build pkg-conf
./bin/flutter doctor