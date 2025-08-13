#!/bin/sh

WALLPAPER_DIR="$HOME/Pictures/Backgrounds"
WALLPAPER_FILE="$HOME/programs/scripts/current_background.txt"

# Select a wallpaper using dmenu
SELECTED=$(ls "$WALLPAPER_DIR" | dmenu -p "Select Wallpaper:")

# Set the wallpaper if one was picked
if [ -n "$SELECTED" ]; then
    feh --bg-scale "$WALLPAPER_DIR/$SELECTED"
    echo "$WALLPAPER_DIR/$SELECTED" > $WALLPAPER_FILE
else
    echo "No file selected."
fi
