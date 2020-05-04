#!/usr/bin/python

import sys

loc_uv = {}

for line in sys.stdin:
	line = line.strip()
	name, uvidx = line.split("\t",1)
	try:
		uvidx = float(uvidx)
	except ValueError:
		continue

	if name in loc_uv:
		loc_uv[name].append(uvidx)
	else:
		loc_uv[name] = []
		loc_uv[name].append(uvidx)


for location in loc_uv.keys():
	avg_uv = (sum(loc_uv[location]) * 1.0) / (len(loc_uv[location]) * 1.0)
	print("%s\t%s" % (location, avg_uv))

