#!/bin/sh

# Get battery capacity and status
CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

# Determine if charging or discharging
if [ "$STATUS" = "Charging" ]; then
    echo "Charging $CAPACITY%"
else
    echo "Discharging $CAPACITY%"
fi
