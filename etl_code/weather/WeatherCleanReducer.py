#!/usr/bin/python
"""WeatherCleanReducer.py"""
import sys

for line in sys.stdin:
	line = line.strip()
	print(line)
	#line, count = line.split("\t", 1)
	#data = line.split(",")
	
	try:
		count = int(count)
	except Exception as e:
		continue

	try:
		state = data[0]
		entity = data[1]
		date = data[2]
		latitude = data[3]
		longitude = data[4]
		templow = data[5]
		temphigh = data[6]
		tempmin = data[7]
		tempmax = data[8]
		humidity = data[9]
		uvidx = data[10]
		out_data = "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s" % (date, state, entity, templow, temphigh, tempmin, tempmax, humidity, uvidx, latitude, longitude)
		print(out_data)
	except Exception as e:
		continue
