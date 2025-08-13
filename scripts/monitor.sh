#!/bin/sh

# Desired resolution and refresh rate
DESIRED_RES="1920x1080"
DESIRED_RATE="120"

# Check for connected monitors
CONNECTED_MONITORS=$(xrandr --listmonitors | grep -v "Monitor" | awk '{print $4}')

# Loop through the connected monitors
for monitor in $CONNECTED_MONITORS; do
    # Get the name of the connected monitor
    MONITOR_NAME=$(echo $monitor | awk -F' ' '{print $1}')

    # Check if the monitor is not the laptop screen (eDP1)
    if [ "$MONITOR_NAME" != "eDP1" ]; then
        echo "External monitor $MONITOR_NAME detected."

        # Turn off the laptop screen
        xrandr --output eDP1 --off

        # Set the external monitor as primary with desired resolution and refresh rate
        xrandr --output $MONITOR_NAME --mode $DESIRED_RES --rate $DESIRED_RATE --primary

        echo "External monitor $MONITOR_NAME set as primary with resolution $DESIRED_RES at $DESIRED_RATE Hz."
        exit 0
    fi
done

echo "No external monitors detected. Laptop screen remains on."
