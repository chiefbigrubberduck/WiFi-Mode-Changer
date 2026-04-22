#!/bin/bash

INTERFACE="your wifi adapter"
INTERFACEMON="your wifi adapter plus mon"

sudo ifconfig $INTERFACEMON down
sudo airmon-ng stop $INTERFACEMON
sudo iwconfig $INTERFACE mode managed
sudo ifconfig $INTERFACE up
sudo systemctl start NetworkManager

echo "                                               "

echo "Done, you can close the window!"
echo "Check the Github page for updates!"
