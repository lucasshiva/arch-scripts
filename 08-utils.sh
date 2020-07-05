#!/usr/bin/bash

# This script will install several utility packages.


packages=(
    base-devel          # Includes tools needed for building (compiling and linking).
    file-roller         # Create and modify archives
    zip                 # Compressor/archiver for creating and modifying zipfiles
    unzip               # For extracting and viewing files in .zip archives
    unrar               # better RAR archive support
    unace               # ACE archive support
    lrzip               # lrzip archive support
    p7zip               # Command-line file archiver with high compression ratio
    gnome-keyring       # Stores passwords and encryption keys
    ntfs-3g             # NTFS filesystem driver and utilities
    bat                 # Cat clone with syntax highlighting and git integration
    grub-customizer     # A graphical grub2 settings manager
    htop                # Interactive process viewer
    tree                # A directory listing program
    fzf                 # A command line fuzzy finder.
    xclip               # Command line interface to the X11 clipboard
    ripgrep             # A search tool that combines ag with grep. (Use with rp)
)

# Join packages into a single line.
# Example: package1 package2 package3..
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

echo "Done!"
