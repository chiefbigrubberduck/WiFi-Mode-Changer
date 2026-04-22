#!/bin/bash

# --- AUTO-DETECTION BLOCK START ---
INTERFACE=$(iw dev 2>/dev/null | awk '$1=="Interface"{print $2}' | head -n1)
INTERFACEMON="${INTERFACE}mon"
if [ -z "$INTERFACE" ]; then echo "Error: No wireless interface found."; exit 1; fi
# --- AUTO-DETECTION BLOCK END ---

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
