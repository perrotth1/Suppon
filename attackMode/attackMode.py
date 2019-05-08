#!/usr/bin/python

import RPi.GPIO as GPIO
import time
import os

#GPIO.setmode(GPIO.BCM)
#GPIO.setup(4, GPIO.OUT)

def main():
	try:
		print("\n ---{{ SUPPON ATTACK MODE }}--- \n\n")

		BSSID = raw_input("[*] Enter Target BSSID: ")
		print BSSID

		SSID = raw_input("[*] Enter Target SSID: ")
		print SSID

		CHANNEL = raw_input("[*] Enter Target Channel: ")
		print CHANNEL

		#GPIO.output(4, True)
		#time.sleep(2)
		#GPIO.output(4, False)

		SIG = raw_input("\n[*] Enter network signal threshold to begin attack: ")
		print("[*] Starting attack mode. Once in range the attack will begin")
		print("[*] Move towards your target until the red light signals")

		os.system("sudo airmon-ng start wlan1 &")

		os.system("touch capFiles/air_output.txt")

		os.system("sudo ./pwrCheck.sh "+SSID+" "+SIG+" "+BSSID+" "+CHANNEL+" &")
		time.sleep(1)

		os.system("./searchBlink.py "+CHANNEL+" "+BSSID+" &")

		#WEP Attack

	except Exception as e:
		print("\nError:\n")
		print(e)
		os.system("sudo airmon-ng stop wlan1mon 2>/dev/null &")

if __name__=="__main__":
	main()
