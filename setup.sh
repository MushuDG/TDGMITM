#!/bin/bash
#Update and upgrade system
sudo apt-get update
sudo apt-get upgrade
	
#Wget pip installer on bootstrap.pypa.io
wget https://bootstrap.pypa.io/get-pip.py
sudo python2 get-pip.py
sudo python3 get-pip.py

#Install scapy python framework
sudo pip install scapy

#Install :
#	- hostapd
#	- dnsmasq
#	- python
#	- python3
#	- isc-dhcp-server
#	- ufw
sudo apt -y install hostapd dnsmasq python python3 isc-dhcp-server ufw

#Create backup of original configuration files
cp /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak
rm -f /etc/dhcp/dhcpd.conf
cp /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.bak
rm -f /etc/default/isc-dhcp-server
cp /etc/sysctl.conf /etc/sysctl.conf.bak
cp /etc/network/interfaces /etc/network/interfaces.bak
cp /etc/default/ufw /etc/default/ufw.bak


#Copy dhcpd configuration file from conf folder to /etc/dhcp
cp ./conf/dhcpd.conf /etc/dhcp/dhcpd.conf

#Config. DHCP Server interface on wlan1
echo "INTERFACESv4=\"wlan1\"" >> /etc/default/isc-dhcp-server
