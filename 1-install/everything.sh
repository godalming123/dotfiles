#!/usr/bin/sh

# Absolute path for script EG: /home/user/dotfiles/1-install/everything.sh
SCRIPT=$(readlink -f "$0")
# Absolute path for script parent folder EG: /home/user/dotfiles/1-install
SCRIPT_PATH=$(dirname "$SCRIPT")
# Absolute path for dotfiles folder EG: /home/user/dotfiles
DOTFILES_PATH="$(dirname "$SCRIPT_PATH")"

echo "================================================================"
echo "===================== STARTING UPGRADES... ====================="
echo "================================================================"
sudo pacman -Syu
echo "================================================================"
echo "===================== ...FINISHED UPGRADES ====================="
echo "================================================================"
echo ""
echo "====================================================================="
echo "==== STARTING INSTALLATION AND CONFIIGURATION OF SYSTEM V1.0... ====="
echo "====================================================================="

function exec_ {
    chmod a+x $1
    $1
    echo ""
}

exec_ "$DOTFILES_PATH/software/software-sources.sh"

exec_ "$DOTFILES_PATH/git-config.sh"

exec_ "$DOTFILES_PATH/software/software-basic.sh"

exec_ "$DOTFILES_PATH/desktop-setup.sh"

exec_ "$DOTFILES_PATH/software/software-extra.sh"

echo ""
echo "================================================================"
echo "==== ...FINISHED INSTALLATION AND CONFIIGURATION OF SYSTEM ====="
echo "================================================================"
