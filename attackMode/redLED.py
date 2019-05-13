#!/usr/bin/python

import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.OUT)

def main():
	for x in range(6):
		GPIO.output(4, True)
		time.sleep(.5)
		GPIO.output(4, False)
		time.sleep(.5)

	GPIO.cleanup()

if __name__ == "__main__":
	main()
