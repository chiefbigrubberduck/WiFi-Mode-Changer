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

sudo ifconfig $INTERFACE down
sudo airmon-ng
sudo rfkill unblock 1
sudo airmon-ng check kill
sudo airmon-ng start $INTERFACE
sudo ifconfig $INTERFACEMON down
sudo iwconfig $INTERFACEMON mode monitor
sudo ifconfig $INTERFACEMON up

echo "                                                                        "

echo "Done, you can now close this window!"
echo "Check the Github page for updates!"
