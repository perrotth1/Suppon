#!/bin/bash

sleep 15		#Wait for startup processes to finish

cd /home/henry/Suppon/reconMode/

gatewayIP="$(ip route | grep default | awk -F' ' '{print $3}')"
rangeIP=$gatewayIP"/24"

echo $rangeIP

./firstScan.sh $rangeIP 	#Activate nmap scan

sleep 1

#Activate reverse SSH tunnel

#./rev_ssh.sh &

#Start recon web interface

./recOnline/startRecOnline.sh &

