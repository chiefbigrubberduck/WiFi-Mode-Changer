#!/bin/bash

# --- AGGRESSIVE AUTO-DETECTION ---
INTERFACE=$(ls /sys/class/net/ | while read iface; do
    if [ -d "/sys/class/net/$iface/device/ieee80211" ]; then
        echo "$iface"
        break
    fi
done)
INTERFACEMON="${INTERFACE}mon"

if [ -z "$INTERFACE" ]; then
    echo "Error: No wireless interface found."
    exit 1
fi

sudo ifconfig $INTERFACEMON down
sudo airmon-ng stop $INTERFACEMON
sudo iwconfig $INTERFACE mode managed
sudo ifconfig $INTERFACE up
sudo systemctl start NetworkManager

echo "                                               "
echo "Done, you can close the window!"
echo "Check the Github page for updates!"
