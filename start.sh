#!/bin/bash
clear
echo "Starting ./scripts/getssid.py script..."
ifconfig
echo "Start wlan1 in monitor mode"
ifconfig wlan1 down
iwconfig wlan1 mode monitor
ifconfig wlan1 up
clear
./scripts/getssid.py
