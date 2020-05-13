#!/usr/bin/bash

# Core programs needed for a basic cinnamon installation.
# A base cinnamon install comes without a lot of important software.
# For a minimal installation, you need:
# - A terminal emulator
# - A file manager (Comes with "Nemo" by default)
# - A web browser
# - An editor.
# It's always good to have a backup browser and terminal emulator.

packages=(
    firefox              # Standalone web browser from mozilla.org
    chromium             # Browser built for speed, simplicity, and security
    xfce4-screenshooter  # Great and simple screenshot tool
    gnome-system-monitor # View current processes and monitor system state
    gnome-terminal       # The GNOME Terminal Emulator
    kitty                # A modern, hackable, featureful, OpenGL-based terminal emulator
    xarchiver            # GTK+ frontend to various command line archivers
    xed                  # A small and lightweight text editor
    nano                 # CLI editor. Pico editor clone with enhancements
    eog                  # An image viewing and cataloging program
    celluloid            # Simple GTK+ frontend for mpv
    rhythmbox            # Music playback and management application
    evince               # Document viewer for files like PDF and Postscript
    bookworm             # Simple eBook reader
    evolution            # Manage your email, contacts and schedule
)

# Join packages into a single line.
# Example: package1 package2 package3..
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

echo "Done!"
