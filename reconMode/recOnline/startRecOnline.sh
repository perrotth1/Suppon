#!/bin/bash

cd /home/henry/Suppon/reconMode/recOnline/

IP=$(ip route | grep wlan0 | grep src | awk -F' ' '{print $9}')

FLASK_APP=recOnline.py flask run --host=$IP


