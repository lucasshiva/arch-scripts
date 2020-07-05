#!/usr/bin/sh

# Extra programs that I may want to use.

packages=(
    qbittorrent             # An advanced BitTorrent client
    plank                   # A simple, yet elegant plank
    calibre                 # Fully-featured eBook management application 
    lxappearance            # Feature-rich GTK+ theme switcher of the LXDE Desktop
    gnome-system-monitor    # View current processes and monitor system state
    baobab                  # A graphical directory tree analyzer
    eog                     # An image viewing and cataloging program
    bookworm                # A simple user centric eBook reader
    midori                  # Lightweight web browser
    xed                     # A small and lightweight text editor
    nemo                    # Cinnamon file manager (Nautilus fork)
)

aur_packages=(
    # A note taking and to-do application with synchronization capabilities
    joplin

    # Note applications that works on top of a local folder of plain text Markdown files
    obsidian-appimage       
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "Done!"
