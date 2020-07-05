#!/usr/bin/bash

# Change default shell to ZSH
# You will need to log out and log in for this changes to apply.

# Check if ZSH is installed.
if ! type -p zsh >/dev/null; then
    sudo pacman -S --noconfirm zsh
fi

# Change default shell to ZSH.
chsh -s $(which zsh)

echo "Done!"
