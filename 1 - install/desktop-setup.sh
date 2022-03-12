#!/usr/bin/sh

echo "=======STARTING DESKTOP INSTALLATION AND SETUP V1.8.0 ... ======"
echo ""
echo "STARTING DESKTOP INSTALLATION..."

# pacman software
sudo pacman -S  pipewire pipewire-alsa pipewire-jack pipewire-pulse arc-gtk-theme xorg-xwayland fish wofi light

# paru software
paru -S wayfire eww-wayland-git

# add user to video group  so he/she can change the brightness
sudo usermod -aG video $USER

echo "...FINISHED DESKTOP INSTALLATION"
echo ""
echo "STARTING DESKTOP SETUP..."

# icons in the terminal
# git clone https://github.com/sebastiencs/icons-in-terminal.git
# cd icons-in-terminal
# bash install-autodetect.sh
# cd ../

# icons in ls menu
# sudo pacman -S wget
# git clone https://github.com/sebastiencs/ls-icons.git
# ./bootstrap
# export CFLAGS=-DNO_TRUE_COLOURS=1 # Execute this line _only_ if your terminal doesn't support true colours
# export CC=clang CXX=clang++
# ./configure --prefix=/opt/coreutils
# make
# make install
# /opt/coreutils/bin/ls
# cd ../

#change shell
chsh -s /bin/fish $USER

# set hostname (the code does not work for some reason so comented out)
# oldHostname=hostname
# newHostname="LapyZapy"

# sudo hostnamectl set-hostname "$newHostname"
# sudo sed -i 's/$oldHostname/$newHostname/g' /etc/hosts

# add config folder
mkdir ~/.config/

# add config files
ln -s      ~/Documents/coding\ repos/dotfiles/eww/                 ~/.config/

ln -s      ~/Documents/coding\ repos/dotfiles/mako/                      ~/.config/

ln -s      ~/Documents/coding\ repos/dotfiles/fish/                       ~/.config/

ln -s      ~/Documents/coding\ repos/dotfiles/alacritty/                  ~/.config/

ln -s      ~/Documents/coding\ repos/dotfiles/wayfire/wayfire.ini         ~/.config/
ln -s      ~/Documents/coding\ repos/dotfiles/wayfire/wf-shell.ini        ~/.config/

sudo ln -s ~/Documents/coding\ repos/dotfiles/micro/                      ~/.config/

sudo ln -s ~/Documents/coding\ repos/dotfiles/scripts/ufetch-endevour.sh /bin/
chmod a+x  ~/Documents/coding\ repos/dotfiles/scripts/ufetch-endevour.sh

echo "...FINISHED DESKTOP SETUP"
echo ""
echo "========== ...FINISHED DESKTOP INSTALLATION AND SETUP =========="
