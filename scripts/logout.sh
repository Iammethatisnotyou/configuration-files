#!/bin/bash

# Define the options
options="Shutdown\nReboot\nCancel"

# Use dmenu to display the options
choice=$(echo -e "$options" | dmenu -i -p "Choose an action:")

# Handle the selected option
case "$choice" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Cancel)
        echo "Operation cancelled."
        ;;
    *)
        echo "Invalid option: $choice"
        ;;
esac
