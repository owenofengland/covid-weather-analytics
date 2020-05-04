#!/usr/bin/python
"""CountRecsMapper.py"""
import sys

for line in sys.stdin:
	line = line.strip()
	try:
		print("%s\t%s" % ("Line", 1))
	except ValueError:
		continue
