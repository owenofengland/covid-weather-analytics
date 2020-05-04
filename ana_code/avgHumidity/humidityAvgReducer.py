#!/usr/bin/python

import sys

loc_hum = {}

for line in sys.stdin:
	line = line.strip()
	name, humidity = line.split("\t",1)
	try:
		humidity = float(humidity)
	except ValueError:
		continue

	if name in loc_hum:
		loc_hum[name].append(humidity)
	else:
		loc_hum[name] = []
		loc_hum[name].append(humidity)


for location in loc_hum.keys():
	avg_hum = (sum(loc_hum[location]) * 1.0) / (len(loc_hum[location]) * 1.0)
	print("%s\t%s" % (location, avg_hum))
