#!/bin/bash

INTERFACE="wlan0"

# Read initial bytes
RX_START=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_START=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
RX_END=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_END=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# Calculate average speed over 3 seconds
RX_RATE=$((($RX_END - $RX_START) / 1024 / 3))
TX_RATE=$((($TX_END - $TX_START) / 1024 / 3))

RX_RATE_FMT=$(printf "%d KB/s" $RX_RATE)
TX_RATE_FMT=$(printf "%d KB/s" $TX_RATE)

echo "⇩ ${RX_RATE_FMT} ⇧ ${TX_RATE_FMT}"
