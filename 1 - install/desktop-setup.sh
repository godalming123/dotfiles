#! /bin/sh

echo "=======STARTING DESKTOP INSTALLATION AND SETUP V1.7.0 ... ======"
echo ""
echo "STARTING DESKTOP INSTALLATION..."

# pacman software
sudo pacman -S  pipewire pipewire-alsa pipewire-jack pipewire-pulse arc-gtk-theme xorg-xwayland fish wofi

# paru software
paru -S wayfire

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
ln -s      ~/Documents/coding\ repos/dotfiles/wallpapers/                 ~/.config/

ln -s      ~/Documents/coding\ repos/dotfiles/fish/                       ~/.config/

ln -s      ~/Documents/coding\ repos/dotfiles/alacritty/                  ~/.config/

ln -s      ~/Documents/coding\ repos/dotfiles/wayfire/wayfire.ini         ~/.config/
ln -s      ~/Documents/coding\ repos/dotfiles/wayfire/wf-shell.ini        ~/.config/

sudo ln -s ~/Documents/coding\ repos/dotfiles/micro/                      ~/.config/

sudo ln -s ~/Documents/coding\ repos/dotfiles/fonts/iconsFont.ttf         /usr/share/fonts/TTF/

sudo ln -s ~/Documents/coding\ repos/dotfiles/sys-info/ufetch-endevour.sh /bin/ufetch-endevour.sh
chmod a+x  ~/Documents/coding\ repos/dotfiles/sys-info/ufetch-endevour.sh

echo "...FINISHED DESKTOP SETUP"
echo ""
echo "========== ...FINISHED DESKTOP INSTALLATION AND SETUP =========="

# lightdm setup
sudo systemctl enable lightdm --now