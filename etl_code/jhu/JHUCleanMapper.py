#!/usr/bin/python
"""JHUCleanMapper.py"""
import sys

for line in sys.stdin:
	line = line.strip()
	line = line.split(",")
	#This if condition skips past the first row in the records which names the columns
	if line[0] != "Time" and line[1] != "State" and line[2] != "Entity":
		#Ensure correct number of columns
		if len(line) == 8:
			# Flag to check if all columns hold data
			flag = True
			for attr in line:
				if attr == None or len(attr) <= 0:
					flag = False
					break
			if flag:
				try:
					date, time = line[0].split(" ")
					state = line[1]
					entity = line[2]
					confirmed = line[3]
					deaths = line[4]
					recovered = line[5]
					latitude = line[6]
					longitude = line[7]
					out_str = date + "," + state + "," + entity + "," + confirmed + "," + deaths + "," + recovered + "," + latitude + "," + longitude
					print("%s\t%s" % (out_str, 1))
				except ValueError:
					pass
