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
    rofi                      # Application launcher.
    preload                   # Tool to preload apps in memory.
    qbittorrent               # Torrent client.
    rhythmbox                 # Music player.
    reflector                 # Script to sort pacman mirrors.
    steam                     # Used to play games.
    stremio-beta              # Similar to popcorn time, but better.
    simplenote-electron-bin   # Note taking app.
    pcloud-drive              # Cloud storage.
    the_platinum_searcher-bin # A tool to search file contents.
    vlc                       # Video player.
    bitwarden-bin             # Password manager.
    zenity                    # Needed for Spotify to browser local files.
    ffmpeg-compat-57          # Needed for Spotify to play local files.
    spotify                   # Music streaming app.
    joplin                    # Another note taking app.
    plank                     # A simple, yet elegant plank.
    pulseeffects              # Audio mixer for PulseAudio.
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

echo "${green}All done!${reset}"
