#!/usr/bin/bash

# Font packages for Arch Linux.
# If you are dual booting with Windows and have mounted your Windows partition,
# insert the directory of your mounted partition below for WIndows Fonts.
# Leave it blank otherwise. 
# For more info: https://wiki.archlinux.org/index.php/Microsoft_fonts
windows_dir="/windows10"

packages=(
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ttf-dejavu
    ttf-fira-code
    ttf-fira-mono
    ttf-fira-sans
    ttf-font-awesome
    ttf-hack
    ttf-nerd-fonts-symbols
    ttf-opensans
    ttf-roboto
    ttf-ubuntu-font-family
    ttf-ibm-plex
    ttf-cascadia-pro
    adobe-source-code-pro-fonts
    cantarell-fonts
    gnu-free-fonts
    gsfonts
    xorg-fonts-misc
    terminus-font-otb
)

aur_packages=(
    ttf-unifont
    ttf-mononoki
    ttf-iosevka
    ttf-inconsolata-g
    siji-git
    profont-otb
)

# Join packages into a single line.
# Example: package1 package2 package3..
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages. Comment the second line to exclude AUR packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

# Check if directory exists
# This will not run if the directory is an empty string.
if [ $windows_dir ] && [ -d $windows_dir ]; then
    # Create fonts directory.
    sudo mkdir /usr/share/fonts/WindowsFonts

    # Copy all fonts from Windows partition to the fonts directory.
    cp ${windows_dir}/Windows/Fonts/* /usr/share/fonts/WindowsFonts/

    # Change fonts permission.
    sudo chmod 644 /usr/share/fonts/WindowsFonts/*
fi

# Regenerate the fontconfig cache
fc-cache -f

echo "Done!"
