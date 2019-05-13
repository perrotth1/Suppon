#!/bin/bash

#Within the network these key infos need to be scanned:
#List of connected devices
#Their IP addresses
#Their traceroutes
#Their open ports and services
#OS info

cd /home/henry/Suppon/reconMode/

sudo rm logFiles/*

sudo nmap -F -A -oX logFiles/nmap_output.xml $1

sleep 5

sudo ./nmapdb-master/nmapdb.py -c nmapdb-master/nmapdb.sql -d logFiles/nmap_output.db logFiles/nmap_output.xml
