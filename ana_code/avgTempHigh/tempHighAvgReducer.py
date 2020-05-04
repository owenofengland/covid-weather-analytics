#!/usr/bin/python

import sys

loc_th = {}

for line in sys.stdin:
	line = line.strip()
	name, th = line.split("\t",1)
	try:
		th = float(th)
	except ValueError:
		continue

	if name in loc_th:
		loc_th[name].append(th)
	else:
		loc_th[name] = []
		loc_th[name].append(th)


for location in loc_th.keys():
	avg_th = (sum(loc_th[location]) * 1.0) / (len(loc_th[location]) * 1.0)
	print("%s\t%s" % (location, avg_th))

