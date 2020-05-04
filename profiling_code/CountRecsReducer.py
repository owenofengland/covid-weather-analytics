#!/usr/bin/python
"""CountRecsReducer.py"""

import sys

total = 0

for line in sys.stdin:
	line = line.strip()
	text, count = line.split("\t", 1)
	try:
		total += int(count)
	except:
		continue

print("%s %s" % ("Line", total))

