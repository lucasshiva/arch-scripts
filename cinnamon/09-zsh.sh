#!/usr/bin/bash

# Change default shell to ZSH
# Download it if zsh is not installed.

# Colors
green=$(tput setaf 2)
yellow=$(tput setaf 3)
purple=$(tput setaf 5)
reset=$(tput sgr0)

if ! pacman -Qi zsh >/dev/null; then
    echo "${yellow}Installing zsh..${reset}"
    sudo pacman -S --needed --noconfirm zsh
fi

if ! echo $0 | grep zsh >/dev/null; then
    echo "${purple}Changing default shell..${reset}"
    chsh -s $(which zsh)
else
    echo "${green}Zsh is already the default shell!${reset}"
fi

echo "${green}All done!${reset}"
