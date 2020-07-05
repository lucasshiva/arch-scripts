#!/usr/bin/sh

# This script will install Yay and Git (if needed).
# Yay is an AUR (Arch User Repository) helper. 

install_yay() {
    if ! [ -e $HOME/yay ]; then
        mkdir $HOME/yay
    else
        rm -rf $HOME/yay
    fi

    git clone https://aur.archlinux.org/yay.git "$HOME/yay"
    cd $HOME/yay
    makepkg -si PKGBUILD
}

# Check if yay is installed.
if type -p yay >/dev/null; then
    echo "Yay is already installed!"
else
    sudo pacman -S --needed git
    install_yay
fi

echo "Done!"
