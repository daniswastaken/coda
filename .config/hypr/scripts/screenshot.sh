#!/bin/bash
# Create the directory if it doesn't exist
mkdir -p "$HOME/Gallery/Screenshots"
FILENAME="$HOME/Gallery/Screenshots/Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

if [ "$1" == "full" ]; then
    ACTIVE_MONITOR=$(hyprctl activeworkspace | grep -o 'on monitor [^:]*' | awk '{print $3}')
    grim -o "$ACTIVE_MONITOR" - | tee "$FILENAME" | wl-copy
    notify-send -t 3000 "Screenshot Saved" "Active monitor ($ACTIVE_MONITOR) saved to Gallery/Screenshots"
elif [ "$1" == "area" ]; then
    grim -g "$(slurp)" - | tee "$FILENAME" | wl-copy
    notify-send -t 3000 "Screenshot Saved" "Selected area saved to Gallery/Screenshots"
elif [ "$1" == "window" ]; then
    # Get the active window's geometry and format it for grim (X,Y WxH)
    AT=$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ')
    SIZE=$(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | sed 's/,/x/')
    GEOM="${AT} ${SIZE}"
    
    if [ -n "$GEOM" ]; then
        grim -g "$GEOM" - | tee "$FILENAME" | wl-copy
        notify-send -t 3000 "Screenshot Saved" "Active window saved to Gallery/Screenshots"
    else
        notify-send -t 3000 "Screenshot Failed" "Could not detect active window"
    fi
fi

# Clean up screenshots older than 3 days
find "$HOME/Gallery/Screenshots" -name "Screenshot_*.png" -type f -mtime +3 -delete
