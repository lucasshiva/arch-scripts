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
        yay -S --noconfirm --needed $1
    fi
}

packages=(
    file-roller           # Create and modify archives
    zip                   # Compressor/archiver for creating and modifying zipfiles
    unzip                 # For extracting and viewing files in .zip archives
    unrar                 # better RAR archive support
    unace                 # ACE archive support
    lrzip                 # lrzip archive support
    p7zip                 # Command-line file archiver with high compression ratio
    gnome-keyring         # Stores passwords and encryption keys
    ntfs-3g               # NTFS filesystem driver and utilities
    bat                   # Cat clone with syntax highlighting and git integration
    grub-customizer       # A graphical grub2 settings manager
    htop                  # Interactive process viewer
    pamac-zsh-completions # ZSH completions for pamac
    tree                  # A directory listing program
    fzf                   # A command line fuzzy finder.
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

echo "${green}All done!${reset}"
