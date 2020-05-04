#!/bin/bash

upperCases=$(impala-shell -i compute-1-1 -B --quiet -f upper_cases.sql)
lowerCases=$(impala-shell -i compute-1-1 -B --quiet -f lower_cases.sql)
echo "$upperCases"
echo "$lowerCases"
impala-shell -i compute-1-1 -f correlation_cases.sql --var=upper=$upperCases --var=lower=$lowerCases

