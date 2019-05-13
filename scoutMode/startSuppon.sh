#!/bin/bash

#For crontab to start SUPPON at startup

sleep 10

cd /home/henry/Suppon/scoutMode/
python switchStart.py &

sleep 2

