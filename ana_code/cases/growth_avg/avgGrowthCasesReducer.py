#!/usr/bin/python

import sys

county_avg = {}

for line in sys.stdin:
	line = line.strip()
	name, data = line.split("\t", 1)
	data = data.split(",")
	for record in data:
		if name not in county_avg:
			county_avg[name] = []
		county_avg[name].append(float(record))

for county in county_avg.keys():
	avg = (sum(county_avg[county]) *1.0) / (len(county_avg[county]) * 1.0)
	print("%s\t%f" % (county, avg))
	
