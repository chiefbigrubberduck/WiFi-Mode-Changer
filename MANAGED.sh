#!/bin/bash

# --- AUTO-DETECTION BLOCK START ---
INTERFACE=$(iw dev 2>/dev/null | awk '$1=="Interface"{print $2}' | head -n1)
INTERFACEMON="${INTERFACE}mon"
if [ -z "$INTERFACE" ]; then echo "Error: No wireless interface found."; exit 1; fi
# --- AUTO-DETECTION BLOCK END ---

sudo ifconfig $INTERFACEMON down
sudo airmon-ng stop $INTERFACEMON
sudo iwconfig $INTERFACE mode managed
sudo ifconfig $INTERFACE up
sudo systemctl start NetworkManager

echo "                                               "
echo "Done, you can close the window!"
echo "Check the Github page for updates!"
