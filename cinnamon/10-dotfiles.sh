#!/usr/bin/bash

# Copy my dotfiles.

# Colors
green=$(tput setaf 2)
yellow=$(tput setaf 3)
purple=$(tput setaf 5)
reset=$(tput sgr0)

# Your dotfiles repo
repo="https://github.com/lucasshiva/dotfiles.git"
dest="/tmp/dotfiles"

# Check if the destination folder exists.
# Delete the folder if true.
if [ -e $dest ]; then
    rm -rf $dest
fi

# Clone the repository.
echo "${yellow}Cloning the repository..${reset}"
git clone $repo $dest

echo "${yellow}Moving files..${reset}"
# Move files/folders to $HOME - Ignores README.md files.
for entry in $(ls -A /tmp/dotfiles/home/); do
    [ ${entry##*/} == "README.md" ] && continue
    mv "/tmp/dotfiles/home/${entry}" $HOME
done

# Move files/folders to $HOME/.config
for entry in $(ls -A /tmp/dotfiles/config/); do
    [ ${entry##*/} == "README.md" ] && continue
    mv "/tmp/dotfiles/config/${entry}" $HOME/.config
done

echo "${green}All done!${reset}"
