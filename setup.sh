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
cp /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak
rm -f /etc/dhcp/dhcpd.conf
cp ./conf/dhcpd.conf /etc/dhcp/dhcpd.conf
