#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	data = line.split(",")

	state = data[1]
	entity = data[2]
	humidity = data[7]
	

	out_record = "%s,%s\t%s" % (state, entity, humidity)
	print(out_record)
