#!/usr/bin/bash

# This script will enable printing support for Arch Linux.

# Colors
green=$(tput setaf 2)
yellow=$(tput setaf 3)
purple=$(tput setaf 5)
reset=$(tput sgr0)

install_package() {
    if pacman -Qi $1 &>/dev/null; then
        echo "${green}Package "$1" is already installed.${reset}"
    else
        echo "${yellow}Installing package: "$1"${reset}"
        sudo pacman -S --noconfirm --needed $1
    fi
}
packages=(
    cups
    cups-pdf
    ghostscript
    gsfonts
    gutenprint
    gtk3-print-backends
    libcups
    system-config-printer
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

# Enable and start the cups service.
echo "${purple}Enabling org.cups.cupsd.service.${reset}"
sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service

echo "${green}All done!${reset}"
