#!/bin/bash

#This script turns off recon mode and puts the device back into normal mode

sudo kill $(ps -aux | grep -m 1 hiddenCam.py | awk -F' ' '{print $2}')

sudo kill $(ps -aux | grep -m 1 startRecOnline | awk -F' ' '{print $2}')

sudo rm /etc/wpa_supplicant/wpa_supplicant.conf

sudo mv /etc/wpa_supplicant/wpa_supplicant.backup /etc/wpa_supplicant/wpa_supplicant.conf

cat state1.txt > /etc/rc.local

