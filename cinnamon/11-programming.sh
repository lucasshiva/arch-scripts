#!/usr/bin/bash

# This script will install a few programming languages and tools.

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

languages=(
    python
    go
    lua
    perl
    rust
)

tools=(
    visual-studio-code-bin
    micro-bin
    mono
)

echo "${yellow}Installing languages..${reset}"
for language in ${languages[@]}; do
    install_package $language
done

echo "${yellow}Installing tools..${reset}"
for tool in ${tools[@]}; do
    install_package $tool
done

echo "${green}All done!${reset}"
