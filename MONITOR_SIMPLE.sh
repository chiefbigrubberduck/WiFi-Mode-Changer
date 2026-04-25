#!/bin/bash

INTERFACE="your wifi adapter name"
INTERFACEMON="your wifi adapter name plus the mon abbreviation"

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
