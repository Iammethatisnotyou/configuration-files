#!/bin/bash

INTERFACE="wlan0"

while true; do
    # Read initial bytes
    RX_START=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    TX_START=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

    # Read end bytes (after 1 second)
    RX_END=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    TX_END=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

    # Calculate average speed over 1 second
    RX_RATE=$((($RX_END - $RX_START) / 1024))
    TX_RATE=$((($TX_END - $TX_START) / 1024))

    # Format output
    RX_RATE_FMT=$(printf "%d KB/s" $RX_RATE)
    TX_RATE_FMT=$(printf "%d KB/s" $TX_RATE)

    echo "⇩ ${RX_RATE_FMT} ⇧ ${TX_RATE_FMT}"

    sleep 1
done
