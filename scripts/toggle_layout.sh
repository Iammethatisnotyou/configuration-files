#!/bin/bash

# Get the current layout and variant directly from setxkbmap query
current_layout=$(setxkbmap -query | grep 'layout:' | awk '{print $2}')
current_variant=$(setxkbmap -query | grep 'variant:' | awk '{print $2}')

# Now, handle the layout switching based on conditions
if [[ "$current_layout" == "us" && "$current_variant" == "dvorak" ]]; then
    setxkbmap -layout us -option caps:escape

elif [[ "$current_layout" == "us" ]]; then
    setxkbmap -layout fr -variant bepo -option caps:escape

elif [[ "$current_layout" == "fr" && "$current_variant" == "bepo" ]]; then
    setxkbmap -layout ru -variant phonetic -option caps:escape

#elif [[ "$current_layout" == "bepo" ]]; then
#    setxkbmap -layout us,ru -variant ,phonetic -option caps:escape

else
    # Default to US Dvorak layout
    setxkbmap -layout us -variant dvorak -option caps:escape
fi
