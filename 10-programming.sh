#!/usr/bin/sh

# This script will install a few programming languages and tools.
# Yay is needed since some of the packages are only available in the AUR.

languages=(
    python  # High-level scripting language
    go      # Core compiler tools for the Go programming language
    lua     # Powerful lightweight language designed for extending applications
    perl    # A highly capable, feature-rich programming language
    rust    # Systems programming language focused on safety, speed and concurrency
    ruby    # An object-oriented language for quick and easy programming
    nodejs  # Evented I/O for V8 javascript
)

tools=(
    visual-studio-code-bin  # Editor for building and debugging modern applications
    micro-bin               # A modern and intuitive terminal-based text editor
    neovim                  # Fork of Vim aiming to improve user experience
    mono                    # Free implementation of the .NET platform
    geany                   # Fast and lightweight IDE
)

# Join packages into a single line.
# Example: package1 package2 package3..
languages_string=$(printf " %s" "${languages[@]}")
tools_string=$(printf " %s" "${tools[@]}")

# Download packages.
yay -S --needed --noconfirm $languages_string
yay -S --needed --noconfirm $tools_string

echo "Done!"
