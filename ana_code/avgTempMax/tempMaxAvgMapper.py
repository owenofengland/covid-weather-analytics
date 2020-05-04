#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	data = line.split(",")

	state = data[1]
	entity = data[2]
	tempmax = data[6]	

	out_record = "%s,%s\t%s" % (state, entity, tempmax)
	print(out_record)

