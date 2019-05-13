#!/bin/bash

#This script checks if there are previous logs and if so, saves them to savedLogs/

rm replay_arp*
if find "capFiles" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
	echo "[!] Previous cap files found, deleting"
	rm capFiles/*

fi



