#!/bin/bash

# Get the current volume and mute status
status=$(pactl get-sink-mute @DEFAULT_SINK@)
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n 1)

if [[ $status == *"yes"* ]]; then
    echo "Mute"
else
    echo "Vol $volume"
fi
