#!/usr/bin/python
"""newJHUCleanReducer.py"""
import sys

for line in sys.stdin:
	line = line.strip()
	line, count = line.split("\t", 1)
	data = line.split(",")
	
	
	try:
		count = int(count)
	except ValueError:
		continue

	try:
		state = str(data[0])
		entity = str(data[1])
		date = str(data[2])
		latitude = float(data[3])
		longitude = float(data[4])
		confirmed = int(data[5])
		deaths = int(data[6])
		recovered = int(data[7])
		out_data = "%s,%s,%s,%d,%d,%d,%f,%f" % (date, state, entity, confirmed, deaths, recovered, latitude, longitude)
		print(out_data)
	except Exception as e:
		continue
