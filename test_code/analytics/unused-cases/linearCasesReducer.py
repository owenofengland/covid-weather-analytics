#!/usr/bin/python

import sys

loc_cases = {}

for line in sys.stdin:
	line = line.strip()
	order, name, cases = line.split("\t", 2)
	try:
		cases = float(cases)
	except ValueError:
		continue


	if name in loc_cases:
		if order == "start":
			loc_cases[name][0] = cases
		elif order == "recent":
			loc_cases[name][1] = cases
	else:
		loc_cases[name] = [None, None]
		if order == "start":
			loc_cases[name][0] = cases
		elif order == "recent":
			loc_cases[name][1] = cases


for location in loc_cases.keys():
	# MAKE SURE TO UPDATE THE NUMBER OF DAYS
	try:
		linear = ((loc_cases[location][1] - loc_cases[location][0]) * 1.0) / 10.0
		print("%s\t%s" % (location, linear))
	except TypeError:
		continue
		
