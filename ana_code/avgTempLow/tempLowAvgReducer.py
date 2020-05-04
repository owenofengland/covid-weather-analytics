#!/usr/bin/python

import sys

loc_tl = {}

for line in sys.stdin:
	line = line.strip()
	name, tl = line.split("\t",1)
	try:
		tl = float(tl)
	except ValueError:
		continue

	if name in loc_tl:
		loc_tl[name].append(tl)
	else:
		loc_tl[name] = []
		loc_tl[name].append(tl)


for location in loc_tl.keys():
	avg_tl = (sum(loc_tl[location]) * 1.0) / (len(loc_tl[location]) * 1.0)
	print("%s\t%s" % (location, avg_tl))

