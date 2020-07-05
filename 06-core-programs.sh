#!/usr/bin/sh

# Programs that I need for a functional environment. 
# For a minimal installation, you need:
# - A terminal emulator
# - A file manager
# - A web browser
# - A text editor.
# It's always good to have a backup browser and a backup terminal emulator.

packages=(
    kitty               # A modern, hackable, featureful, OpenGL-based terminal emulator
    xterm               # X Terminal Emulator
    thunar              # Modern file manager for Xfce
    firefox             # Standalone web browser from mozilla.org
    chromium            # Browser built for speed, simplicity, and security
    vim                 # A highly configurable, improved version of the vi text editor
    gedit               # GNOME Text Editor
    xfce4-screenshooter # Great and simple screenshot tool
    scrot               # Simple command-line screenshot utility for X
    xarchiver           # GTK+ frontend to various command line archivers
    feh                 # Fast and light imlib2-based image viewer
    nitrogen            # Background browser and setter for X windows
    celluloid           # Simple GTK+ frontend for mpv
    rhythmbox           # Music playback and management application
    evince              # Document viewer for files like PDF and Postscript
    foalite             # A simple and modern GTK eBook reader
    evolution           # Manage your email, contacts and schedule
    dmenu               # Generic menu for X
    rofi                # A window switcher and application launcher
    picom               # X compositor that may fix tearing issues
    task                # A command-line todo list manager
    neofetch            # A CLI system information tool that supports displaying images.
)

# Some AUR packages may take a LONG time to build. Install them at your own risk. 
# Some will also ask for your password at the end, don't run this part and go afk.
aur_packages=(
    spotify                 # A proprietary music streaming service
    notable-bin             # The markdown-based note-taking app that doesnt suck
    polybar                 # A fast and easy-to-use status bar
    simplenote-electron-bin # The simplest way to keep notes
    pcloud-drive            # pCloud drive. Electron edition.
    bitwarden-bin           # A secure and free password manager.
    stremio-beta            # Watch videos, movies, TV series and TV channels
    ffmpeg-compat-57        # Compatibility package for ffmpeg.
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "Done!"
