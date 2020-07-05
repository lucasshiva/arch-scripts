#!/usr/bin/sh

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
    ttf-fira-code
    ttf-fira-sans
    ttf-font-awesome
    ttf-opensans
    adobe-source-code-pro-fonts
    cantarell-fonts
    gnu-free-fonts
    gsfonts
    xorg-fonts-misc
    otf-fantasque-sans-mono
)

# Some packages may take a long time to build.
# Remove some packages if you don't want/need all of them.
# Nerd fonts are patched versions of the original fonts. 
# For more info: https://www.nerdfonts.com/
aur_packages=(
    nerd-fonts-dejavu-complete
    nerd-fonts-cascadia-code
    nerd-fonts-jetbrains-mono
    nerd-fonts-fira-code
    nerd-fonts-go-mono
    nerd-fonts-hack
    nerd-fonts-inconsolata-go
    nerd-fonts-iosevka
    nerd-fonts-mononoki
    nerd-fonts-noto-sans-mono
    nerd-fonts-roboto-mono
    nerd-fonts-source-code-pro
    nerd-fonts-ubuntu-mono
    nerd-fonts-ibm-plex-mono
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages.
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
