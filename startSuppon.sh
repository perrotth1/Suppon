#!/bin/bash

#For crontab to start SUPPON at startup

cd /Suppon/

sleep 10

python switchStart.py &

sleep 2

#python shutDownSwitch.py &