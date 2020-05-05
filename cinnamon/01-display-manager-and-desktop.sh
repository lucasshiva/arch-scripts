#!/usr/bin/bash

# Provides a base install of cinnamon.

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
    lightdm
    lightdm-gtk-greeter
    lightdm-gtk-greeter-settings
    cinnamon
    cinnamon-translations
)

for package in ${packages[@]}; do
    install_package $package
done

if ! systemctl status lightdm.service | grep enabled &>/dev/null; then
    echo "${purple}Enabling display manager..${reset}"
    sudo systemctl enable lightdm.service
else
    echo "${green}Display manager is already enabled!${reset}"
fi

echo "${green}Done! Please reboot your system.${reset}"
