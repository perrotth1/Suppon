#!/bin/bash 

#Henry Perrottet
#Script to backup wpa_supplicant, make new temporary one to connect to WEP

cd /home/henry/Suppon/reconMode/

sudo mv /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.backup

LINE="$(head wpa_supplicant.conf | grep -m 1 ssid)"
SSID="	ssid=\"$1\""
sudo sed -i "s/$LINE/$SSID/" wpa_supplicant.conf

LINE="$(head wpa_supplicant.conf | grep -m 1 wep_key0)"
PASS="	wep_key0=\"$2\""
sudo sed -i "s/$LINE/$PASS/" wpa_supplicant.conf

sudo cp wpa_supplicant.conf /etc/wpa_supplicant/

echo "[*] WEP network set to $1"
echo "[*] Restart to put changes into effect"

