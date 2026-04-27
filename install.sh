#!/bin/bash

# A simple script to symlink the dotfiles to your home directory

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles..."

# Create .config if it doesn't exist
mkdir -p "$HOME/.config"

# Link .config directories
CONFIG_DIRS="hypr waybar rofi kitty gtk-3.0 gtk-4.0 snappy-switcher Thunar"

for dir in $CONFIG_DIRS; do
    if [ -d "$DOTFILES_DIR/.config/$dir" ]; then
        echo "Symlinking .config/$dir..."
        # Backup existing config if it exists and is not a symlink
        if [ -e "$HOME/.config/$dir" ] && [ ! -L "$HOME/.config/$dir" ]; then
            echo "Backing up existing $HOME/.config/$dir to $HOME/.config/${dir}.backup"
            mv "$HOME/.config/$dir" "$HOME/.config/${dir}.backup"
        fi
        ln -sfn "$DOTFILES_DIR/.config/$dir" "$HOME/.config/$dir"
    fi
done

# Link bash config files
for file in .bashrc .bash_profile; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
        echo "Symlinking $file..."
        if [ -e "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
            echo "Backing up existing $HOME/$file to $HOME/${file}.backup"
            mv "$HOME/$file" "$HOME/${file}.backup"
        fi
        ln -sfn "$DOTFILES_DIR/$file" "$HOME/$file"
    fi
done

# Link Wallpapers
if [ -d "$DOTFILES_DIR/Wallpapers" ]; then
    echo "Symlinking Wallpapers..."
    if [ -e "$HOME/Wallpapers" ] && [ ! -L "$HOME/Wallpapers" ]; then
        echo "Backing up existing $HOME/Wallpapers to $HOME/Wallpapers.backup"
        mv "$HOME/Wallpapers" "$HOME/Wallpapers.backup"
    fi
    ln -sfn "$DOTFILES_DIR/Wallpapers" "$HOME/Wallpapers"
fi

echo "Dotfiles setup complete!"
