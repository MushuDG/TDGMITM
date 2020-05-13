#!/bin/bash

rm -f /etc/hostapd/hostapd.conf

echo "interface=wlan1 " >> /etc/hostapd/hostapd.conf

echo "driver=nl80211 " >> /etc/hostapd/hostapd.conf

echo "ssid=$1" >> /etc/hostapd/hostapd.conf

# mode Wi-Fi (a = IEEE 802.11a, b = IEEE 802.11b, g = IEEE 802.11g)
echo "hw_mode=g " >> /etc/hostapd/hostapd.conf

# canal de fréquence Wi-Fi (1-14)
echo "channel=6 " >> /etc/hostapd/hostapd.conf

# Wi-Fi ouvert, pas d'authentification !
echo "auth_algs=0 " >> /etc/hostapd/hostapd.conf

# Beacon interval in kus (1.024 ms)
echo "beacon_int=100 " >> /etc/hostapd/hostapd.conf

# DTIM (delivery trafic information message)
echo "dtim_period=2 " >> /etc/hostapd/hostapd.conf

# Maximum number of stations allowed in station table
echo "max_num_sta=255 " >> /etc/hostapd/hostapd.conf

# RTS/CTS threshold; 2347 = disabled (default)
echo "rts_threshold=2347 " >> /etc/hostapd/hostapd.conf

# Fragmentation threshold; 2346 = disabled (default)
echo "fragm_threshold=2346 " >> /etc/hostapd/hostapd.conf
