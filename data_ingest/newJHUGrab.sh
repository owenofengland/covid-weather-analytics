#!/bin/bash

day=$(date '+%d')
month=$(date '+%m')
year=$(date '+%Y')

filename="$month-$day-$year.csv"
url="https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/$filename"

wget $url -P /home/ubuntu/data/jhu/

