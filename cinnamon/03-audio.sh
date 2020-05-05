#!/usr/bin/bash

# Packages needed for audio to work properly in Arch Linux.

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
    pulseaudio
    pulseaudio-alsa
    pavucontrol
    alsa-firmware
    alsa-lib
    alsa-plugins
    alsa-utils
    gstreamer
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-base
    gst-plugins-ugly
    playerctl
    volumeicon
)

# Install packages.
for package in ${packages[@]}; do
    install_package $package
done

echo "${green}All done!${reset}"
