#!/bin/sh

setxkbmap -layout us -variant dvorak
setxkbmap -option caps:escape

./programs/scripts/monitor.sh
background=$(cat "/home/LiamUSR/programs/scripts/current_background.txt")
feh --bg-scale "$background"

picom &
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
# dwmblocks &
xset r rate 200 50 &

# exec dwm
#exec ~/programs/c-cpp/window_manager/comp_wm

polybar &
sxwm

# sdwm
