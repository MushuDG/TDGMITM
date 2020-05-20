#!/bin/bash

rm -f /etc/hostapd/hostapd.conf

echo "interface=wlan1" >> /etc/hostapd/hostapd.conf

echo "ssid=CopyOf_$1" >> /etc/hostapd/hostapd.conf

# mode Wi-Fi (a = IEEE 802.11a, b = IEEE 802.11b, g = IEEE 802.11g)
echo "hw_mode=g" >> /etc/hostapd/hostapd.conf

# canal de fréquence Wi-Fi (1-14)
echo "channel=6" >> /etc/hostapd/hostapd.conf

echo "wmm_enabled=0" >> /etc/hostapd/hostapd.conf

echo "macaddr_acl=0" >> /etc/hostapd/hostapd.conf

echo "auth_algs=1" >> /etc/hostapd/hostapd.conf
echo "ignore_broadcast_ssid=0" >> /etc/hostapd/hostapd.conf
echo "wpa=2" >> /etc/hostapd/hostapd.conf
echo "wpa_passphrase=1234567890" >> /etc/hostapd/hostapd.conf
echo "wpa_key_mgmt=WPA-PSK" >> /etc/hostapd/hostapd.conf
echo "wpa_pairwise=TKIP" >> /etc/hostapd/hostapd.conf
echo "rsn_pairwise=CCMP" >> /etc/hostapd/hostapd.conf


rm -f /etc/dnsmasq.conf

#RPiHotspot config - Internet
echo "interface=wlan1" >> /etc/dnsmasq.conf
echo "bind-dynamic" >> /etc/dnsmasq.conf
echo "domain-needed" >> /etc/dnsmasq.conf
echo "bogus-priv" >> /etc/dnsmasq.conf
echo "dhcp-range=192.168.50.150,192.168.50.200,255.255.255.0,12h" >> /etc/dnsmasq.conf

#######################################################################################################################
sudo modprobe ipt_MASQUERADE
sudo iptables -A POSTROUTING -t nat -o wlan0 -j MASQUERADE
sudo iptables -A FORWARD --match state --state RELATED,ESTABLISHED --jump ACCEPT
sudo iptables -A FORWARD -i wlan1 --destination 192.168.50.0/24 --match state --state NEW --jump ACCEPT
sudo iptables -A INPUT -s 192.168.50.0/24 --jump ACCEPT

rm -f /etc/default/ufw

echo "IPV6=yes">>/etc/default/ufw
echo "DEFAULT_INPUT_POLICY=\"DROP\"" >> /etc/default/ufw
echo "DEFAULT_OUTPUT_POLICY=\"ACCEPT\"" >> /etc/default/ufw
echo "DEFAULT_FORWARD_POLICY=\"ACCEPT\"" >> /etc/default/ufw
echo "DEFAULT_APPLICATION_POLICY=\"SKIP\"" >> /etc/default/ufw
echo "MANAGE_BUILTINS=no" >> /etc/default/ufw
echo "IPT_SYSCTL=/etc/ufw/sysctl.conf" >> /etc/default/ufw
echo "IPT_MODULES=\"\"" >> /etc/default/ufw

rm -f /etc/ufw/sysctl.conf
echo "
net/ipv4/ip_forward=1
net/ipv4/conf/all/accept_redirects=0
net/ipv4/conf/default/accept_redirects=0
net/ipv6/conf/all/accept_redirects=0
net/ipv6/conf/default/accept_redirects=0
net/ipv4/conf/all/log_martians=0
net/ipv4/conf/default/log_martians=0
" >> /etc/ufw/sysctl.conf

cp /etc/ufw/before.rules /etc/ufw/before.rules.bak
rm -f /etc/ufw/before.rules
cp ./conf/before.rules /etc/ufw/before.rules
sudo ufw allow from 192.168.50.0/24
#######################################################################################################################

ifconfig wlan1 192.168.50.1
service isc-dhcp-server start

hostapd /etc/hostapd/hostapd.conf
