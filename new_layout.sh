#!/bin/bash

current_layout=$(setxkbmap -query | grep 'layout:' | awk '{print $2}')
current_variant=$(setxkbmap -query | grep 'variant:' | awk '{print $2}')

if [[ "$current_layout" == "us" && "$current_variant" == "dvorak" ]]; then
    setxkbmap -layout us
elif [[ "$current_layout" == "us" ]]; then
    setxkbmap -layout us -variant dvorak
elif [[ "$current_layout" == "fr" && "$current_variant" == "bepo" ]]; then
    setxkbmap -layout us
elif [[ "$current_layout" == "fr" ]]; then
    setxkbmap -layout fr -variant bepo
    ./remap_bepo.sh
elif [[ "$current_layout" == "bepo" ]]; then
    setxkbmap -layout fr -variant bepo
    ./remap_bepo.sh
else
    setxkbmap -layout us -variant dvorak
fi
