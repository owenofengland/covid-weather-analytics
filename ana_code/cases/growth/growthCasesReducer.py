#!/usr/bin/python

import sys
from datetime import datetime, timedelta


day_Growth = {}

for line in sys.stdin:
	line = line.strip()
	date, name, cases = line.split("\t", 2)
	try:
		date = datetime.strptime(date, "%Y-%m-%d")
		before = date - timedelta(days=1)
	except Exception as e:
		print(e)
		continue
	try:
		cases = int(cases)
	except ValueError:
		print(e)
		continue
	try:
		if name not in day_Growth.keys():
			day_Growth[name] = {}
		record = [before, cases, None]
		day_Growth[name][date] = record
	except Exception as e:
		print(e)
		continue


for place in day_Growth.keys():
	for date in day_Growth[place].keys():
		before = day_Growth[place][date][0]
		cur_day_count = day_Growth[place][date][1] * 1.0
		if before in day_Growth[place].keys():
			prior_day_count = day_Growth[place][before][1] * 1.0
			if prior_day_count > 0:
				ratio = ((cur_day_count / prior_day_count) - 1.0) * 100.0
			else:
				ratio = (cur_day_count) * 100.0
			day_Growth[place][date][2] = ratio


for place in day_Growth.keys():
	out_record = "%s\t" % (place)
	for date in day_Growth[place].keys():
		ratio = day_Growth[place][date][2]
		if ratio is not None:
			add_to = "%f, " % (ratio)
			out_record += add_to
	print(out_record[:-2])
					

	
'''
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
'''	
