#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	data = line.split(",")
	
	date = data[0].split(" ")[0]
	state = data[1]
	entity = data[2]
	confirmed = data[3]

	out_record = "%s\t%s,%s\t%s" % (date, state, entity, confirmed)	
	print(out_record)
