#!/bin/bash

# Includes a few themes that don't come with Cinnamon.
# Yay is only needed for AUR packages.

packages=(
    papirus-icon-theme
    arc-gtk-theme
)

aur_packages=(
    numix-cursor-theme
)

# Join packages into a single line.
# Example: package1 package2 package3..
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages. Comment the second line to exclude AUR packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "Done!"
