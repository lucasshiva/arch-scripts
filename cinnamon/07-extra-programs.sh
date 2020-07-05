#!/bin/bash

# Includes several programs that are not essencial, but are still useful.
# Comment the ones you don't want/need.
# Yay is only needed for the AUR packages.

packages=(
    rofi                # A window switcher and application launcher
    preload             # Tool to preload apps in memory
    qbittorrent         # An advanced BitTorrent client
    reflector           # Retrieve and filter the latest Pacman mirror list
    zenity              # Needed for Spotify to browse local files
    plank               # A simple, yet elegant plank
    calibre             # Fully-featured eBook management application  
)

# Most of these take a LONG time to build. 
# Most will ask for your password at the end, don't run this part and go afk.
aur_packages=(
    stremio-beta              # Watch videos, movies, TV series and TV channels
    simplenote-electron-bin   # The simplest way to keep notes
    pcloud-drive              # Cloud storage
    bitwarden-bin             # A secure and free password manager.
    ffmpeg-compat-57          # Needed for Spotify to play local files
    spotify                   # A proprietary music streaming service
    joplin                    # A note taking and to-do application with sync
)

# Join packages into a single line.
# Example: package1 package2 package3..
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages. Comment the second line to exclude AUR packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "All done!"
