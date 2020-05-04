#!/usr/bin/python
import sys

for line in sys.stdin:
	line = line.strip()
	date, entity, count = line.split("\t", 2)
	try:
		count = int(count)
	except ValueError:
		pass

	try:
		out_str = "%s\t%d" % (entity, count)
		print(out_str)
	except Exception as e:
		pass

