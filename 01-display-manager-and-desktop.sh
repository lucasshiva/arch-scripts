#!/usr/bin/sh

# Install LightDM and my Desktop Environments and/or Window Managers.

packages=(
    lightdm                 # A lightweight display manager.
    lightdm-gtk-greeter     # GTK+ greeter for LightDM.
    cinnamon                # DE with advanced features and a tradicional UX.
    cinnamon-translations   # Translations for Cinnamon and Nemo.
    xfce4                   # A lightweight and fast DE.
    xfce4-goodies           # Extra plugins/applications for XFCE.
    bspwm                   # Tiling window manager based on binary space partitioning.
    sxhkd                   # Simple X hotkey daemon.
    xdo                     # Utility for performing actions on windows in X.
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

# Enable services
sudo systemctl enable lightdm.service

echo "Done!"
