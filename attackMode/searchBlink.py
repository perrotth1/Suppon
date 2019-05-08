#!/usr/bin/python

import RPi.GPIO as GPIO
import time
import os
import sys

GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.OUT)

def main():
	for x in range(3):
		GPIO.output(4, True)
		time.sleep(.5)
		GPIO.output(4, True)
		time.sleep(.5)

	airCmd = "sudo airodump-ng -c "+sys.argv[1]+" --bssid "+sys.argv[2]+" wlan1mon -w capFiles/psk 2>&1 | tee capFiles/air_output.txt &"
	os.system(airCmd)

if __name__ == "__main__":
	main()
