#!/bin/bash

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/avg_tempmin/tempMinAvgMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/avg_tempmin/tempMinAvgReducer.py -mapper "python tempMinAvgMapper.py" -reducer "python tempMinAvgReducer.py" -input /user/joe215/project/data/weather/cleaning/*/part-* -output /user/joe215/project/analysis/tempmin/avg_tempmin
