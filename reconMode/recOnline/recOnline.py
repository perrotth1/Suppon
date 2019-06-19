#!/usr/bin/python

from flask import Flask
from flask import render_template
import sqlite3
import os

app = Flask(__name__)

@app.route('/diagram')
def topology():
	db = sqlite3.connect("/home/henry/Suppon/reconMode/logFiles/nmap_output.db")
	curs = db.cursor()
	routerNode = ""
	dElements = []

	#Find router IP address
	router = str(os.popen("ip route | grep default | awk -F' ' '{print $3}'").read())

	#Locate router info from db
	for row in curs.execute("SELECT * FROM hosts;"):
		if(row[0] == router.strip()):
			routerNode = row[0]

	#Build mermaid.js markdown file

	#Build head node for router
	if(len(routerNode) > 1):
		#If router was found in nmap output
		#Create head node
		for row in curs.execute("SELECT * FROM hosts WHERE ip=\""+routerNode+"\";"):
			elementH = "A(IP: "+routerNode+" <br> NAME: "+row[2]+")"
			dElements.append(elementH)

			infoBar = " ** ".join(str(item) for item in row)
			element = "click A callback \""+infoBar+"\""
			dElements.append(element)
	else:
		#Create head node without info
		elementH = "A("+routerNode+")"
		dElements.append(element)
		element = "click A callback \"No router information\""
		dElements.append(element)

	#Add box style to head
	element = "style A fill:#f9f,stroke:#333,stroke-width:4px"
	dElements.append(element)

	#Build rest of diagram
	x = 0
	for row in curs.execute("SELECT * FROM hosts;"):
		if(row[0] == routerNode):
			continue	#Skip the router since it was added

		#Create box with IP, name
		element = elementH+" --- "+str(x)+"[IP: "+row[0]+" <br> NAME: "+row[2]+"]"
		dElements.append(element)
		#Create click info
		infoBar = " ** ".join(str(item) for item in row)

		print(infoBar)

		element = "click "+str(x)+" callback \""+infoBar+"\""
		dElements.append(element)
		x += 1
	##

	return(render_template('topology.html', mElements=dElements))

@app.route('/camera')
def camera():
	imgDir = str(os.popen("ls static/snapshots").read())
	imgs = imgDir.splitlines()

	for x in range(len(imgs)):
		print(imgs[x])

	return(render_template('camera.html', images=imgs))

if __name__ == "__main__":
	app.run(debug=True)
