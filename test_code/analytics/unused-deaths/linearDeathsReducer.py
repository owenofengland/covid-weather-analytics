#!/usr/bin/python

import sys

loc_deaths = {}

for line in sys.stdin:
	line = line.strip()
	order, name, deaths = line.split("\t", 2)
	try:
		deaths = float(deaths)
	except ValueError:
		continue


	if name in loc_deaths:
		if order == "start":
			loc_deaths[name][0] = deaths
		elif order == "recent":
			loc_deaths[name][1] = deaths
	else:
		loc_deaths[name] = [None, None]
		if order == "start":
			loc_deaths[name][0] = deaths
		elif order == "recent":
			loc_deaths[name][1] = deaths


for location in loc_deaths.keys():
	# MAKE SURE TO UPDATE THE NUMBER OF DAYS
	try:
		linear = ((loc_deaths[location][1] - loc_deaths[location][0]) * 1.0) / 10.0
		print("%s\t%s" % (location, linear))
	except TypeError:
		continue
		
