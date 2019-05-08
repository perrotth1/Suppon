#!/bin/bash

#This script checks if there are previous logs and if so, saves them to savedLogs/

if find "capFiles" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
	echo "[!] Previous cap files found, deleting"
	#Put if then statement: whether to delete cap files

	#p1=$(ls kismetLogs/SUPPON-*.nettxt)
	#mkdir savedLogs/$p2
	#mv kismetLogs/* savedLogs/$p2
	rm capFiles/*

fi



