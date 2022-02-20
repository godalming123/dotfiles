#!/usr/bin/sh

echo "============ INSTALLING EXTRA SOFTWARE PACKADGES... ============"
sudo pacman -S discord gnome-boxes

flatpak install flathub com.vscodium.codium com.microsoft.Teams
echo "======= ...FINISHED INSTALLING EXTRA SOFTWARE PACKADGES! ======="

#echo "================= INSTALLING BETTER DISCORD... ================="
#echo ""
#echo "============...FINISHED INSTALLING BETTER DISCORD... ==========="