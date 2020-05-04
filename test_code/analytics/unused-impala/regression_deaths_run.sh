#!/bin/bash

upperDeaths=$(impala-shell -i compute-1-1 -B --quiet -f upper_deaths.sql)
lowerDeaths=$(impala-shell -i compute-1-1 -B --quiet -f lower_deaths.sql)
echo "$upperDeaths"
echo "$lowerDeaths"
impala-shell -i compute-1-1 -f regression_deaths.sql --var=upper=$upperDeaths --var=lower=$lowerDeaths

