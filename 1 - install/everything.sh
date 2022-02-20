#!/usr/bin/sh

echo "================================================================"
echo "===================== STARTING UPGRADES... ====================="
echo "================================================================"
sudo pacman -Syu
echo "================================================================"
echo "===================== ...FINISHED UPGRADES ====================="
echo "================================================================"
echo ""
echo "================================================================"
echo "==== STARTING INSTALLATION AND CONFIIGURATION OF SYSTEM V1.0... ====="
echo "================================================================"

function exec_ {
    chmod a+x $1
    bash $1
    echo ""
}

exec_ ./software/software-sources.sh

exec_ ./git-config.sh

exec_ ./software/software-basic.sh

exec_ ./desktop-setup.sh

exec_ ./software/software-extra.sh

echo ""
echo "================================================================"
echo "==== ...FINISHED INSTALLATION AND CONFIIGURATION OF SYSTEM ====="
echo "================================================================"