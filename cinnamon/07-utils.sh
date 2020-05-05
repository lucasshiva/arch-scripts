#!/usr/bin/bash

# This script will install several utilities.

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
    zip                   # File archiver
    unzip                 # File archiver
    unrar                 # File archiver
    p7zip                 # File archiver
    gnome-keyring         # Used to store passwords (like Wi-Fi)
    ntfs-3g               # Used to mount NTFS drives.
    bat                   # Cat, but with syntax highlighting.
    grub-customizer       # A GTK Gui to configure GRUB.
    htop                  # Terminal system monitor.
    pamac-zsh-completions # Pamac completions for ZSH
    tree                  # A command to see a directory's tree.
    fzf                   # A command line fuzzy finder.
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

echo "${green}All done!${reset}"
