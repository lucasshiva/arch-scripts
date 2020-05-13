#!/usr/bin/bash

# Provides a base install of Cinnamon with LightDM.

# Packages to be downloaded.
packages=(
    lightdm
    lightdm-gtk-greeter
    cinnamon
    cinnamon-translations
)

# Join packages into a single line.
# Example: package1 package2 package3..
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

# Check if service is already active.
# Activate it if false.
if ! systemctl status lightdm.service >/dev/null; then
    sudo systemctl enable lightdm.service
fi                                                               

echo "Done!"
