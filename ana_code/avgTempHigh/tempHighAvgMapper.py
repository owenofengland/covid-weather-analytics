#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	data = line.split(",")

	state = data[1]
	entity = data[2]
	temphigh = data[4]
	

	out_record = "%s,%s\t%s" % (state, entity, temphigh)
	print(out_record)

