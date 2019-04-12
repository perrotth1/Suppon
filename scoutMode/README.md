#Scout Mode

In this mode the war driver is started by a crontab job at startup. Once the user hits a switch
it begins to scan for networks. It gathers a list of information on each network, including its
physical coordinates. Once the user closes the scan by hitting the switch again, it logs all
the data to a database. The user can then open the scout web interface which provides a map
displaying all of the network locations with some info about them. Different encryption 
protocols will have different colored markers. With this a user can decide on a target for the
attack mode. 
