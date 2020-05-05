#!/usr/bin/bash

# Packages needed for bluetooth in Arch Linux.

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
    pulseaudio-bluetooth
    bluez
    bluez-libs
    bluez-utils
    blueberry
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

# Enable and start the bluetooth service.
echo "${purple}Enabling bluetooth.service${reset}"
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

echo "${green}All done!${reset}"
