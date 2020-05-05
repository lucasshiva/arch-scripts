#!/usr/bin/bash

# Core programs needed for a basic cinnamon installation.

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
    firefox              # Web Browser
    chromium             # Web Browser
    xfce4-screenshooter  # Screenshot tool
    gnome-system-monitor # System resource monitor
    gnome-terminal       # Terminal emulator
    kitty                # Terminal emulator
    xarchiver            # File archiver
    xed                  # Text editor.
    eog                  # Image viewer
    vlc                  # Video player
    rhythmbox            # Audio player
    xreader              # Document viewer
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

echo "${green}All done!${reset}"
