#!/bin/bash

for i in `hdfs dfs -ls project/data/*jhu/cleaning/*/part-*`
do
	echo "$i"
done

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/growth_deaths/growthDeathsMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/growth_deaths/growthDeathsReducer.py -mapper "python growthDeathsMapper.py" -reducer "python growthDeathsReducer.py" -input /user/joe215/project/data/*jhu/cleaning/*/part-* -output /user/joe215/project/analysis/deaths/growth
