#!/bin/bash

setxkbmap -layout fr -variant bepo

# Now remap keys using xmodmap
#xmodmap -e "keycode 36 = Ccedilla"      # Map the 'm' key to 'ç' (cedilla)
#xmodmap -e "keycode 27 = ccedilla"
#xmodmap -e "keycode 36 = cedilla"
#xmodmap -e "keycode 36 = ç"

#xmodmap -e "keycode 51 = NoSymbol"      # Disable the '\' key (map it to nothing)


