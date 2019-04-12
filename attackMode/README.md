#Attack Mode

In this mode, the user chooses a target and enters the BSSID. Once triggered, the war driver will
be actively looking out for that chosen network. Once the device is within range of the network
(once it is picking up a strong enough signal) it will trigger the attack. The device will 
start scanning the network for packets in order to capture the handshake packets. Once it has 
those it can begin a brute force attack on the packets and hopefully crack the password in a 
relatively short amount of time. If it is successful the war driver will connect to the network
and begin recon mode. 
