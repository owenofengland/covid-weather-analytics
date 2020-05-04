#!/usr/bin/python
"""newJHUCleanMapper.py"""
import sys
import re

for line in sys.stdin:
	line = line.strip()
	line = line.split(",")
	#This if condition skips past the first row in the records which names the columns
	if line[0] != "FIPS" and line[1] != "Admin2" and line[2] != "Province_State" and line[3] != "Country_Region":
		#Ensure min correct number of columns
		if len(line) >= 12:
			# Flag to check if all columns hold data
			flag = True
			for attr in line:
				if attr is None or len(attr) <= 0:
					flag = False
					break
			if flag:
				try:
					fips = line[0]
					entity = line[1]
					state = line[2]
					country = line[3]
					date, time = line[4].split(" ")
					latitude = line[5]
					longitude = line[6]
					confirmed = line[7]
					deaths = line[8]
					recovered = line[9]
					active = line[10]
					comb_key = line[11]
					if country == "US":
						out_record = "%s,%s,%s,%s,%s,%s,%s,%s" % (state, entity, date, latitude, longitude, confirmed, deaths, recovered)
						print("%s\t%s" % (out_record, "1"))
				except ValueError:
					continue
