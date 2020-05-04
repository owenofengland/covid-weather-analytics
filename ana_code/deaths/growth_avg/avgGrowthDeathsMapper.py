#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	try:
		name, data = line.split("\t", 1)	
		out_record = "%s\t%s" % (name, data)
		print(out_record)
	except ValueError:
		continue
