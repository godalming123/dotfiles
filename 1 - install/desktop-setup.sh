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
sudo mkdir     /usr/share/backgrounds/
sudo mkdir     /usr/share/backgrounds/bspwm/
sudo curl -o   /usr/share/backgrounds/bspwm/windows.jpg           https://godalming123.github.io/blog/files/linux-setup/configs/wallpapers/windows.jpg
sudo curl -o   /usr/share/backgrounds/bspwm/detailed-mountain.jpg https://godalming123.github.io/blog/files/linux-setup/configs/wallpapers/detailed-mountain.jpg
sudo curl -o   /usr/share/backgrounds/bspwm/simple-mountain.jpg   https://godalming123.github.io/blog/files/linux-setup/configs/wallpapers/simple-mountain.jpg

sudo mkdir     /usr/share/backgrounds/icons/
sudo curl -o   /usr/share/backgrounds/icons/logo.png              https://godalming123.github.io/blog/files/linux-setup/configs/icon.png

curl -o        ~/.config/fish/config.fish          https://godalming123.github.io/blog/files/linux-setup/configs/config.fish

sudo curl -o   /bin/ufetch-arch.sh                 https://godalming123.github.io/blog/files/linux-setup/configs/ufetch-arch.sh
sudo chmod a+x /bin/ufetch-arch.sh

mkdir          ~/.config/alacritty/
curl -o        ~/.config/alacritty/alacritty.yml   https://godalming123.github.io/blog/files/linux-setup/configs/alacritty.yml

mkdir          ~/.config/bspwm/
curl -o        ~/.config/bspwm/bspwmrc             https://godalming123.github.io/blog/files/linux-setup/configs/bspwmrc
chmod a+x      ~/.config/bspwm/bspwmrc

sudo mkdir     /usr/share/fonts/TTF/
sudo curl -o   /usr/share/fonts/TTF/Material-Design-Iconic-Font.ttf https://godalming123.github.io/blog/files/linux-setup/configs/Material-Design-Iconic-Font.ttf

echo "...FINISHED DESKTOP SETUP"
echo ""
echo "========== ...FINISHED DESKTOP INSTALLATION AND SETUP =========="

# lightdm setup
sudo systemctl enable lightdm --now