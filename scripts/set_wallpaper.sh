#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR=~/Pictures/Backgrounds

# Use rofi to select an image file
SELECTED=$(ls "$WALLPAPER_DIR" | rofi -dmenu -p "Select Wallpaper:")

# Check if a file was selected
if [ -n "$SELECTED" ]; then
    # Apply the selected wallpaper to all screens
    for SCREEN in $(xfconf-query -c xfce4-desktop -l | grep 'image-path' | awk -F/ '{print $4"/"$5}'); do
        xfconf-query -c xfce4-desktop -p "/backdrop/$SCREEN/image-path" -s "$WALLPAPER_DIR/$SELECTED" -T
        xfconf-query -c xfce4-desktop -p "/backdrop/$SCREEN/image-style" -s 1 -T  # 1 for 'Fill'
    done
else
    echo "No file selected."
fi
