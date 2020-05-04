#!/usr/bin/python
"""JHUCleanReducer.py"""
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
		date = str(data[0])
		state = str(data[1])
		entity = str(data[2])
		confirmed = int(data[3])
		deaths = int(data[4])
		recovered = int(data[5])
		latitude = float(data[6])
		longitude = float(data[7])
		out_data = "%s,%s,%s,%d,%d,%d,%f,%f" % (date, state, entity, confirmed, deaths, recovered, latitude, longitude)
		print(out_data)
	except Exception as e:
		continue
