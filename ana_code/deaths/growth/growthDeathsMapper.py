#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	data = line.split(",")
	
	date = data[0].split(" ")[0]
	state = data[1]
	entity = data[2]
	deaths = data[4]

	out_record = "%s\t%s,%s\t%s" % (date, state, entity, deaths)	
	print(out_record)
