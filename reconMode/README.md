#Recon Mode

In this final mode, the war driver has connected to the network. It will do a series of scans on 
the network to gain information about what devices are connected. With the information it will 
start a recon web interface that shows a diagram of the network topology and shows the user pictures 
taken through a hidden camera if someone comes too close. With all this info and a connected device 
inside the network with an SSH tunnel, the user will have a great foothold into the network. 

Tutorial

1. Once connected, have nmap do a fairly deep scan of the devices on the network and log the 
results to a text file. I like to include OS guessing even though it's not always reliable. You
must convert the logged results to a database since nmap doesn't have a built in database output
format. Luckily there is a program called nmapdb made for this specific task. 

2. Create a reverse SSH tunnel to allow the user to remotely control the device over internet. You
must also create an http tunnel to give remote access to the web interface.

3. If you are adding the hidden camera, create another python program that takes snapshots 
whenever motion is detected. This will run in the background and save the pictures to a directory.

4. For the web interface use python and flask again like in the first phase. For the diagram I used
a great javascript library called mermaid that has its own markdown language for creating diagrams.
Create a program that reads the logged devices and builds the markdown script using strings. Then
use flask to render the html page and display the diagram.      

There should be another page of the interface that displays the snapshots taken by the hidden camera
by enumerating the photos in the directory. Use flask to pass the list of filenames to the html 
template and then use javascript to build a list of <img> elements for each file.


