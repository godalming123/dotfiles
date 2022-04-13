#!/usr/bin/sh

SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH="$SCRIPT_PATH.."

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
    bash $1
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
