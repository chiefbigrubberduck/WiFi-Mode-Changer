#!/bin/bash

INTERFACE="your wifi adapter name"
INTERFACEMON="your wifi adapter name plus the mon abbreviation"

sudo ifconfig $INTERFACEMON down
sudo airmon-ng stop $INTERFACEMON
sudo iwconfig $INTERFACE mode managed
sudo ifconfig $INTERFACE up
sudo systemctl start NetworkManager
sudo ifconfig $INTERFACE down

echo "                                               "

echo "Done, you can close the window!"
echo "Check the Github page for updates!"
