#!/usr/bin/python

import sys
import os

for line in sys.stdin:
	line = line.strip()
	data = line.split(",")
	
	date = data[0].split(" ")[0]
	state = data[1]
	entity = data[2]
	confirmed = data[3]

	if date == "2020-03-30":
		out_record = "%s\t%s,%s\t%s" % ("start", state, entity, confirmed)
		print(out_record)
	elif date == "2020-04-09":
		out_record = "%s\t%s,%s\t%s" % ("recent", state, entity, confirmed)
		print(out_record)
