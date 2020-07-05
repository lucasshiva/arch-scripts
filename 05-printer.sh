#!/usr/bin/bash

# Printing support for Arch Linux.
# For more information: https://wiki.archlinux.org/index.php/CUPS

packages=(
    cups                    # The CUPS Printing System - daemon package
    cups-pdf                # PDF printer for cups
    libcups                 # The CUPS Printing System - client libraries and headers
    system-config-printer   # A CUPS printer configuration tool and status applet
)

# Join packages into a single line.
# Example: package1 package2 package3..
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

# Enable and start the cups service.
sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service

echo "Done!"
