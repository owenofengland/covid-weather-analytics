#!/bin/bash

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/avg_growth_cases/avgGrowthCasesMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/avg_growth_cases/avgGrowthCasesReducer.py -mapper "python avgGrowthCasesMapper.py" -reducer "python avgGrowthCasesReducer.py" -input /user/joe215/project/analysis/cases/growth/part-00000 -output /user/joe215/project/analysis/cases/avg_growth
