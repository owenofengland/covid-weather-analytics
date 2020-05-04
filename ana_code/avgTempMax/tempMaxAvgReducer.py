#!/usr/bin/python

import sys

loc_tmax = {}

for line in sys.stdin:
	line = line.strip()
	name, tmax = line.split("\t",1)
	try:
		tmax = float(tmax)
	except ValueError:
		continue

	if name in loc_tmax:
		loc_tmax[name].append(tmax)
	else:
		loc_tmax[name] = []
		loc_tmax[name].append(tmax)


for location in loc_tmax.keys():
	avg_tmax = (sum(loc_tmax[location]) * 1.0) / (len(loc_tmax[location]) * 1.0)
	print("%s\t%s" % (location, avg_tmax))

