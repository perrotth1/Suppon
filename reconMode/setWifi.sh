#!/bin/bash 

#Henry Perrottet
#Script to change network

LINE="$(head /etc/wpa_supplicant/wpa_supplicant.conf | grep -m 1 ssid)"
SSID="	ssid=\"$1\""
sudo sed -i "s/$LINE/$SSID/" /etc/wpa_supplicant/wpa_supplicant.conf

LINE="$(head /etc/wpa_supplicant/wpa_supplicant.conf | grep -m 1 psk)"
PASS="	psk=\"$2\""
sudo sed -i "s/$LINE/$PASS/" /etc/wpa_supplicant/wpa_supplicant.conf
echo "[*] WPA2 network set to $1"
echo "[*] Restart to put changes into effect"

