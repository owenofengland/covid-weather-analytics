#!/bin/bash

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/avg_growth_deaths/avgGrowthDeathsMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/avg_growth_deaths/avgGrowthDeathsReducer.py -mapper "python avgGrowthDeathsMapper.py" -reducer "python avgGrowthDeathsReducer.py" -input /user/joe215/project/analysis/deaths/growth/part-00000 -output /user/joe215/project/analysis/deaths/avg_growth
