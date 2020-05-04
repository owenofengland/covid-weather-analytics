#!/usr/bin/python

import sys

loc_tmin = {}

for line in sys.stdin:
	line = line.strip()
	name, tmin = line.split("\t",1)
	try:
		tmin = float(tmin)
	except ValueError:
		continue

	if name in loc_tmin:
		loc_tmin[name].append(tmin)
	else:
		loc_tmin[name] = []
		loc_tmin[name].append(tmin)


for location in loc_tmin.keys():
	avg_tmin = (sum(loc_tmin[location]) * 1.0) / (len(loc_tmin[location]) * 1.0)
	print("%s\t%s" % (location, avg_tmin))

