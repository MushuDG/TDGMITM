#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python
sudo apt-get install python3
wget https://bootstrap.pypa.io/get-pip.py
sudo python2 get-pip.py
sudo python3 get-pip.py
sudo pip install scapy
sudo apt -y install hostapd dnsmasq
sudo apt install isc-dhcp-server -y
