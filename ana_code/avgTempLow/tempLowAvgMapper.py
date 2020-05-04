#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	data = line.split(",")

	state = data[1]
	entity = data[2]
	templow = data[3]
	

	out_record = "%s,%s\t%s" % (state, entity, templow)
	print(out_record)

