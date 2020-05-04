#!/bin/bash

for i in `hdfs dfs -ls project/data/*jhu/cleaning/*/part-*`
do
	echo "$i"
done

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/growth_cases/growthCasesMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/growth_cases/growthCasesReducer.py -mapper "python growthCasesMapper.py" -reducer "python growthCasesReducer.py" -input /user/joe215/project/data/*jhu/cleaning/*/part-* -output /user/joe215/project/analysis/cases/growth
