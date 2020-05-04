#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	data = line.split(",")

	state = data[1]
	entity = data[2]
	tempmin = data[5]	

	out_record = "%s,%s\t%s" % (state, entity, tempmin)
	print(out_record)

