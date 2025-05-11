#!/bin/bash

# Get the current window's WM_CLASS property
window_class=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $5}' | xargs -I{} xprop -id {} WM_CLASS | awk -F'"' '/WM_CLASS/ {print $2}')

# Map 'Navigator' to 'Firefox'
if [ "$window_class" = "Navigator" ]; then
    echo "Firefox"
else
    echo "$window_class"
fi
