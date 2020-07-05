#!/usr/bin/sh

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
    acpilight           # a backward-compatible xbacklight replacement based on ACPI
    betterlockscreen    # A simple lock script for i3lock-color
    cronie              # Daemon that runs specified programs at scheduled times
    diff-so-fancy       # Good-looking diffs with diff-highlight and more
    dunst               # Customizable and lightweight notification-daemon
    which               # A utility to show the full path of commands
    reflector           # Retrieve and filter the latest Pacman mirror list
    zenity              # Display graphical dialog boxes from shell scripts
    numlockx            # Turns on the numlock key in X11.
    pacman-contrib      # Contributed scripts and tools for pacman systems
    xsettingsd          # Provides settings to X11 applications

    # Applet for managing network connections
    network-manager-applet

    # Allow applications to extend a menu via Ayatana indicators in Unity, KDE
    # or Systray (GTK+ 3 library)
    libappindicator-gtk3
)

aur_packages=(
    networkmanager-dmenu-git    # Control NetworkManager via dmenu
    pamac-zsh-completions       # ZSH completions for pamac

    # Makes Spotify more friendly to window managers by settings a class name
    # before opening the window.
    spotifywm-git
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "Done!"
