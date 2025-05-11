#!/bin/sh

if pgrep -x rofi > /dev/null; then
    pkill rofi
else
    rofi -normal-window -show drun &
fi
