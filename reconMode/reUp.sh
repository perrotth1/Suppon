#!/bin/bash

cd /home/henry/Suppon/reconMode/

cat state2.txt > /etc/rc.local

sleep .5

./setWEP.sh "$1" "$2"

sleep .5

sudo reboot -n

