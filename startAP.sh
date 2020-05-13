#!/bin/bash

rm -f /etc/hostapd/hostapd.conf

echo "# interface wlan du Wi-Fi
interface=wlan1

# nl80211 avec tous les drivers Linux mac80211
driver=nl80211

# Nom du spot Wi-Fi
ssid=" > /etc/hostapd/hostapd.conf

echo $1 > /etc/hostapd/hostapd.conf

echo"

# mode Wi-Fi (a = IEEE 802.11a, b = IEEE 802.11b, g = IEEE 802.11g)
hw_mode=g

# canal de fréquence Wi-Fi (1-14)
channel=6

# Wi-Fi ouvert, pas d'authentification !
auth_algs=0

# Beacon interval in kus (1.024 ms)
beacon_int=100

# DTIM (delivery trafic information message)
dtim_period=2

# Maximum number of stations allowed in station table
max_num_sta=255

# RTS/CTS threshold; 2347 = disabled (default)
rts_threshold=2347

# Fragmentation threshold; 2346 = disabled (default)
fragm_threshold=2346"
" > /etc/hostapd/hostapd.conf
