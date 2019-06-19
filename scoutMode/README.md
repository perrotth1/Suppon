#Scout Mode

In this mode the war driver is started by a crontab job at startup. Once the user hits a switch
it begins to scan for networks. It gathers a list of information on each network, including its
physical coordinates. Once the user closes the scan by hitting the switch again, it logs all
the data to a database. The user can then open the scout web interface which provides a map
displaying all of the network locations with some info about them. Different encryption 
protocols will have different colored markers. With this a user can decide on a target for the
attack mode. 

Tutorial

In setting up a project similar to the one I have done here, there are different tasks that will
require specific hardware components along with the raspberry pi. It is best to get these components
and assemble the wardriver before starting the code or else you will be unable to test most tasks.
Here is a list of the components needed:

	- Raspberry Pi with SD Card 
	- Breadboard, wires, LEDs, buttons (You will need these to trigger the attack)
	- Viaboot cable to connect the breadboard
	- RPi Camera (Optional)
	- Network Interface capable of monitor mode 
	- GPS USB Module
	- Some kind of Disguise for the device (optional)

Since this device must be extra portable and discrete it must operate without a screen or keyboard.
It will use only the components listen above. For this reason you must heavily modify your visudo file.
For any program that would require root privileges such as nmap, airmon-ng and many more, you must add
a rule for that program to visudo. This will allow it to run without prompting for the root password, 
which would cause the entire operation to hang since there is no keyboard input.

1. First you will need to create the scouting phase as described above. This phase is the essence
of a war driver. Start by choosing a good network scanning software such as airmon-ng or in my 
case, kismet. This will scan for target networks and so the monitor mode network interface is needed.
It needs to have GPS capability but more importantly it must have text output that can be logged and 
parsed by another program. Have the network scanner be activated by a button on the breadboard using a 
python program so it can be activated while out and about. The LED should serve as a blinking signal 
to report the status of the scanning.

2. After the logs are created, make a program that reads and parses the logged data into a neat 
sql database. For this I used python and sqlite3. Some network scanners might have database 
ouput built in already which would mean you could skip this step.

3. After that is done it's time to make a server to display the logged data. For this I used the 
python flask library to serve a web page. The page uses the google maps javascript library to 
display info about the networks on a map. 

Now you have a neat list of targets shown on a map, along with various information about each
target. You will have everthing you need to move on to the attack phase. 


