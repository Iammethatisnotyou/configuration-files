#!/bin/bash

# Use xfconf-query to trigger the XFCE "Show Desktop" action
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/primary -s "show-desktop"
