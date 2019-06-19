#!/usr/bin/python

import RPi.GPIO as GPIO
import os
import time
import datetime

GPIO.setmode(GPIO.BCM)
GPIO.setup(24, GPIO.IN)

def main():
	time.sleep(15)
	try:
		while(True):
			if(GPIO.input(24) == True):
				timestamp = datetime.datetime.fromtimestamp(time.time()).strftime("%Y-%m-%d_%H:%M:%S")
				os.system("raspistill -o /home/henry/Suppon/reconMode/recOnline/static/snapshots/"+timestamp+".jpg --nopreview --timeout 300")
				print("PHOTO TAKEN")
				time.sleep(2)
	except Exception as e:
		print(e)
		GPIO.cleanup()

if __name__ == "__main__":
	main()
