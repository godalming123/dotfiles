#!/usr/bin/sh

echo "========== STARTING SOFTWARE SOURCES CONFIGURATION... =========="
echo ""
echo "INSTALLING FLATPAK SOFTWARE SOURCE..."
#flatpack
sudo pacman -S flatpak
echo "...FINISHED INSTALLING FLATPAK SOFTWARE SOURCE"
echo ""
echo "INSTALLING PARU AUR HELPER..."
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
rm -r paru/
echo "... FINISHED INSTALLING PARU AUR HELPER"
echo ""

#chatic aur

echo "========== ...FINISHED SOFTWARE SOURCES CONFIGURATION =========="