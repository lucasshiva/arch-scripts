#!/usr/bin/bash

# Includes several programs that I use.

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
    rofi                      # A window switcher and application launcher
    preload                   # Tool to preload apps in memory.
    qbittorrent               # An advanced BitTorrent client
    reflector                 # Retrieve and filter the latest Pacman mirror list.
    stremio-beta              # Watch videos, movies, TV series and TV channels.
    simplenote-electron-bin   # The simplest way to keep notes.
    pcloud-drive              # Cloud storage.
    the_platinum_searcher-bin # A code search tool
    bitwarden-bin             # A secure and free password manager.
    zenity                    # Needed for Spotify to browser local files.
    ffmpeg-compat-57          # Needed for Spotify to play local files.
    spotify                   # Music streaming app.
    joplin                    # A note taking and to-do application with sync.
    plank                     # A simple, yet elegant plank.
    pulseeffects              # Audio Effects for Pulseaudio Applications
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

echo "${green}All done!${reset}"
