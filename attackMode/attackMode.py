#!/usr/bin/python

import RPi.GPIO as GPIO
import time
import os

GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.OUT)

def main():
	try:
		print("\n ---{{ SUPPON ATTACK MODE }}--- \n\n")
		BSSID = raw_input("[*] Enter BSSID of Target Network: ")
		print BSSID

		GPIO.output(4, True)
		time.sleep(2)
		GPIO.output(4, False)

		signal = raw_input("\n[*] Enter network signal threshold to begin attack: ")
		print("[*] Starting attack mode. Once in range the attack will begin")

		os.system("sudo airmon-ng start wlan1")

		os.system("sudo airodump-ng wlan1mon")

		os.system("sudo airmon-ng stop wlan1mon")

	except Exception as e:
		print("Error:")
		print(e)
		GPIO.cleanup()

if __name__=="__main__":
	main()
