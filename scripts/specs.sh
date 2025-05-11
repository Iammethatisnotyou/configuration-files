#!/bin/bash
echo '==Uptime=='
uptime | awk -F'up |:' '{print $2 ":" $3}' | sed 's/,//'
echo '==Space=='
free -h
echo "==Core's=="
sensors | rg "Core"
