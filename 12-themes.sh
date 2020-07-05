#!/usr/bin/sh

# Includes a few themes that don't come with Cinnamon.
# Yay is only needed for AUR packages.

packages=(
    papirus-icon-theme
    arc-gtk-theme
)

aur_packages=(
    numix-cursor-theme
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "Done!"
