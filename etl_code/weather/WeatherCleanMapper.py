#!/usr/bin/python
"""newJHUCleanMapper.py"""
import sys

for line in sys.stdin:
	line = line.strip()
	line = line.split(",")
	#This if condition skips past the first row which names columns
	if line[0] != "Date" and line[1] != "State" and line[2] != "Entity" and line[3] != "Latitude":
		# Ensure correct number of columns
		if len(line) == 20:
			# Flag to check if all columns hold data
			flag = True
			for attr in line:
				if attr is None or len(attr) <= 0:
					flag = False
					break
			if flag:
				try:
					date = line[0]
					state = line[1]
					entity = line[2]
					latitude = line[3]
					longitude = line[4]
					precip = line[5]
					templow = line[6]
					temphigh = line[7]
					tempmin = line[8]
					tempmax = line[9]
					dewpt = line[10]
					windspd = line[11]
					windbear = line[12]
					windgust = line[13]
					pressure = line[14]
					cloudcover = line[15]
					humidity = line[16]
					ozone = line[17]
					visibility = line[18]
					uvidx = line[19]
					out_record = "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s" % (state, entity, date, latitude, longitude, templow, temphigh, tempmin, tempmax, humidity, uvidx)
					print("%s\t%s" % (out_record, "1"))
				except ValueError:
					continue
