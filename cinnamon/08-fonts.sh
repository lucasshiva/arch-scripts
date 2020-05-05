#!/usr/bin/bash

# Font packages for Arch Linux.

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
    noto-fonts
    noto-fonts-cjk
    ttf-hack
    ttf-roboto
    ttf-opensans
    ttf-fira-sans
    ttf-ubuntu-font-family
    ttf-dejavu
    adobe-source-code-pro-fonts
    cantarell-fonts
    gnu-free-fonts
    ttf-ms-fonts
    nerd-fonts
    nerd-fonts-fira-code
    nerd-fonts-hack
    nerd-fonts-source-code-pro
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

echo "${green}All done!${reset}"
