#!/bin/bash

# --- LIST AVAILABLE WIRELESS INTERFACES ---
echo "Scanning for wireless interfaces..."
INTERFACES=($(ls /sys/class/net/ | while read iface; do
    if [ -d "/sys/class/net/$iface/device/ieee80211" ]; then
        echo "$iface"
    fi
done))

if [ ${#INTERFACES[@]} -eq 0 ]; then
    echo "Error: No wireless interfaces found."
    exit 1
fi

echo "Found the following wireless cards:"
for i in "${!INTERFACES[@]}"; do
    echo "[$((i+1))] ${INTERFACES[$i]}"
done

# --- USER SELECTION ---
while true; do
    read -p "Select a card by number 1-${#INTERFACES[@]}: " choice
    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#INTERFACES[@]} ]; then
        SELECTED=${INTERFACES[$((choice-1))]}
        break
    else
        echo "Invalid selection. Try again."
    fi
done

# --- CORRECTLY HANDLE MON SUFFIX ---
# If selected ends with "mon", it's already in monitor mode
# Base interface is the name without "mon"
if [[ "$SELECTED" == *"mon" ]]; then
    INTERFACEMON="$SELECTED"           # e.g., wlp4s0mon
    INTERFACE="${SELECTED%mon}"        # e.g., wlp4s0 (strip trailing "mon")
else
    INTERFACE="$SELECTED"              # e.g., wlp4s0
    INTERFACEMON="${SELECTED}mon"      # e.g., wlp4s0mon
fi

echo "Base interface: $INTERFACE"
echo "Monitor interface: $INTERFACEMON"
echo "Setting $INTERFACEMON into Managed mode"
echo "----------------------------------------"

# Actual commands, everything above defined the INTERFACES
sudo ifconfig $INTERFACEMON down
sudo airmon-ng stop $INTERFACEMON
sudo iwconfig $INTERFACE mode managed
sudo ifconfig $INTERFACE up
sudo systemctl start NetworkManager

echo "                                               "
echo "Done, you can close the window!"
echo "Check the Github page for updates!"
