#!/bin/bash

# Start in the root wallpaper directory
WALLPAPER_ROOT_DIR=~/Pictures/Backgrounds
CURRENT_DIR="$WALLPAPER_ROOT_DIR"

while true; do
    # List directories and files in the current directory
    SELECTION=$(ls -A "$CURRENT_DIR" | rofi -dmenu -p "Select Wallpaper or Folder:")

    if [ -z "$SELECTION" ]; then
        echo "No selection made. Exiting."
        exit 0
    fi

    # Build the full path of the selection
    FULL_PATH="$CURRENT_DIR/$SELECTION"

    if [ -d "$FULL_PATH" ]; then
        # Navigate into the selected directory
        CURRENT_DIR="$FULL_PATH"
    elif [ -f "$FULL_PATH" ]; then
        # Apply the selected file as the wallpaper
        for SCREEN in $(xfconf-query -c xfce4-desktop -l | grep 'image-path' | awk -F/ '{print $4"/"$5}'); do
            xfconf-query -c xfce4-desktop -p "/backdrop/$SCREEN/image-path" -s "$FULL_PATH" -T
            xfconf-query -c xfce4-desktop -p "/backdrop/$SCREEN/image-style" -s 1 -T  # 1 for 'Fill'
        done
        echo "Wallpaper set to $FULL_PATH"
        exit 0
    else
        echo "Invalid selection. Please try again."
    fi
done
