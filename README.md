# Danis's Arch Linux Dotfiles

These are the dotfiles for my Arch Linux setup featuring Hyprland, Waybar, and Rofi, styled with a One Dark theme.

## Features

- **Window Manager**: [Hyprland](https://hyprland.org/) with custom animations and dwindle layout.
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar) styled to match the system theme with an integrated Arch logo application menu.
- **Application Launcher & Power Menu**: [Rofi](https://github.com/davatorium/rofi) configured with custom themes (`launcher_t2`, `powermenu_t2`).
- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Theme**: Adwaita Dark (GTK) / One Dark (Colors)
- **Window Switcher**: `snappy-switcher`
- **File Manager**: Thunar

## Installation

You can clone this repository and use the provided `install.sh` script to automatically symlink the configurations to your home directory.

```bash
git clone https://github.com/daniswastaken/coda.git ~/coda
cd ~/coda
./install.sh
```

### Dependencies

Make sure to install the required packages:

```bash
# Core
sudo pacman -S hyprland waybar rofi kitty thunar
# Theme and icons
sudo pacman -S adwaita-icon-theme
# Additional utilities
sudo pacman -S grim slurp wl-clipboard jq wlogout
```

## Structure

- `.config/hypr/` - Hyprland configurations and custom scripts (wallpaper cycler, screenshot tool).
- `.config/waybar/` - Waybar layout and One Dark styling.
- `.config/rofi/` - Rofi themes, colors, and scripts.
- `.config/kitty/` - Kitty terminal settings.
- `.config/gtk-3.0/` & `.config/gtk-4.0/` - GTK theming settings.
- `.bashrc` & `.bash_profile` - Shell environment.
