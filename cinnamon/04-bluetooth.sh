#!/usr/bin/bash

# Bluetooth packages for Arch Linux.
# For more information: https://wiki.archlinux.org/index.php/Bluetooth

packages=(
    pulseaudio-bluetooth    # Bluetooth support for PulseAudio
    bluez                   # Daemons for the bluetooth protocol stack
    bluez-libs              # Libraries for the bluetooth protocol stack
    bluez-utils             # Dev utilities for the bluetooth protocol stack
    blueberry               # Bluetooth configuration tool
)

# Join packages into a single line.
# Example: package1 package2 package3..
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

# Enable and start the bluetooth service.
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

echo "Done!"
