#!/bin/bash

cd /home/henry/Suppon/reconMode/

PORT="$(sed '1q;d' sshInfo.txt)"
USER="$(sed '2q;d' sshInfo.txt)"
IP="$(sed '3q;d' sshInfo.txt)"

ssh -N -R $PORT:localhost:22 $USER@$IP &	#Open Reverse Tunnel for SSH Commands

ssh -N -R 5000:localhost:5000 $USER@$IP &		#Open Reverse Tunnel for HTTP Access 







