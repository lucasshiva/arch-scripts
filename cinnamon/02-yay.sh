#!/usr/bin/bash

# This script will install Yay and Git (if needed).

GITHUB_REPO="https://aur.archlinux.org/yay.git"
INSTALL_DIR="/opt"

# Colors
green=$(tput setaf 2)
yellow=$(tput setaf 3)
purple=$(tput setaf 5)
reset=$(tput sgr0)

install_yay() {
    git clone $GITHUB_REPO "${INSTALL_DIR}/yay"
    sudo chown -R $USER:$USER "${INSTALL_DIR}/yay"
    cd "${INSTALL_DIR}/yay"
    makepkg -si
    cd
}

if type -p yay >/dev/null; then
    echo "${green}Yay is already installed!${reset}"
elif pacman -Qi git &>/dev/null; then
    echo "${yellow}Installing yay..${reset}"
    install_yay
else
    echo "${yellow}Installing git..${reset}"
    sudo pacman -S --noconfirm git

    echo "${yellow}Installing yay..${reset}"
    install_yay
fi

echo "${green}All done!${reset}"
