#!/usr/bin/bash

# This script will download a few themes that I use.

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
        yay -S --noconfirm --needed $1
    fi
}

packages=(
    papirus-icon-theme
    breeze-snow-cursor-theme
    arc-gtk-theme
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

echo "${green}All done!${reset}"
