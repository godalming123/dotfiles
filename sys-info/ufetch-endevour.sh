#!/bin/sh

# INFO

host="$(cat /etc/hostname)"
os="Endevour OS"
kernal="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packadges="$(pacman -Q | wc -l)"
shell="$(basename "${SHELL}")"

# FONT SETTINGS

reset="$(tput sgr0)"
bold="$(tput bold)"

# FONT COLORS

black="$(tput setaf 0)"
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
magenta="$(tput setaf 5)"
cyan="$(tput setaf 6)"
white="$(tput setaf 7)"

# ECHO

echo "${bold}${blue}${USER}${white}@${cyan}${host}${reset}"
echo "-------------------------------------"
echo "${bold}${blue}OS       : ${reset}${cyan}${os}"
echo "${bold}${blue}KERNAL   : ${reset}${cyan}${kernal}"
echo "${bold}${blue}UPTIME   : ${reset}${cyan}${uptime}"
echo "${bold}${blue}PACKADGES: ${reset}${cyan}${packadges}"
echo "${bold}${blue}SHELL    : ${reset}${cyan}${shell}"
