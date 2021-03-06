#!/usr/bin/sh

# Absolute path for script EG: /home/user/dotfiles/1-install/desktop-setup.sh
SCRIPT=$(readlink -f "$0")
# Absolute path for script parent folder EG: /home/user/dotfiles/1-install
SCRIPT_PATH=$(dirname "$SCRIPT")
# Absolute path for dotfiles folder EG: /home/user/dotfiles
DOTFILES_PATH="$(dirname "$SCRIPT_PATH")"

echo "======= STARTING DESKTOP INSTALLATION AND SETUP V1.8.0 ... ======"
echo ""
echo "STARTING DESKTOP INSTALLATION..."

# pacman software
sudo pacman -S --needed pipewire-alsa pipewire-jack pipewire-pulse pipewire arc-gtk-theme xorg-xwayland fish wofi light python-pip mako # we cant use noconfirm for this as there is a dependency issue meaning that the default selections cancel the installation

# paru software
paru -S --noconfirm --needed wayfire eww-wayland-git

# pip software
pip install wal

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
ln -s      "$DOTFILES_PATH/eww/"                       ~/.config/

ln -s      "$DOTFILES_PATH/wal/"                       ~/.config/

ln -s      "$DOTFILES_PATH/btop/"                       ~/.config/

ln -s      "$DOTFILES_PATH/fish/"                      ~/.config/

ln -s      "$DOTFILES_PATH/alacritty/"                 ~/.config/

ln -s      "$DOTFILES_PATH/wayfire/wayfire.ini"        ~/.config/
ln -s      "$DOTFILES_PATH/wayfire/wf-shell.ini"       ~/.config/

ln -s      $DOTFILES_PATH/micro/                     ~/.config/

sudo ln -s "$DOTFILES_PATH/scripts/ufetch-endevour.sh" /bin/
chmod a+x  "$DOTFILES_PATH/scripts/ufetch-endevour.sh"

echo "...FINISHED DESKTOP SETUP"
echo ""
echo "========== ...FINISHED DESKTOP INSTALLATION AND SETUP =========="
