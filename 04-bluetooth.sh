#!/usr/bin/sh

# Bluetooth packages for Arch Linux.
# For more information: https://wiki.archlinux.org/index.php/Bluetooth

packages=(
    pulseaudio-bluetooth    # Bluetooth support for PulseAudio
    bluez                   # Daemons for the bluetooth protocol stack
    bluez-libs              # Libraries for the bluetooth protocol stack
    bluez-utils             # Dev utilities for the bluetooth protocol stack
    blueberry               # Bluetooth configuration tool
    blueman                 # GTK+ Bluetooth Manager
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

# Enable services
sudo systemctl enable bluetooth.service

echo "Done!"
