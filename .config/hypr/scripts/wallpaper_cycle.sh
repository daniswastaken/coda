#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Wallpapers"

# Check if awww-daemon is running, start if not
if ! pgrep -x "awww-daemon" > /dev/null; then
    awww-daemon &
    # Wait for the daemon to start
    sleep 1
fi

# Cycle through wallpapers every X seconds
# You can change the interval below
INTERVAL=30

while true; do
    # Loop through all files in the wallpaper directory
    for WALLPAPER in "$WALLPAPER_DIR"/*; do
        if [ -f "$WALLPAPER" ]; then
            # Transition effect can be simple, wipe, grow, outer, random, etc.
            awww img "$WALLPAPER" --transition-type fade --transition-duration 3
            sleep $INTERVAL
        fi
    done
done
