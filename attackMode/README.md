#Attack Mode

In this mode, the user chooses a target and enters the BSSID. Once triggered, the war driver will
be actively looking out for that chosen network. Once the device is within range of the network
(once it is picking up a strong enough signal) it will trigger the attack. The device will 
start scanning the network for packets in order to capture the handshake packets. Once it has 
those it can begin a brute force attack on the packets and hopefully crack the password in a 
relatively short amount of time. If it is successful the war driver will connect to the network
and begin recon mode. 

Tutorial 

1. The first step is to create a script where the user can input the name or MAC address of their
chosen target network. 

2. That should then trigger another network scanner, but this time it is only sniffing for that one 
specific network. Have another script running at the same time and reading the network signal
strength. Once the value comes with in the desired range, the script activates the network attack.

3. For WEP networks the attack is fairly straightforward. In my case I used tools included in the
aircrack-ng software suite. Run one program that's listening to the network (like airodump-ng) 
and have another program send an attack. The idea is to get the router to resend handshake packets,
the ones that the user device and router exchange when the device connects. These contain vital
pieces of information used to crack the password. 

4. Once the handshake packets are captured the password cracking can begin. For this I used aircrack
again. This can take some time but once it finds the password it will output it to a file. The 
wardriver now has the password and can connect. For WPA or WPA2 networks the method for getting the
password will be slightly more in depth. 

5. Use a bash script to add the new target network ssid and password to the wpa_supplicant.conf file.
An easy way to connect to the new network is to restart the pi so the scipt should also add to the
rc.local file a job to trigger the recon phase once it boots back up. The rc.local file is where tasks
can be added for the pi to perform at startup. 
 

